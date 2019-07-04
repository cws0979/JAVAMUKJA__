package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.recipeReply.RecipeReplyDTO;

public interface RecipeReplyInter {
	int create(RecipeReplyDTO dto);
	RecipeReplyDTO read(int rrno);
	int update(RecipeReplyDTO dto);
	int delete(int rrno);
	int rdelete(int rno);
	List<RecipeReplyDTO> list(Map map);
	int total(int rno);
	int rcount(int rno);
}