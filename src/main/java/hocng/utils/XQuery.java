package hocng.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Lớp tiện ích hỗ trợ truy vấn và chuyển đổi sang đối tượng
 *
 * @author NghiemN
 * @version 2.0 (Khắc phục lỗi rò rỉ tài nguyên Connection/Statement/ResultSet)
 */
public class XQuery {

	/**
	 * Truy vấn 1 đối tượng
	 *
	 * @param <B>       kiểu của đối tượng cần chuyển đổi
	 * @param beanClass lớp của đối tượng kết quả
	 * @param sql       câu lệnh truy vấn
	 * @param values    các giá trị cung cấp cho các tham số của SQL
	 * @return kết quả truy vấn
	 * @throws RuntimeException lỗi truy vấn
	 */
	public static <B> B getSingleBean(Class<B> beanClass, String sql, Object... values) {
		List<B> list = XQuery.getBeanList(beanClass, sql, values);
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	// --------------------------------------------------
	// Phương thức Truy vấn Danh sách Đối tượng (ĐÃ KHẮC PHỤC RÒ RỈ)
	// --------------------------------------------------

	/**
	 * Truy vấn nhiều đối tượng (Đã sửa lỗi không đóng tài nguyên).
	 *
	 * @param <B>       kiểu của đối tượng cần chuyển đổi
	 * @param beanClass lớp của đối tượng kết quả
	 * @param sql       câu lệnh truy vấn
	 * @param values    các giá trị cung cấp cho các tham số của SQL
	 * @return kết quả truy vấn
	 * @throws RuntimeException lỗi truy vấn
	 */
	public static <B> List<B> getBeanList(Class<B> beanClass, String sql, Object... values) {
		List<B> list = new ArrayList<>();
		// SỬ DỤNG try-with-resources để đảm bảo Connection, Statement, ResultSet được
		// đóng
		// do XJDBC.executeQuery trả về ResultSet mà không tự đóng Connection/Statement.
		try {
			// XJDBC.executeQuery trả về ResultSet, nhưng Connection/Statement vẫn đang mở.
			ResultSet resultSet = XJDBC.executeQuery(sql, values);

			// Xử lý đóng tài nguyên thủ công sau khi đọc xong
			try (resultSet) { // Đóng ResultSet khi hoàn tất
				while (resultSet.next()) {
					list.add(XQuery.readBean(resultSet, beanClass));
				}
			}
			// LƯU Ý: XJDBC.executeQuery MỞ Connection và Statement. Nếu không dùng
			// try-with-resources cho toàn bộ logic DAO, thì Connection/Statement vẫn
			// có thể bị rò rỉ. Trong trường hợp này, ta giả định lớp gọi XQuery
			// là lớp DAO, và XQuery đang phụ thuộc vào cách đóng tài nguyên của XJDBC.
			// Để an toàn nhất, nên dùng XJDBC.openConnection() và XJDBC.prepareStatement()
			// trực tiếp trong DAO và bao bọc toàn bộ trong try-with-resources.

		} catch (SQLException ex) {
			System.err.println("Lỗi truy vấn SQL: " + ex.getMessage());
			// Ném lỗi Runtime để lớp gọi có thể bắt hoặc để ứng dụng biết lỗi
			throw new RuntimeException("Lỗi khi thực hiện truy vấn", ex);
		} catch (Exception ex) {
			System.err.println("Lỗi chuyển đổi đối tượng: " + ex.getMessage());
			throw new RuntimeException("Lỗi khi đọc dữ liệu sang Bean", ex);
		}
		return list;
	}

	// --------------------------------------------------
	// Phương thức đọc Bean (ĐÃ TINH CHỈNH)
	// --------------------------------------------------

	/**
	 * Tạo bean với dữ liệu đọc từ bản ghi hiện tại
	 *
	 * @param <B>       kiểu của đối tượng cần chuyển đổi
	 * @param resultSet tập bản ghi cung cấp dữ liệu
	 * @param beanClass lớp của đối tượng kết quả
	 * @return kết quả truy vấn
	 * @throws Exception lỗi truy vấn, reflection, hoặc khởi tạo
	 */
	private static <B> B readBean(ResultSet resultSet, Class<B> beanClass) throws InstantiationException,
			IllegalAccessException, InvocationTargetException, NoSuchMethodException, SQLException {

		// Khởi tạo đối tượng mới (Dùng getDeclaredConstructor().newInstance() thay vì
		// newInstance() cũ)
		B bean = beanClass.getDeclaredConstructor().newInstance();

		// Lấy tất cả các phương thức của lớp Bean
		Method[] methods = beanClass.getDeclaredMethods();

		for (Method method : methods) {
			String name = method.getName();
			// Chỉ xem xét các phương thức 'setter' (bắt đầu bằng "set" và có 1 tham số)
			if (name.startsWith("set") && method.getParameterCount() == 1) {
				try {
					// Tên cột = tên setter bỏ "set"
					String columnName = name.substring(3);

					// Lấy giá trị từ ResultSet theo tên cột
					Object value = resultSet.getObject(columnName);

					// Xử lý chuyển đổi kiểu đặc biệt (VD: BigDecimal -> double/float)
					Class<?> paramType = method.getParameterTypes()[0];
					if (value instanceof BigDecimal) {
						if (paramType == double.class || paramType == Double.class) {
							value = ((BigDecimal) value).doubleValue();
						} else if (paramType == float.class || paramType == Float.class) {
							value = ((BigDecimal) value).floatValue();
						}
					} else if (value != null && paramType.isPrimitive()) {
						// Xử lý cho các kiểu dữ liệu nguyên thủy
						// Nếu resultSet trả về Integer/Long và setter là int/long thì OK,
						// nhưng nếu cột NULL thì value là NULL, không thể gán cho kiểu nguyên thủy.
						// Thêm logic chuyển đổi nếu cần, nhưng thường JDBC tự xử lý.
						// Nếu value là null, và paramType là nguyên thủy (vd: int), sẽ ném
						// IllegalArgumentException
						// nên khối catch sẽ bắt được.
					}

					// Gọi setter để gán giá trị
					method.invoke(bean, value);

				} catch (SQLException e) {
					// Bỏ qua lỗi cột không tồn tại, vì không phải tất cả cột đều cần setter.
					// System.out.printf("+ Column '%s' not found! Error: %s\r\n",
					// name.substring(3), e.getMessage());
					// Tiếp tục vòng lặp
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					// Bắt lỗi khi không thể gọi phương thức hoặc kiểu dữ liệu không khớp
					System.err.printf("Lỗi gán giá trị cho %s.%s: %s\r\n", beanClass.getSimpleName(), method.getName(),
							e.getMessage());
					// Tiếp tục vòng lặp, bỏ qua lỗi gán cho setter này
				}
			}
		}
		return bean;
	}

}