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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.mapper.FindInter;
import spring.model.mapper.RecipeInter;
import spring.model.mapper.RecipeReplyInter;
import spring.model.recipe.RecipeDTO;
import spring.model.recipe.RecipeService;
import spring.utility.javamukja.UploadSave;
import spring.utility.javamukja.Utility;

@Controller
public class RecipeController {

	@Autowired
	private RecipeInter rinter;

	@Autowired
	private FindInter finter;
	
	@Autowired
	private RecipeService rservice;

	@Autowired
	private RecipeReplyInter rrinter;

	@RequestMapping("/recipe/recom")
	public String recom(int rno) {
		
		rinter.recom(rno);
		
		return "redirect:/recipe/list";
	}
	
	@PostMapping("/recipe/delete")
	public String delete(@RequestParam Map<String, String> map, int rno, Model model, RedirectAttributes redi, HttpServletRequest request) {
		
		String upDir = request.getRealPath("/recipe/storage");
		
		String oldfile = request.getParameter("oldfile");
		
		boolean flag = false;
		try {
			rservice.delete(rno);
			if(!oldfile.equals("image.png")){
				UploadSave.deleteFile(upDir, oldfile);
			}
			redi.addFlashAttribute("msg", "레시피를 삭제했습니다");
			return "redirect:/recipe/list";
		} catch (Exception e) {
			model.addAttribute("flag", flag);
			return "error/error";
		}
		
//		int flag = 0;
//			flag=rinter.delete(rno);
//			if(flag==1 && !oldfile.equals("image.png")){
//				UploadSave.deleteFile(upDir, oldfile);
//			}
//		if(flag==1) {
//			redi.addFlashAttribute("msg", "레시피를 삭제했습니다");
//			return "redirect:/recipe/list";
//		}else {
//			request.setAttribute("flag", flag);
//			return "error/error";
//		}
	}

	@GetMapping("/recipe/delete")
	public String delete() {
		return "/recipe/delete";
	}

	@PostMapping("/recipe/update")
	public String update(RecipeDTO dto, Model model, RedirectAttributes redi, HttpServletRequest request, MultipartFile fnameMF) {
		String upDir = request.getRealPath("/recipe/storage");
		String fname = "";
		
		String rno = request.getParameter("rno");
		String oldfile = UploadSave.encode(request.getParameter("oldfile"));
		String col = UploadSave.encode(request.getParameter("col"));
		String word = UploadSave.encode(request.getParameter("word"));
		String nowPage = request.getParameter("nowPage");
		
		if(fnameMF.getSize()>0) {
			if(oldfile!=null && !oldfile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldfile);
			fname = Utility.saveFileSpring(fnameMF, upDir);
			dto.setFname(fname);
		}else {
			dto.setFname(oldfile);
		}
		
		if(fnameMF.getSize()==0) {
			fname = oldfile;
		}
		
		
		boolean flag = rinter.update(dto) > 0;

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("rno", rno);
		
		if (flag) {
			redi.addFlashAttribute("msg", "레시피를 수정했습니다");
			return "redirect:/recipe/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/recipe/update")
	public String update(int rno, Model model) {
		model.addAttribute("dto", rinter.read(rno));
		return "/recipe/update";
	}

	@GetMapping("/recipe/read")
	public String read(int rno, Model model, int nowPage, String col, String word, HttpServletRequest request) {
		rinter.upViewcnt(rno);
		RecipeDTO dto = rinter.read(rno);
		String content = dto.getContent();
		dto.setContent(content.replaceAll("\r\n", "<br>"));

		Map map = rinter.imgRead(rno);

		String files[] = { (String) map.get("PRE_FILE2"), (String) map.get("PRE_FILE1"), (String) map.get("FNAME"),
				(String) map.get("NEX_FILE1"), (String) map.get("NEX_FILE2") };

		java.math.BigDecimal noArr[] = { (java.math.BigDecimal) map.get("PRE_RNO2"),
				(java.math.BigDecimal) map.get("PRE_RNO1"), (java.math.BigDecimal) map.get("RNO"),
				(java.math.BigDecimal) map.get("NEX_RNO1"), (java.math.BigDecimal) map.get("NEX_RNO2") };

		model.addAttribute("dto", dto);
		model.addAttribute("files", files);
		model.addAttribute("noArr", noArr);
		
		/* 댓글 관련 시작 */
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		map = new HashMap();
		
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("rno", rno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);

		model.addAllAttributes(map);
		/* 댓글 관련 끝 */

		return "/recipe/read";
	}

	@PostMapping("/recipe/create")
	public String create(RecipeDTO dto, HttpServletRequest request, RedirectAttributes redi) {
		String upDir = request.getRealPath("/recipe/storage");

		int size = (int) dto.getFnameMF().getSize();

		if (size > 0)
			dto.setFname(Utility.saveFileSpring(dto.getFnameMF(), upDir));
		else
			dto.setFname("image.png");

		int flag = rinter.create(dto);

		request.setAttribute("flag", flag);

		if (flag == 1) {
			redi.addFlashAttribute("msg", "레시피를 등록했습니다");
			return "redirect:/recipe/list";
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/recipe/create")
	public String create() {
		return "/recipe/create";
	}

	@RequestMapping("/recipe/list")
	public String list(HttpServletRequest request) {
		// 검색 관련-----------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if (word.length() > 0) {
			if (word.length() >= 9) {
				col = "title";
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
		// 페이지 관련----------------------------
		int nowPage = 1; // 현재 보고있는 페이지
		// 현재 보고있는 페이지가 1이 아닐때 해당 페이지를 출력 (다시 눌렀을 때)
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 9; // 한 페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번-----------------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = rinter.total(map);

		List<RecipeDTO> list = rinter.list(map);

		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("rrinter", rrinter);

		return "/recipe/list";
	}
}
