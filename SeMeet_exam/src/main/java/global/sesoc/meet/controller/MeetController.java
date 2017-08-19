package global.sesoc.meet.controller;

import java.util.ArrayList;
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
		List<RoomVO> list = new ArrayList<>();
		List<ReservationVO> slist = new ArrayList<>();
		list = dao.selectRooms();
		try{
			slist= dao.selectRoomStatuses();
		}catch (Exception e) {
		}
		if(slist != null) model.addAttribute("roomStat",slist);
		model.addAttribute("roomList",list);
		model.addAttribute("message",message);
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
		List<MemberVO> list = new ArrayList<>();
		list = dao.selectMembers();
		model.addAttribute("roomName",room.getName());
		model.addAttribute("roomNum",room.getNum());
		model.addAttribute("memberList",list);
		return "reservation";
	}
	
	/*
	 * 예약 하기
	 */
	@RequestMapping(value="make", method=RequestMethod.POST)
	public String makeReservation(ReservationVO reservation, String[] id, HttpSession session, Model model) {
		// 로그인 한 유저 아이디 가져오기, 예약 시간 중복 검사하기, 예약하기, 멤버그룹 추가하기
		// Code here
		String loginId = (String) session.getAttribute("loginId");
		String name = (String) session.getAttribute("loginName");
		reservation.setMemberId(loginId);
		//참가자목록
		System.out.println(reservation);
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		List<ReservationVO> ttList = dao.isTimeDuplicated(reservation);
		System.out.println("중복검사:"+ttList);
		if(ttList.size() == 0){
			dao.makeReservation(reservation);
			//멤버그룹추가하기
			List<Integer> seq = dao.seqinfo(loginId);
			reservation.setNum(seq.get(0));
			reservation.setMemberId(name);
			dao.addMemberToGroup(reservation);
			for(int i=0;i<id.length;i++){
				System.out.println(id[i]);
				reservation.setMemberId(id[i]);
				dao.addMemberToGroup(reservation);
			}
		}else{
			String message ="timeDuplicated";
			model.addAttribute("message",message);
		}
		return "redirect:rooms";
	}
	
	/*
	 * 예약 취소 하기
	 */
	@RequestMapping(value="cancel", method=RequestMethod.GET)
	public String cancelReservation(ReservationVO reservation, HttpSession session, Model model) {
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		// 멤버 그룹 삭제하기, 예약 삭제하기
		System.out.println("삭제진입"+reservation);
		String loginId = (String) session.getAttribute("loginId");
		if(loginId.equals(reservation.getMemberId())){
			dao.deleteMemberGroup(reservation);
			dao.deleteReservation(reservation);
		}else{
			String cancelM = "nocancel";
			model.addAttribute("message",cancelM);
		}
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
		String loginId = (String) session.getAttribute("loginId");
		MemberVO m = new MemberVO(); m.setId(loginId);
		List<ReservationVO> myList = new ArrayList<>();
		myList = dao.selectMyMeetings(m);
		if(myList.isEmpty()){
			String message = "notList";
			model.addAttribute("message",message);
		}
		for(int i=0;i<myList.size();i++){
			System.out.println("마이리스트: "+myList.get(i));
		}
		model.addAttribute("myList", myList);
		return "myMeetings";
	}
	
	/*
	 * 불참 하기
	 */
	@RequestMapping(value="absent", method=RequestMethod.GET)
	public String absent(ReservationVO reservation, HttpSession session) {
		// 로그인 한 유저 아이디 가져오기, 불참 실행하기
		// Code Here
		System.out.println("불참이다"+reservation);
		MeetDAO dao = sqlSession.getMapper(MeetDAO.class);
		String loginId = (String) session.getAttribute("loginId");
		reservation.setMemberId(loginId);
		dao.absent(reservation);
		return "redirect:myMeetings";
	}
}

