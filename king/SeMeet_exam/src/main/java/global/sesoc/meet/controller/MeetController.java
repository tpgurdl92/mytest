package global.sesoc.meet.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.meet.dao.MeetDAO;
import global.sesoc.meet.vo.MemberVO;
import global.sesoc.meet.vo.ReservationVO;
import global.sesoc.meet.vo.RoomVO;

@Controller
public class MeetController {
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * 예약 현황 보기
	 */
	@RequestMapping(value="rooms", method=RequestMethod.GET)
	public String roomStatuses(Model model, String message) {
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		// 회의실 목록 가져오기 , 예약현황 가져오기 
		// Code Here
		
		//회의실 목록을 DB에서 불러와 모델에 넣어준다
		List<RoomVO> rooms = dao.selectRooms();
		model.addAttribute("rooms", rooms);
		
		//회의실 예약 목록을 DB에서 불러와 모델에 넣어준다
		List<ReservationVO> reservations = dao.selectRoomStatuses();
		model.addAttribute("reservations", reservations);

		return "rooms";
	}
	
	/*
	 * 예약 화면 보기
	 */
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public String reservationView(RoomVO room, Model model) {
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		//멤버 목록 가져오기, 선택된 회의실 정보 전달
		// Code here
		
		List<MemberVO> members = dao.selectMembers();
		
		model.addAttribute("members", members);
		model.addAttribute("selectedRoom", room);
		
		return "reservation";
	}
	
	/*
	 * 예약 하기
	 */
	@RequestMapping(value="make", method=RequestMethod.POST)
	public String makeReservation(ReservationVO reservation, String[] id, HttpSession session) {
		// 로그인 한 유저 아이디 가져오기, 예약 시간 중복 검사하기, 예약하기, 멤버그룹 추가하기
		// Code here
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		String loginId = (String)session.getAttribute("loginId"); // 세션에서 로그인id 가져오기
		int resNum = dao.selectNextReservationNum(); // 예약정보와 같이 보내줄 예약번호 불러오기
		
		reservation.setMemberId(loginId);
		reservation.setNum(resNum);
		
		//회의실 예약 신청기간 내에 중복되는 다른 예약들을 DB에서 꺼내옴. 중복되는 예약이 없다면 DB에 삽입
		if(dao.isTimeDuplicated(reservation).size()==0){
			dao.makeReservation(reservation);
			
			for(int i = 0 ; i < id.length ; i++){
				reservation.setMemberId(id[i]);
				dao.addMemberToGroup(reservation);
			}
		}
		
		return "redirect:rooms";
	}
	
	/*
	 * 예약 취소 하기
	 */
	@RequestMapping(value="cancel", method=RequestMethod.GET)
	public String cancelReservation(ReservationVO reservation) {
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		// 멤버 그룹 삭제하기, 예약 삭제하기
		dao.deleteMemberGroup(reservation);
		dao.deleteReservation(reservation);
		
		return "redirect:rooms";
	}
	
	/*
	 * 내 회의 목록 보기
	 */
	@RequestMapping(value="myMeetings", method=RequestMethod.GET)
	public String myMeetings(Model model, HttpSession session) {
		// 로그인 한 유저 아이디 가져오기. 로그인한 유저의 회의목록 가져오기
		// Code Here
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		String loginId = (String)session.getAttribute("loginId");
		MemberVO member = new MemberVO();
		member.setId(loginId);
		
		List<ReservationVO> myMeetings = dao.selectMyMeetings(member);
		
		model.addAttribute("myMeetings", myMeetings);
		
		
		return "myMeetings";
	}
	
	/*
	 * 불참 하기
	 */
	@RequestMapping(value="absent", method=RequestMethod.GET)
	public String absent(ReservationVO reservation, HttpSession session) {
		// 로그인 한 유저 아이디 가져오기, 불참 실행하기
		// Code Here
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		
		String loginId = (String)session.getAttribute("loginId");
		reservation.setMemberId(loginId);
		
		dao.absent(reservation);
		
		return "redirect:myMeetings";
	}
}

