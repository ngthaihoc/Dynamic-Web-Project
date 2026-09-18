package hocng.dao;

import hocng.entity.USERS;

import java.util.List;

public interface UsersDAO extends CurdDAO<USERS, String> {
	List<USERS> findByRole(boolean role);
}
