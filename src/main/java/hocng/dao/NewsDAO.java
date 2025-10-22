package hocng.dao;

import java.util.List;

import hocng.entity.NEWS;

public interface NewsDAO extends CurdDAO<NEWS, String> {
	List<NEWS> findByCategory(String categoryId);

	List<NEWS> findByAuthor(String authorId);
}
