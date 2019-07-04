package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.member.MemberDTO;

public interface MemberInter {

	int create(MemberDTO dto);
	int duplicateEmail(String email);
	int duplicateId(String id);
	String getGrade(String id);
	int loginCheck(Map<String, String> map);
	MemberDTO read(String id);
	List<MemberDTO> list(Map map);
	int total(Map map);
	int update(MemberDTO dto);
	int delete(String id);
	int updateFile(Map map);
	int updatePw(Map map);
	String idSearch(Map map);
	String pwSearch(Map map);
	int duplicateNick(String nickname);
	int updateGrade(Map map);
}
