package spring.model.grade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.mapper.GradeInter;
import spring.model.mapper.GradeReplyInter;

@Repository
public class GradeService {
	
	@Autowired
	private GradeReplyInter grinter;
		
	@Autowired
	private GradeInter ginter;
		
	public void delete(int gno) throws Exception {
			
		grinter.gdelete(gno);
		ginter.delete(gno);
		
	}
}
