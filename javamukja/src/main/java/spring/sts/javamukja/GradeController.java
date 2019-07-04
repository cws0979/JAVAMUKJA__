package spring.sts.javamukja;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.grade.GradeDTO;
import spring.model.grade.GradeService;
import spring.model.mapper.GradeInter;
import spring.model.mapper.GradeReplyInter;
import spring.utility.javamukja.Utility;

@Controller
public class GradeController {

	@Autowired
	private GradeService gservice;

	@Autowired
	private GradeInter ginter;

	@Autowired
	private GradeReplyInter grinter;

	@PostMapping("/grade/delete")
	public String delete(@RequestParam Map<String, String> map, int gno, Model model, RedirectAttributes redi,
			HttpServletRequest request) {

//		try {
//		   gservice.delete(gno);
//			return "redirect:/grade/list";
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "error/error";
//
//		}
		boolean flag = false;
		try {
			gservice.delete(gno);
			redi.addFlashAttribute("msg","게시물을 삭제했습니다.");
			return "redirect:/grade/list";
		}catch(Exception e){
		model.addAttribute("flag", flag);
		return "error/error";
		}
	}

	@GetMapping("/grade/delete")
	public String delete() {

		return "/grade/delete";
	}

	@PostMapping("/grade/update")
	public String update(GradeDTO dto, Model model, int gno, RedirectAttributes redi) {

		int flag = ginter.update(dto);

		if (flag == 1) {
			redi.addFlashAttribute("msg", "게시물을 수정했습니다.");
			return "redirect:/grade/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/grade/update")
	public String update(int gno, Model model) {

		model.addAttribute("dto", ginter.read(gno));

		return "/grade/update";
	}

	@GetMapping("/grade/read")
	public String read(int gno, Model model, HttpServletRequest request, int nowPage, String col, String word) {

		GradeDTO dto = ginter.read(gno);

		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));

		model.addAttribute("dto", dto);

		/* 댓글 관련 시작 */

		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("gno", gno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);

		model.addAllAttributes(map);

		/* 댓글 관련 끝 */

		return "/grade/read";
	}

	@RequestMapping("/grade/list")
	public String list(HttpServletRequest request, GradeDTO dto) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total"))
			word = "";

		// 페이지관련-----------------------
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; // 한페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = ginter.total(map);

		List<GradeDTO> list = ginter.list(map);

		String url = "list";

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);		
		request.setAttribute("grinter", grinter);

		return "/grade/list";
	}

	@PostMapping("/grade/create")
	public String create(GradeDTO dto, Model model, RedirectAttributes redi) {

		String url = "";
		boolean flag = ginter.create(dto) > 0;

		if (flag) {
			redi.addFlashAttribute("msg", "게시글을 등록했습니다.");
			return "redirect:/grade/list";
		} else {
			model.addAttribute("flag", false);
			return "error/error";
		}
	}

	@GetMapping("/grade/create")
	public String create() {

		return "/grade/create";
	}

//	@PostMapping("/grade/reply")
//	public String reply(GradeDTO dto, Model model, RedirectAttributes redi) {
//
//		try {
//			service.reply(dto);
//			redi.addFlashAttribute("msg", "답변을 등록했습니다.");
//			return "redirect:/grade/list";
//		} catch (Exception e) {
//			model.addAttribute("flag", false);
//			return "error/error";
//		}
//
//	}
//
//	@GetMapping("/grade/reply")
//	public String reply(int gno, Model model) {
//
//		model.addAttribute("dto", ginter.readReply(gno));
//
//		return "/grade/reply";
//	}
}
