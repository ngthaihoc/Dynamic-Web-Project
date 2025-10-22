package hocng.daoImp;

import java.util.List;

import hocng.dao.NewsDAO;
import hocng.entity.NEWS;
import hocng.utils.XJDBC;
import hocng.utils.XQuery;

public class NewsDAOImpl implements NewsDAO {
	String insertNewsSQL = "INSERT INTO NEWS(Id, Title, Content, Image, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	String updateNewsSQL = "UPDATE NEWS SET Title = ?, Content = ?, Image = ?, Author = ?, ViewCount = ?, CategoryId = ?, Home = ? WHERE Id = ?";
	String deleteNewsSQL = "DELETE FROM NEWS WHERE Id = ?";
	String findAllNewsSQL = "SELECT Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home FROM NEWS";
	String findNewsByIdSQL = "SELECT Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home FROM NEWS WHERE Id = ?";
	String findNewsByCategorySQL = "SELECT Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home FROM NEWS WHERE CategoryId = ?";
	String findNewsByAuthorSQL = "SELECT Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home FROM NEWS WHERE Author = ?";
	String findHomeNewsSQL = "SELECT Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home FROM NEWS WHERE Home = 1";
	String increaseViewCountSQL = "UPDATE NEWS SET ViewCount = ViewCount + 1 WHERE Id = ?";

	@Override
	public NEWS create(NEWS entity) {
		// TODO Auto-generated method stub
		Object[] values = { entity.getId(), entity.getTitle(), entity.getContent(), entity.getImage(),
				entity.getAuthor(), entity.getViewCount(), entity.getCategoryId(), entity.isHome() };
		XJDBC.executeUpdate(insertNewsSQL, values);
		return entity;
	}

	@Override
	public void update(NEWS entity) {
		// TODO Auto-generated method stub
		Object[] values = { entity.getTitle(), entity.getContent(), entity.getImage(), entity.getAuthor(),
				entity.getViewCount(), entity.getCategoryId(), entity.isHome(), entity.getId() };
		XJDBC.executeUpdate(updateNewsSQL, values);

	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		XJDBC.executeUpdate(deleteNewsSQL, id);

	}

	@Override
	public List<NEWS> findAll() {
		// TODO Auto-generated method stub
		return XQuery.getBeanList(NEWS.class, findAllNewsSQL);
	}

	@Override
	public NEWS findById(String id) {
		// TODO Auto-generated method stub
		return XQuery.getSingleBean(NEWS.class, findNewsByIdSQL, id);
	}

}
