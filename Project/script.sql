-- Project > script.sql

-- 회원 테이블
drop table tblUser;

create table tblUser (
    id varchar2(50) primary key,                        --아이디
    pw varchar2(50) not null,                           --암호
    name varchar2(50) not null,                         --이름
    email varchar2(100) not null,                       --이메일
    pic varchar2(100) default 'pic.png' not null,       --프로필 사진
    intro varchar2(500) not null,                       --자기소개
    regdate date default sysdate not null,              --가입일
    ing number(1) default 1 not null                    --활동유무(1-활동, 0-탈퇴)
);

insert into tblUser values ('hong', '1111', '홍길동', 'hong@gmail.com', default
            , '안녕하세요. 홍길동입니다.', default, default);
select * from tblUser;

-- 메모 테이블
drop table tblMemo;

create table tblMemo (
    seq number primary key,                         --메모번호(PK)
    id varchar2(50) not null references tblUser(id),--작성자(FK)
    subject varchar2(1000) not null,                --메모 제목
    content varchar2(2000) not null,                --메모 내용
    regdate date default sysdate not null           --작성일
);
drop sequence seqMemo;
create sequence seqMemo;

insert into tblMemo values (seqMemo.nextVal, 'hong', '메모입니다.', '내용입니다.', default);

select * from tblMemo;
commit;


-- 이메일 인증
create table tblEmail (
    email varchar2(100) primary key,        --이메일(PK)
    validnumber varchar2(5) not null,       --인증번호
    regdate date default sysdate not null   --등록시간
);

select * from tblEmail;













