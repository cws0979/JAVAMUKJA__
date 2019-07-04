package spring.sts.javamukja;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.mapper.RecipeReplyInter;
import spring.model.recipeReply.RecipeReplyDTO;
import spring.utility.javamukja.Utility;

@RestController
public class RecipeReplyController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RecipeReplyInter recipeReplyInter;
	
	@PutMapping("/recipe/reply/{rrno}")
	public ResponseEntity<String> modify(
			@RequestBody RecipeReplyDTO vo, 
			@PathVariable("rrno") int rrno) {
	 
		log.info("rrno: " + rrno);
		log.info("modify: " + vo);
	 
		return recipeReplyInter.update(vo) == 1
				? new ResponseEntity<>("modify success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	 
	@DeleteMapping("/recipe/reply/{rrno}")
	public ResponseEntity<String> remove(@PathVariable("rrno") int rrno) {
	 
		log.info("remove: " + rrno);
	 
		return recipeReplyInter.delete(rrno) == 1
				? new ResponseEntity<>("delete success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/recipe/reply/{rrno}")
	public ResponseEntity<RecipeReplyDTO> get(@PathVariable("rrno") int rrno) {
	 
	log.info("get: " + rrno);
	 
	return new ResponseEntity<>(recipeReplyInter.read(rrno), HttpStatus.OK);
	}
	
	@GetMapping("/recipe/reply/page")
	public ResponseEntity<String> getPage(
		@RequestParam("nPage") int nPage,
		@RequestParam("nowPage") int nowPage,
		@RequestParam("rno") int rno,
	    @RequestParam("col") String col,
	    @RequestParam("word") String word
	) {
	 
	 int total = recipeReplyInter.total(rno);
	 String url = "read";
	 
	 int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
	 
	 String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, rno);
	 
	 return new ResponseEntity<>(paging, HttpStatus.OK);
	 
	}
	
	@GetMapping("/recipe/reply/list/{rno}/{sno}/{eno}")
	public ResponseEntity<List<RecipeReplyDTO>> getList(
			@PathVariable("rno") int rno, 
			@PathVariable("sno") int sno,
			@PathVariable("eno") int eno) {

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("rno", rno);

		return new ResponseEntity<List<RecipeReplyDTO>>(recipeReplyInter.list(map), HttpStatus.OK);
	}

	@PostMapping("/recipe/reply/create")
	public ResponseEntity<String> create(@RequestBody RecipeReplyDTO vo) {

		log.info("RecipeReplyDTO1: " + vo.getContent());
		log.info("RecipeReplyDTO1: " + vo.getId());
		log.info("RecipeReplyDTO1: " + vo.getRno());

		vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));

		int flag = recipeReplyInter.create(vo);

		log.info("Reply INSERT flag: " + flag);

		return flag == 1 ? new ResponseEntity<>("create success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
