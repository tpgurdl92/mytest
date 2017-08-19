package global.sesoc.meet.dao;

import java.util.List;

import global.sesoc.meet.vo.ReservationVO;
import global.sesoc.meet.vo.RoomVO;
import global.sesoc.meet.vo.MemberVO;

public interface MeetDAO {
	/**
	 * 로그인 처리
	 * @param member
	 * @return member
	 */
	public MemberVO login(MemberVO member);
	
	/**
	 * 회의실 목록 보기
	 * @return list
	 */
	public List<RoomVO> selectRooms();
	
	/**
	 * 회의실 예약 현황 보기
	 * @return list
	 */
	public List<ReservationVO> selectRoomStatuses();
	
	/**
	 * seq_reservations.nextval
	 * @return int
	 */
	public int selectNextReservationNum();
	
	/**
	 * 예약 시간 중복 검사 하기 
	 * A.종료일자 > B.시작일자 AND A.시작일자 < B.종료일자
	 * @param reservation
	 * @return list
	 */
	public List<ReservationVO> isTimeDuplicated(ReservationVO reservation);
	
	/**
	 * 예약하기
	 * @param reservation
	 * @return int
	 */
	public int makeReservation(ReservationVO reservation);
	
	/**
	 * 멤버 그룹 추가
	 * @param reservation
	 * @return int
	 */
	public int addMemberToGroup(ReservationVO reservation);
	
	/**
	 * 회원 목록 보기
	 * @return list
	 */
	public List<MemberVO> selectMembers();
	
	/**
	 * 예약 취소 하기(멤버그룹 삭제)
	 * @param reservation
	 * @return int
	 */
	public int deleteMemberGroup(ReservationVO reservation);
	
	/**
	 * 예약 취소 하기(예약 삭제)
	 * @param reservation
	 * @return int
	 */
	public int deleteReservation(ReservationVO reservation);
	
	/**
	 * 내 회의 목록 보기
	 * @param member
	 * @return list
	 */
	public List<ReservationVO> selectMyMeetings(MemberVO member);
	
	/**
	 * 불참하기
	 * @param reservation
	 * @return int
	 */
	public int absent(ReservationVO reservation);
	
	
	
	public int truncateReservations();

	public int truncateMeberGroups();
}
