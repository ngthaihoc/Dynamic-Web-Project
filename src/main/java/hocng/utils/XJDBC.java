package hocng.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Lớp tiện ích hỗ trợ làm việc với CSDL quan hệ (JDBC Helper) PHIÊN BẢN NÀY SẼ
 * TỰ BẮT VÀ XỬ LÝ SQLEXCEPTION.
 *
 * @author Hoc (based on original code by NghiemN)
 */
public class XJDBC {

	// 1. Cấu hình kết nối (Không đổi)
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String DBURL_WINDOW_AUTH = "jdbc:sqlserver://LAPTOPCUAWELLY:1433;"
			+ "databaseName=HRM;integratedSecurity=true;" + "encrypt=true;trustServerCertificate=true;";

	// Khối static: Tải Driver (Không đổi)
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			System.err.println("Lỗi: Không tìm thấy Driver SQL Server.");
			throw new RuntimeException("Không thể tải Driver SQL Server.", e);
		}
	}

	// Phương thức ghi log lỗi SQL (Không đổi)
	private static void logSQLException(SQLException ex) {
		System.err.println("--- SQL Exception Occurred ---");
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.err.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
		System.err.println("------------------------------");
	}

	// Các phương thức cơ bản (Không đổi)
	public static Connection openConnection() throws SQLException {
		return DriverManager.getConnection(DBURL_WINDOW_AUTH);
	}

	public static PreparedStatement prepareStatement(Connection conn, String sql, Object... values)
			throws SQLException {
		PreparedStatement stmt = sql.trim().startsWith("{") ? conn.prepareCall(sql) : conn.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			stmt.setObject(i + 1, values[i]);
		}
		return stmt;
	}

	@SuppressWarnings("unchecked")
	public static <T> T execute(PreparedStatement stmt, boolean isQuery) throws SQLException {
		if (isQuery) {
			return (T) stmt.executeQuery();
		} else {
			return (T) Integer.valueOf(stmt.executeUpdate());
		}
	}

	// --------------------------------------------------
	// CÁC PHƯƠNG THỨC CÔNG KHAI ĐÃ ĐƯỢC SỬA ĐỔI
	// --------------------------------------------------

	/**
	 * Thực thi DML. Sẽ không ném SQLException ra ngoài.
	 * 
	 * @return Số dòng bị ảnh hưởng, hoặc 0 nếu có lỗi xảy ra.
	 */
	public static int executeUpdate(String sql, Object... values) {
		try (Connection conn = openConnection(); PreparedStatement stmt = prepareStatement(conn, sql, values)) {
			return execute(stmt, false);
		} catch (SQLException e) {
			System.err.println("Lỗi trong executeUpdate với SQL: " + sql);
			logSQLException(e);
			return 0; // Trả về 0 khi có lỗi
		}
	}

	/**
	 * Thực thi truy vấn. Sẽ không ném SQLException ra ngoài.
	 * 
	 * @return ResultSet nếu thành công, hoặc null nếu có lỗi.
	 */
	public static ResultSet executeQuery(String sql, Object... values) {
		try {
			Connection conn = openConnection();
			PreparedStatement stmt = prepareStatement(conn, sql, values);
			return execute(stmt, true);
		} catch (SQLException e) {
			System.err.println("Lỗi trong executeQuery với SQL: " + sql);
			logSQLException(e);
			// Không cần đóng tài nguyên ở đây vì nếu lỗi, chúng chưa được tạo
			// hoặc sẽ được xử lý bởi lớp gọi khi thấy kết quả là null.
			return null; // Trả về null khi có lỗi
		}
	}

	/**
	 * Truy vấn một giá trị. Sẽ không ném SQLException ra ngoài.
	 * 
	 * @return Giá trị truy vấn nếu thành công, hoặc null nếu không tìm thấy hoặc có
	 *         lỗi.
	 */
	public static <T> T getValue(String sql, Class<T> type, Object... values) {
		try (Connection conn = openConnection();
				PreparedStatement stmt = prepareStatement(conn, sql, values);
				ResultSet resultSet = execute(stmt, true)) {

			if (resultSet.next()) {
				Object value = resultSet.getObject(1);
				return type.cast(value);
			}
			return null;
		} catch (SQLException e) {
			System.err.println("Lỗi trong getValue với SQL: " + sql);
			logSQLException(e);
			return null; // Trả về null khi có lỗi
		}
	}

	// Phương thức main để kiểm tra (không đổi)
	public static void main(String[] args) {
		try {
			System.out.println("Dang kiem tra ket noi den CSDL...");
			try (Connection conn = openConnection()) {
				if (conn != null && !conn.isClosed()) {
					System.out.println("Ket noi den database thanh cong: " + conn.getCatalog());
				} else {
					System.out.println("Ket noi that bai (Ket noi bi dong ngay sau khi mo).");
				}
			}
		} catch (SQLException e) {
			System.err.println("Ket noi that bai do loi. Chi tiet:");
			logSQLException(e);
		}
	}
}