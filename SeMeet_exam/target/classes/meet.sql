-- 2017년 8월 14일
-- 33기 제 3차 역량평가 제공 SQL

-- 테이블과 시퀀스를 작성하시오




-- drop queries
drop table member_groups;
drop table reservations;
drop table rooms;
drop table members;

--create table queries
create table members(
id varchar2(20) primary key,
password varchar2(20) not null,
name varchar2(30) not null
);

create table rooms(
num number primary key,
name varchar2(60) not null,
constraint rooms_uq unique(name)
);

create table reservations(
num number primary key,
startTime timestamp not null,
endTime timestamp not null,
title varchar2(100) not null,
memberId varchar2(20),
roomNum number,
constraint reservations_fk1 FOREIGN KEY(memberId)
references members(id),
constraint reservations_fk2 FOREIGN KEY(roomNum)
references rooms(num)
);

create table member_groups(
num number primary key,
reservationNum number(20),
memberId varchar2(20),
constraint member_groups_fk1 FOREIGN KEY(reservationNum)
references reservations(num),
constraint member_groups_fk2 FOREIGN KEY(memberId)
references members(id)
);

--create seq
create sequence seq_rooms
start with 1
increment by 1;

create sequence seq_member_groups
start with 1
increment by 1;

create sequence seq_reservations
start with 1
increment by 1;

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