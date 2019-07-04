package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.find.FindDTO;

public interface FindInter {
	
	int create(String fstr);
	List<FindDTO> list(Map map);
	void upFcnt(int fno);
	int check(String fstr);
	String fstrCheck(String fstr);
	int total(Map map);
	List<FindDTO> rank();
	FindDTO read(int fno);
	int update(FindDTO dto);
	int delete(int fno);
	List<FindDTO> list2();
	void deleteAll();
}
