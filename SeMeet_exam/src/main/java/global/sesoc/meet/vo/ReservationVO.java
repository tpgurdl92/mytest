package global.sesoc.meet.vo;

public class ReservationVO {
	private int num;
	private String roomName;
	private String startTime;
	private String endTime;
	private String title;
	private String memberId;
	private int roomNum;
	
	public ReservationVO() {	}

	public ReservationVO(int num, String roomName, String startTime, String endTime, String title, String memberId,
			int roomNum) {
		this.num = num;
		this.roomName = roomName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.title = title;
		this.memberId = memberId;
		this.roomNum = roomNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getroomNum() {
		return roomNum;
	}

	public void setroomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	@Override
	public String toString() {
		return "ReservationVO [num=" + num + ", roomName=" + roomName + ", startTime=" + startTime + ", endTime="
				+ endTime + ", title=" + title + ", memberId=" + memberId + ", roomNum=" + roomNum + "]";
	}
}
