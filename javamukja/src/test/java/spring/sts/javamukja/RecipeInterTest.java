package spring.sts.javamukja;

import static org.junit.Assert.assertTrue;

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

import spring.model.mapper.RecipeInter;
import spring.model.recipe.RecipeDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class RecipeInterTest {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RecipeInter rinter;

	@Test
	@Ignore
	public void testCreate() {
		RecipeDTO dto = new RecipeDTO();
		dto.setId("user1");
		dto.setTitle("제목1");
		dto.setContent("내용1");
		dto.setCategory("디저트");
		dto.setFname("test.jpg");
		dto.setTime("20분이내");
		dto.setPortion("2인분");
		dto.setIngredient("쌀2인분");

		assertTrue(rinter.create(dto) > 0);
	}

	@Test
	@Ignore
	public void testRead() {
		RecipeDTO dto = rinter.read(1);
		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		RecipeDTO dto = rinter.read(4);
		dto.setContent("내용2로 변경");

		assertTrue(rinter.update(dto) > 0);
	}

	@Test
	@Ignore
	public void testDelete() {
		int rno = 4;
		assertTrue(rinter.delete(rno) > 0);
	}

	@Test
//	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("rno", 2);
		map.put("sno", 1);
		map.put("eno", 5);
		List<RecipeDTO> list = rinter.list(map);
		logger.info("list: " + list);
	}

	@Test
	@Ignore
	public void testTotal() {
		Map map = new HashMap();
		int cnt = rinter.total(map);
		logger.info("total: " + cnt);
	}
	
	@Test
	@Ignore
	public void upViewcnt() {
		int rno = 3;
		assertTrue(rinter.upViewcnt(rno)>0);
	}
}