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

import spring.model.gradeReply.GradeReplyDTO;
import spring.model.mapper.GradeReplyInter;
import spring.utility.javamukja.Utility;

@RestController
public class GradeReplyController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private GradeReplyInter grinter;
	
	
	@PutMapping("/grade/gradereply/{grno}")
	public ResponseEntity<String> modify(
			@RequestBody GradeReplyDTO vo, 
			@PathVariable("grno") int grno) {

		vo.setGrno(grno);
		log.info("grno: " + grno);
		log.info("modify: " + vo);
		 
		return grinter.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 
	}
	
	@DeleteMapping("/grade/gradereply/{grno}")
	public ResponseEntity<String> remove(@PathVariable("grno") int grno) {
	 
	log.info("remove: " + grno);
	 
	return grinter.delete(grno) == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@GetMapping("/grade/gradereply/{grno}")
	public ResponseEntity<GradeReplyDTO> get(
			@PathVariable("grno") int grno) {

		log.info("get: " + grno);

		return new ResponseEntity<>(grinter.read(grno), HttpStatus.OK);
	}

	@GetMapping("/grade/gradereply/page")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
			@RequestParam("gno") int gno, @RequestParam("col") String col, @RequestParam("word") String word) {

		int total = grinter.total(gno);

		String url = "read";

		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		
		String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, gno);

		return new ResponseEntity<>(paging, HttpStatus.OK);

	}

	@GetMapping("/grade/gradereply/list/{gno}/{sno}/{eno}")
	public ResponseEntity<List<GradeReplyDTO>> getList(@PathVariable("gno") int gno, @PathVariable("sno") int sno,
			@PathVariable("eno") int eno) {

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("gno", gno);

		return new ResponseEntity<List<GradeReplyDTO>>(grinter.list(map), HttpStatus.OK);

	}

	@PostMapping("/grade/gradereply/create")
	public ResponseEntity<String> create(@RequestBody GradeReplyDTO vo) {

		log.info("GradeReplyDTO1: " + vo.getContent());
		log.info("GradeReplyDTO1: " + vo.getId());
		log.info("GradeReplyDTO1: " + vo.getGno());

		vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));

		int flag = grinter.create(vo);

		log.info("GradeReply INSERT flag: " + flag);

		return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
