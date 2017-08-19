-- 2017년 8월 14일
-- 33기 제 3차 역량평가 제공 SQL

-- 테이블과 시퀀스를 작성하시오


create table members(
	id varchar2(20) primary key,
	password varchar2(20) not null,
	name varchar2(30) not null
);

create table rooms(
	num number primary key,
	name varchar2(60) not null unique
);

create sequence seq_rooms;

create table reservations(
	num number primary key,
	startTime timestamp not null,
	endTime timestamp not null,
	title varchar2(100) not null,
	memberId varchar2(20) constraint reservations_memberId_FK references members(id),
	roomNum number constraint reservations_roomNum_FK references rooms(num)
);



create sequence seq_reservations;

create table member_groups(
	num number primary key,
	reservationNum number(20) constraint memberGroups_reservationNum_FK references reservations(num),
	memberId varchar2(20) constraint memberGroups_memberId_FK references members(id)
);

create sequence seq_member_groups;

-- drop queries
drop table member_groups;
drop table reservations;
drop table rooms;
drop table members;

-- 제공 데이터 : 적절한 테이블과 시퀀스 객체를 생성한 후 아래의 데이터를 입력하여 프로젝트 처리 시 사용하시오

insert into rooms values (seq_rooms.nextval, '자바');
insert into rooms values (seq_rooms.nextval, '파이썬');
insert into rooms values (seq_rooms.nextval, '스위프트');
insert into rooms values (seq_rooms.nextval, '루비');
insert into rooms values (seq_rooms.nextval, 'PHP');
insert into rooms values (seq_rooms.nextval, 'C#');

insert into members values ('id1', 'pw1', 'kim');
insert into members values ('id2', 'pw2', 'lee');
insert into members values ('id3', 'pw3', 'park');
insert into members values ('id4', 'pw4', 'yang');
insert into members values ('id5', 'pw5', 'moon');
insert into members values ('id6', 'pw6', 'min');
  
commit;