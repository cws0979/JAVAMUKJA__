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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.mapper.TalkInter;
import spring.model.mapper.TalkReplyInter;
import spring.model.member.MemberDTO;
import spring.model.talk.TalkDTO;
import spring.model.talk.TalkService;
import spring.utility.javamukja.Utility;


@Controller
public class TalkController {
	
	@Autowired
	private TalkInter inter;
	
	@Autowired
	private TalkReplyInter rinter;
	
	@Autowired
	private TalkService tservice;
	
	@PostMapping("/talk/create")
	public String create(TalkDTO dto,MemberDTO mdto,RedirectAttributes redi,
			HttpServletRequest request) {
		
		String upDir = request.getRealPath("/talk/storage");
		
		int size = (int)dto.getFnameMF().getSize();
		
		if (size > 0) {
			dto.setFname(Utility.saveFileSpring(dto.getFnameMF(), upDir));
		} else {
			dto.setFname("default.jpg");
		}

		int flag = inter.create(dto);
		
		request.setAttribute("flag", flag);
		
		if(flag==1) {
			redi.addFlashAttribute("msg","게시물 등록이 완료되었습니다");
			return "redirect:/talk/list";
		}else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
		
	}
	

	@GetMapping("/talk/create")
	public String create() {
		
		return "/talk/create";
	}
	
	
	@GetMapping("/talk/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
	     String word = Utility.checkNull(request.getParameter("word"));
	     if(col.equals("total")) word = "";
	     
	     //페이지관련-----------------------
	     int nowPage = 1; //현재 보고있는 페이지
	     if(request.getParameter("nowPage")!=null){
	    	 nowPage = Integer.parseInt(request.getParameter("nowPage"));
	     }
	     int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
	     
	     //DB에서 가져올 순번-----------------
	     int sno = ((nowPage-1)*recordPerPage) +1;
	     int eno = nowPage * recordPerPage;
	     
	     
	     Map map = new HashMap();
	     map.put("col", col);
	     map.put("word", word);
	     map.put("sno", sno);
	     map.put("eno", eno);
	
	     
	     int total = inter.total(map);
	     
	     List<TalkDTO> list = inter.list(map);
	     
	     String url = "list";
	     
	     String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
	     
	     request.setAttribute("list", list);
	     request.setAttribute("paging", paging);
	     request.setAttribute("col", col);
	     request.setAttribute("word", word);
	     request.setAttribute("nowPage", nowPage);
	     request.setAttribute("trinter", rinter);
		
		
		return "/talk/list";
	}
	

	@PostMapping("/talk/update")
	public String update(TalkDTO dto,Model model,RedirectAttributes redi,MultipartFile fnameMF, int tno, String oldfile,HttpServletRequest request) {
		
		String upDir = request.getRealPath("/talk/storage");
		String fname = null;
		
	    if(fnameMF.getSize()>0) {
	    	if(oldfile!=null && !oldfile.equals(null))
	    		Utility.deleteFile(upDir, oldfile); //원본파일을 지움.
	    	fname = Utility.saveFileSpring(fnameMF, upDir);
	    	dto.setFname(fname);
	    }
	    
		int flag = inter.update(dto);
			
		if(flag==1) {
			redi.addFlashAttribute("msg","게시물을 수정했습니다.");
			return "redirect:/talk/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error"; 
		}

		
	}
	
	@GetMapping("/talk/update")
	public String update(int tno, Model model) {
		
		model.addAttribute("dto",inter.read(tno));
		return "/talk/update";
		
	}
	
	
	

	@GetMapping("/talk/read")
	public String read(int tno,HttpServletRequest request, Model model, int nowPage, 
			String col, 
			String word) {
		
		inter.upViewcnt(tno);
		
		TalkDTO dto = inter.read(tno);
	
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		Map map =inter.imgRead(tno);
		String files[] = {(String)map.get("PRE_FILE2"),
							(String)map.get("PRE_FILE1"),
							(String)map.get("FNAME"),
							(String)map.get("NEX_FILE1"),
							(String)map.get("NEX_FILE2")};
		
		request.setAttribute("dto", dto);
		request.setAttribute("files", files);
		
	    /* 댓글 관련  시작 */
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("tno", tno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);
		 
		model.addAllAttributes(map);
		 
		/* 댓글 관련 끝 */  
		System.out.print(sno);
		System.out.print(eno);
		System.out.print(tno);
		return "/talk/read";
	}
	

	@PostMapping("/talk/delete")
	public String delete(@RequestParam Map<String, String> map,int tno,TalkDTO dto,
			Model model,RedirectAttributes redi) {
		
/*		Map map = new HashMap();
		map.put("tno", dto.getTno());*/
		
		
		
		int flag = 1;
		try {
			flag = tservice.delete(tno);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		if(flag==1) {
			redi.addFlashAttribute("msg", "게시물을 삭제했습니다.");
			return "redirect:/talk/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}
	
	@GetMapping("/talk/delete")
	public String delete() {
		
		return "/talk/delete";
	}
}
