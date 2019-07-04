package spring.model.recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.RecipeInter;
import spring.model.mapper.RecipeReplyInter;

@Service
public class RecipeService implements RecipeServiceInter{
	@Autowired
	private RecipeInter rinter;

	@Autowired
	private RecipeReplyInter rrinter;

	public void delete(int rno) throws Exception{
        rrinter.rdelete(rno);
        rinter.delete(rno);
	}
}