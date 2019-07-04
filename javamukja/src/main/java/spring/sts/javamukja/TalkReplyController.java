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

import spring.model.mapper.TalkReplyInter;
import spring.model.talkReply.TalkReplyDTO;
import spring.utility.javamukja.Utility;

@RestController
public class TalkReplyController {

		private static final Logger log = LoggerFactory.getLogger(HomeController.class);

		@Autowired
		private TalkReplyInter replyInter;
		
		@GetMapping("/talk/reply/page")
		public ResponseEntity<String> getPage(
		@RequestParam("nPage") int nPage,
		@RequestParam("nowPage") int nowPage,
		@RequestParam("tno") int tno,
		@RequestParam("col") String col,
		@RequestParam("word") String word
		) {
		 
		 
		 int total = replyInter.total(tno);
		 String url = "read";
		 
		 int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		 String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, tno);
		 
		return new ResponseEntity<>(paging, HttpStatus.OK);
		 
		}

		@PostMapping("/talk/reply/create")
		public ResponseEntity<String> create(@RequestBody TalkReplyDTO vo) {

			log.info("ReplyDTO1: " + vo.getContent());
			log.info("ReplyDTO1: " + vo.getId());
			log.info("ReplyDTO1: " + vo.getTno());

			vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));

			int flag = replyInter.create(vo);

			log.info("Reply INSERT flag: " + flag);

			return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		@GetMapping("/talk/reply/{trno}")
		public ResponseEntity<TalkReplyDTO> get(@PathVariable("trno") int trno) {

			log.info("get: " + trno);

			return new ResponseEntity<>(replyInter.read(trno), HttpStatus.OK);
			//ReplyDTO의 결과값이 json형싱ㄱ이기때문에 return형도 json형식임
		}

		@PutMapping("/talk/reply/{trno}")
		public ResponseEntity<String> modify(@RequestBody TalkReplyDTO vo, @PathVariable("trno") int trno) {

			vo.setTrno(trno);
			vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
			log.info("trno: " + trno);
			log.info("modify: " + vo);

			return replyInter.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}

		@DeleteMapping("/talk/reply/{trno}")
		public ResponseEntity<String> remove(@PathVariable("trno") int trno) {

			log.info("remove: " +trno);

			return replyInter.delete(trno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}

		@GetMapping("/talk/reply/list/{tno}/{sno}/{eno}")
		public ResponseEntity<List<TalkReplyDTO>> getList(@PathVariable("tno") int tno, @PathVariable("sno") int sno,
				@PathVariable("eno") int eno) {

			Map map = new HashMap();
			map.put("tno", tno);
			map.put("sno", sno);
			map.put("eno", eno);
			
			return new ResponseEntity<List<TalkReplyDTO>>(replyInter.list(map), HttpStatus.OK);
		}
	}

