package spring.sts.javamukja;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.mapper.MemberInter;
import spring.model.member.MemberDTO;
import spring.utility.javamukja.Utility;

@Controller
public class MemberController {

	@Autowired
	private MemberInter minter;

	@GetMapping("/member/agreement")
	public String agree() {

		return "/member/agree";
	}
	
	@PostMapping("/member/create")
	public String create() {
		
		return "/member/create";
	}

	@PostMapping("/member/createProc")
	public String createProc(@ModelAttribute MemberDTO dto, HttpServletRequest request, RedirectAttributes redi) {

		String str = "";
		String url = "/member/precreate";

		if (minter.duplicateId(dto.getId()) == 1) {
			str = "중복된 ID입니다. <br> 중복확인을 해주세요.";
			request.setAttribute("msg", str);
		} else if (minter.duplicateEmail(dto.getEmail()) == 1) {
			str = "중복된 Email입니다. <br> 중복확인을 해주세요.";
			request.setAttribute("msg", str);
		} else {
			String basePath = request.getRealPath("/member/storage");
			String fname = null;
			int size = (int) dto.getFnameMF().getSize();

			if (size > 0) {
				fname = Utility.saveFileSpring(dto.getFnameMF(), basePath);
			} else {
				fname = "member.jpg";
			}

			dto.setFname(fname);

			int flag = minter.create(dto);
			if (flag == 1) {
				redi.addFlashAttribute("msg", "회원등록을 완료했습니다.");
				url = "redirect:/";
			} else {
				request.setAttribute("flag", false);
				url = "member/error";
			}
		}

		return url;
	}
	
	@ResponseBody // data 바로받기(비동기 통신방법이지만 메시지로 직접 받음)
	@GetMapping(value = "/member/idCheck", produces = "text/plain;charset=utf-8")
	public String idCheck(String id) {

		int flag = minter.duplicateId(id);
		String str = "";

		if (flag == 1) {
			str = id + "는(은) 중복되어 사용할 수 없습니다.";
		} else {
			str = id + "는(은) 중복이 아니므로 사용할 수 있습니다.";
		}

		return str;
	}

	@ResponseBody
	@GetMapping(value = "/member/emailCheck", produces = "text/plain;charset=utf-8")
	public String emailCheck(String email) {

		int flag = minter.duplicateEmail(email);
		String str = "";

		if (flag == 1) {
			str = email + "는(은) 중복되어 사용할 수 없습니다.";
		} else {
			str = email + "는(은) 사용할 수 있습니다.";
		}

		return str;
	}
	
