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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.find.FindDTO;
import spring.model.mapper.FindInter;
import spring.utility.javamukja.Utility;

@Controller
public class FindController {

	@Autowired
	private FindInter finter;
	
	
	@PostMapping("/find/deleteAll")
	public String deleteAll(@RequestParam Map<String, String> map, Model model, RedirectAttributes redi,
			HttpServletRequest request) {

		boolean flag = false;
		try {
			finter.deleteAll();
			return "redirect:/find/list";
		}catch(Exception e){
		model.addAttribute("flag", flag);
		return "error/error";
		}
	}

	@GetMapping("/find/deleteAll")
	public String deleteAll() {

		return "/find/deleteAll";
	}
	
	
	@ResponseBody
	@RequestMapping("/find/list2")
	public List<FindDTO> list2(HttpServletRequest request) {
				

		List<FindDTO> list2 = finter.list2();
		
		request.setAttribute("list2", list2);

		
		return list2;
	}
	
	
	@ResponseBody
	@RequestMapping("find/rank")
	public List<FindDTO> rank(HttpServletRequest request,Model model) {
		
		List<FindDTO> rank = finter.rank();
		
		request.setAttribute("rank", rank);
		
		return rank;
	}
	
	@RequestMapping("/find/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (word.length() > 0) {
			if (word.length() >= 9) {
				word = "";
			}

			finter.check(word);
			
			String fno = finter.fstrCheck(word);
			
			if (fno == null) {
				finter.create(word);
			} else if(Integer.parseInt(fno) > 0) {
				finter.upFcnt(Integer.parseInt(fno));
			}
			
		}
		
		if (col.equals("total"))
			word = "";

		// 페이지관련-----------------------
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10; // 한페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = finter.total(map);

		List<FindDTO> list = finter.list(map);

		String url = "list";

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("finter", finter);
		
		
		
		return "/find/list";
	}
	
	@PostMapping("/find/create")
	public String create(String fstr, Model model, RedirectAttributes redi) {
		boolean flag = finter.create(fstr) > 0;

		return "";
	}
	
	
	@PostMapping("/find/delete")
	public String delete(@RequestParam Map<String, String> map, int fno, Model model, RedirectAttributes redi,
			HttpServletRequest request) {

		boolean flag = false;
		try {
			finter.delete(fno);
			redi.addFlashAttribute("msg","게시물을 삭제했습니다.");
			return "redirect:/find/list";
		}catch(Exception e){
		model.addAttribute("flag", flag);
		return "error/error";
		}
	}

	@GetMapping("/find/delete")
	public String delete() {

		return "/find/delete";
	}

	@PostMapping("/find/update")
	public String update(FindDTO dto, Model model, int fno, RedirectAttributes redi) {

		int flag = finter.update(dto);

		if (flag == 1) {
			redi.addFlashAttribute("msg", "게시물을 수정했습니다.");
			return "redirect:/find/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/find/update")
	public String update(int fno, Model model) {

		model.addAttribute("dto", finter.read(fno));

		return "/find/update";
	}

	@GetMapping("/find/read")
	public String read(int fno, Model model, HttpServletRequest request, int nowPage, String col, String word) {

		FindDTO dto = finter.read(fno);

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
		map.put("fno", fno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);

		model.addAllAttributes(map);

		/* 댓글 관련 끝 */

		return "/find/read";
	}
	

}
