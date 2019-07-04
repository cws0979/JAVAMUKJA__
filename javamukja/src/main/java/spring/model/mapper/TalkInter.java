package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.talk.TalkDTO;

public interface TalkInter {
	int create(TalkDTO dto);
	int delete(int tno);
	List<TalkDTO> list (Map map);
	int total (Map map);
	int update(TalkDTO dto);
	TalkDTO read(int tno);
//	int updateFile(Map map);
	Map imgRead(int tno);
	int upViewcnt(int tno);
	//int passCheck(Map map);
	TalkDTO readReply(int tno);
	
}
