package spring.sts.javamukja;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.model.mapper.RecipeReplyInter;
import spring.model.recipeReply.RecipeReplyDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class RecipeReplyInterTest {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RecipeReplyInter rrinter;

	@Test
	@Ignore
	public void testCreate() {
		RecipeReplyDTO dto = new RecipeReplyDTO();
		dto.setRno(2);
		dto.setId("user1");
		dto.setContent("댓글내용2");

		assertTrue(rrinter.create(dto) > 0);
	}

	@Test
	@Ignore
	public void testRead() {
		RecipeReplyDTO dto = rrinter.read(1);
		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		RecipeReplyDTO dto = rrinter.read(1);
		dto.setContent("댓글내용2로 변경");

		assertTrue(rrinter.update(dto) > 0);
	}

	@Test
	@Ignore
	public void testDelete() {
		int rrno = 2;
		assertTrue(rrinter.delete(rrno) > 0);
	}

	@Test
	@Ignore
	public void testrdelete() throws Exception {
		int rno = 2;
		assertTrue(rrinter.rdelete(rno) > 0);
	}

	@Test
//	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("rno", 2);
		map.put("sno", 1);
		map.put("eno", 5);
		List<RecipeReplyDTO> list = rrinter.list(map);
		logger.info("list: " + list);
	}

	@Test
	@Ignore
	public void testTotal() {
		int rno = 1;
		int cnt = rrinter.total(rno);
		logger.info("total: " + cnt);
	}

	@Test
	@Ignore
	public void testRcount() {
		int rno = 1;
		int cnt = rrinter.rcount(rno);
		logger.info("total: " + cnt);
	}
}