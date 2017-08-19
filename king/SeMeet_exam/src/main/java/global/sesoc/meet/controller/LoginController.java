package global.sesoc.meet.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.meet.dao.MeetDAO;
import global.sesoc.meet.vo.MemberVO;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(MemberVO member, HttpSession session) {
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		member = dao.login(member);

		if (member == null) {
			return "redirect:/";
		}
		
		// Code Here 
		// session에 loginId와 loginName을 저장하시오
		
		session.setAttribute("loginId", member.getId()); // session에 현재 로그인된 유저id 저장
		session.setAttribute("loginName", member.getName()); // session에 현재 로그인된 멤버이름 저장

		return "redirect:rooms";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
