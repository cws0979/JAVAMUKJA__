package spring.model.talk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.TalkInter;
import spring.model.mapper.TalkReplyInter;

@Service
public class TalkService {
	@Autowired
	private TalkInter tinter;
	@Autowired
	private TalkReplyInter trinter;
	

	public int delete(int tno) throws Exception{
		int res = 0;
		
		res = trinter.tdelete(tno);
		res = tinter.delete(tno);
        
        return res; 
	}


}
