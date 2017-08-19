package global.sesoc.meet;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import global.sesoc.meet.dao.MeetDAO;
import global.sesoc.meet.vo.MemberVO;
import global.sesoc.meet.vo.ReservationVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class MeetTest {
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testSelectRooms() {
		System.out.println("-- testSelectRooms -- ");
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		System.out.println(dao.selectRooms());
	}
}
