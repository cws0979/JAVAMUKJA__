package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.talkReply.TalkReplyDTO;

public interface TalkReplyInter {
	int create(TalkReplyDTO dto);
	TalkReplyDTO read(int trno);
	int update(TalkReplyDTO dto);
	List<TalkReplyDTO >list(Map map);
	int total (int trno);
	int rcount(int trno);
	int upAnsnum(Map map);
	int delete(int trno);
	int tdelete(int tno);
}
