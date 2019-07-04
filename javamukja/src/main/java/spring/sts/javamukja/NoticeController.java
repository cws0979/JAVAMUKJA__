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


import spring.model.mapper.NoticeInter;
import spring.model.notice.NoticeDTO;
import spring.utility.javamukja.Utility;

@Controller
public class NoticeController {

	@Autowired
	private NoticeInter ninter;

	@PostMapping("/admin/delete")
	public String delete(@RequestParam Map<String, String> map, int nno, Model model, RedirectAttributes redi) {

		boolean flag = ninter.delete(nno) > 0;
		if (flag) {
			redi.addFlashAttribute("msg", "게시물을 삭제했습니다.");
			return "redirect:/notice/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";

		}

	}

	@GetMapping("/admin/delete")
	public String delete() {
		return "/admin/delete";
	}

	@PostMapping("/admin/update")
	public String update(NoticeDTO dto, Model model, RedirectAttributes redi) {

		boolean flag = ninter.update(dto) > 0;

		if (flag) {
			redi.addFlashAttribute("msg", "게시글을 수정했습니다");
			return "redirect:/notice/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/admin/update")
	public String update(int nno, Model model) {
		model.addAttribute("dto", ninter.read(nno));
		return "/admin/update";
	}

	@GetMapping("/notice/read")
	public String read(int nno, Model model, int nowPage, String col, String word, HttpServletRequest request) {
		ninter.viewcnt(nno);
		NoticeDTO dto = ninter.read(nno);
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));

		model.addAttribute("dto", dto);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "/notice/read";
	}

	@PostMapping("/admin/create")
	public String create(NoticeDTO dto, Model model, RedirectAttributes redi) {
		boolean flag = ninter.create(dto) > 0;
		if (flag) {
			redi.addFlashAttribute("msg", "공지사항을 등록하였습니다");
			return "redirect:/notice/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}

	}

	@GetMapping("/admin/create")
	public String create() {
		return "/admin/create";
	}

	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request) {
		// 검색 관련-----------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";
		// 페이지 관련----------------------------
		int nowPage = 1; // 현재 보고있는 페이지
		// 현재 보고있는 페이지가 1이 아닐때 해당 페이지를 출력 (다시 눌렀을 때)
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번-----------------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = ninter.total(map);

		List<NoticeDTO> list = ninter.list(map);

		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("ninter", ninter);

		return "/notice/list";
	}
}
