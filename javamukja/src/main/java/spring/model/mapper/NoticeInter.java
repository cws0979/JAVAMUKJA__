package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.notice.NoticeDTO;

public interface NoticeInter {

	int create(NoticeDTO dto);

	NoticeDTO read(int nno);

	int update(NoticeDTO dto);

	int delete(int nno);

	List<NoticeDTO> list(Map map);

	int total(Map map);
	
	void viewcnt(int nno);


}