	@ResponseBody
	@GetMapping(value = "/member/nickCheck", produces = "text/plain;charset=utf-8")
	public String nickCheck(String nickname) {

		int flag = minter.duplicateNick(nickname);
		String str = "";

		if (flag == 1) {
			str = nickname + "는(은) 중복되어 사용할 수 없습니다.";
		} else {
			str = nickname + "는(은) 사용할 수 있습니다.";
		}

		return str;
	}
	

	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpServletResponse response, HttpSession session,
			RedirectAttributes redi, String c_id, Model model) {

		int flag = minter.loginCheck(map);
		String grade = null; // d 회원등급 저장할 변수

		if (flag == 1) {
			grade = minter.getGrade(map.get("id"));
			session.setAttribute("id", map.get("id"));
			session.setAttribute("grade", grade);
			// ----------------------------------------------
			// Cookie 저장, Checkbox는 선택하지 않으면 null 임
			// ----------------------------------------------
			Cookie cookie = null;

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(120);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

		}

		if (flag == 1) {
			if (map.get("rurl") != null && !map.get("rurl").equals("")) {

				redi.addAttribute("rno", map.get("rno"));
				redi.addAttribute("tno", map.get("tno"));
				redi.addAttribute("nno", map.get("nno"));				
				redi.addAttribute("gno", map.get("gno"));
				redi.addAttribute("nowPage", map.get("nowPage"));
				redi.addAttribute("nPage", map.get("nPage"));
				redi.addAttribute("col", map.get("col"));
				redi.addAttribute("word", map.get("word"));
				return "redirect:" + map.get("rurl");

			} else {

				redi.addFlashAttribute("msg", "로그인 되었습니다.");
				return "redirect:/";
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력하셨거나 <br>회원이 아닙니다.");
			return "member/precreate";
		}
	}

	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		String c_id = "";
		String c_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/member/login";
	}

	public String logout() {

		return "";
	}

	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/member/read")
	public String read(String id, HttpSession session, Model model,
			RedirectAttributes redi) {

		String grade = (String) session.getAttribute("grade");

		if (id == null) {
			id = (String) session.getAttribute("id");
		}

		MemberDTO dto = minter.read(id);

		model.addAttribute("dto", dto);
		model.addAttribute("grade", grade);

		return "/member/read";
	}

	@GetMapping("/member/update")
	public String update(String id, Model model, HttpSession session) {

		if (id == null) {
			id = (String) session.getAttribute("id");
		}

		MemberDTO dto = minter.read(id);

		model.addAttribute("dto", dto);

		return "/member/update";
	}

	@PostMapping("/member/update")
	public String update(MemberDTO dto, String xemail, RedirectAttributes redi, Model model) {

		String str = "";
		String url = "/home";

		if (!dto.getEmail().equals(xemail) && minter.duplicateEmail(dto.getEmail()) == 1) {
			str = "이미 사용중인 이메일입니다. 다른 이메일을 사용해주세요.";
			model.addAttribute("msg", str);
		} else {// email이 xemail과 같을 때, 또는 email이 중복이 아닐 때 수정.

			int flag = minter.update(dto);

			if (flag == 1) {
				redi.addFlashAttribute("msg", "정보수정 완료!");
				url = "redirect:/member/read";
			} else {
				model.addAttribute("flag", flag);
				url = "/error";
			}
		}
		return url;
	}

	
	@GetMapping("/member/updateGrade")
	public String updateGrade() {

		return "/member/updateGrade";
	}

	@PostMapping("/member/updateGrade")
	public String updateGrade(String id, char grade, HttpServletRequest request,
			RedirectAttributes redi) {

		

		Map map = new HashMap();
		map.put("id", id);
		map.put("grade", grade);

		int flag = minter.updateGrade(map);
		
		if (flag == 1) {
			redi.addFlashAttribute("id", id);
			redi.addFlashAttribute("grade", grade);
			redi.addFlashAttribute("msg", "등급을 변경했습니다.");
			return "redirect:/member/read?id="+id;
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}
	
	
	@GetMapping("/member/updateFile")
	public String updateFile() {

		return "/member/updateFile";
	}

	@PostMapping("/member/updateFile")
	public String updateFile(String id, String oldfile, MultipartFile fnameMF, HttpServletRequest request,
			RedirectAttributes redi) {

		String upDir = request.getRealPath("/member/storage");
		String fname = null;

		if (fnameMF.getSize() > 0) {
			if (oldfile != null && oldfile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldfile);
			fname = Utility.saveFileSpring(fnameMF, upDir);
		}

		Map map = new HashMap();
		map.put("id", id);
		map.put("fname", fname);

		int flag = minter.updateFile(map);
		if (flag == 1) {
			redi.addFlashAttribute("id", id);
			redi.addFlashAttribute("msg", "사진을 변경했습니다.");
			return "redirect:/member/read?id="+id;
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/member/updatePw")
	public String updatePw() {
		
		return "/member/updatePw";
	}

	@PostMapping("/member/updatePw")
	public String updatePw(@RequestParam Map<String, String> map, RedirectAttributes redi, Model model) {
		int flag = minter.updatePw(map);

		if (flag == 1) {
			redi.addFlashAttribute("id", map.get("id"));
			redi.addFlashAttribute("msg", "비밀번호가 변경되었습니다.");
			return "redirect:/member/read";
		} else {
			model.addAttribute("flag", flag);
			return "/error";
		}
	}

	@GetMapping("/member/delete")
	public String delete() {

		return "/member/delete";
	}

	@PostMapping("/member/delete")
	public String delete(String id, String oldfile, HttpServletRequest request, RedirectAttributes redi) {

		String upDir = request.getRealPath("/member/storage");
		String grade = (String) request.getSession().getAttribute("grade");

		int flag = minter.delete(id);

		if (flag == 1 && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(upDir, oldfile);
		}
		if (flag == 1 && !grade.equals("A")) {
			request.getSession().invalidate(); // logout처리
		}
		if (flag == 1) {
			redi.addFlashAttribute("msg", "정상적으로 탈퇴되었습니다. 자동로그아웃됩니다.");
			return "redirect:/";
		} else {
			request.setAttribute("flag", flag);
			return "/error";
		}
	}

	@ResponseBody // data 바로받기(비동기 통신방법이지만 메시지로 직접 받음)
	@GetMapping(value = "/member/searchId", produces = "text/plain;charset=utf-8")
	public String searchIdForm(@RequestParam Map<String, String> map) {

		String str = "";
		String id = minter.idSearch(map);

		if (id != null) {
			str = "조회된 ID는 " + id + "입니다";
		} else {
			str = "ID가 존재하지 않습니다";
		}

		return str;
	}

	@GetMapping("/member/searchIdForm")
	public String searchIdForm() {

		return "member/searchIdForm";
	}

	@ResponseBody
	@GetMapping(value = "/member/searchPw", produces = "text/plain;charset=utf-8")
	public String searchPwForm(@RequestParam Map<String, String> map) {

		String str = "";
		String pw = minter.pwSearch(map);

		if (pw != null) {
			str = "조회된 패스워드는 " + pw + "입니다.";
		} else {
			str = "존재하지 않는 ID입니다";
		}
		return str;
	}

	@GetMapping("/member/searchPwForm")
	public String searchPwForm() {

		return "member/searchPwForm";
	}

	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// d 페이징 관련
		int nowPage = 1;
		int recordPerPage = 3;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = minter.total(map);

		List<MemberDTO> list = minter.list(map);

		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/admin/list";
	}

}