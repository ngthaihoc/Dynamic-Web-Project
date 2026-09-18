package hocng.dao;

import java.util.List;
import hocng.entity.NEWSLETTERS;

public interface NewletterDAO extends CurdDAO<NEWSLETTERS, String> {
	List<NEWSLETTERS> findActive();
}
