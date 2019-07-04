package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.gradeReply.GradeReplyDTO;

public interface GradeReplyInter {

	int create(GradeReplyDTO dto);
	GradeReplyDTO read(int grno);
	int update(GradeReplyDTO dto);
	int delete(int grno);
	List<GradeReplyDTO> list(Map map);
	int total(int gno);
	int gradecount(int gno);
	int gdelete(int gno);
	
}
