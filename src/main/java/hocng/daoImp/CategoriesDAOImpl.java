package hocng.daoImp;

import java.util.List;

import hocng.dao.CategoriesDAO;
import hocng.entity.CATEGORIES;
import hocng.utils.XJDBC;
import hocng.utils.XQuery;

public class CategoriesDAOImpl implements CategoriesDAO {

	String insertCategorySQL = "INSERT INTO CATEGORIES(Id, Name) VALUES (?, ?)";
	String updateCategorySQL = "UPDATE CATEGORIES SET Name = ? WHERE Id = ?";
	String deleteCategorySQL = "DELETE FROM CATEGORIES WHERE Id = ?";
	String findAllCategoriesSQL = "SELECT Id, Name FROM CATEGORIES";
	String findCategoryByIdSQL = "SELECT Id, Name FROM CATEGORIES WHERE Id = ?";

	@Override
	public CATEGORIES create(CATEGORIES entity) {
		// TODO Auto-generated method stub
		Object[] values = { entity.getId(), entity.getName() };
		XJDBC.executeUpdate(insertCategorySQL, values);
		return entity;
	}

	@Override
	public void update(CATEGORIES entity) {
		// TODO Auto-generated method stub
		Object[] values = { entity.getName(), entity.getId() };
		XJDBC.executeUpdate(updateCategorySQL, values);

	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		XJDBC.executeUpdate(deleteCategorySQL, id);

	}

	@Override
	public List<CATEGORIES> findAll() {
		// TODO Auto-generated method stub
		return XQuery.getBeanList(CATEGORIES.class, findAllCategoriesSQL);
	}

	@Override
	public CATEGORIES findById(String id) {
		// TODO Auto-generated method stub
		return XQuery.getSingleBean(CATEGORIES.class, findCategoryByIdSQL, id);
	}

}
