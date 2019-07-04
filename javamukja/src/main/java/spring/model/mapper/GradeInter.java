package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.grade.GradeDTO;

public interface GradeInter {
	
	int create(GradeDTO dto);
	GradeDTO read(int gno);
	int update(GradeDTO dto);
	int delete(int gno);
	List<GradeDTO> list(Map map);
	int total(Map map);
	GradeDTO readReply(int gno);
	void upAnsnum(Map map);
	int createReply(GradeDTO dto);
	int passCheck(Map map);
	int refnumCheck(int gno);
	void upViewcnt(int gno);
	
}
