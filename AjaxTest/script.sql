--AjaxTest > script.sql

--설문조사
create table tblSurvey (
    seq number primary key,            --번호(PK)
    question varchar2(300) not null, --질문
    item1 varchar2(300) not null,   --항목
    item2 varchar2(300) not null,   --항목
    item3 varchar2(300) not null,   --항목
    item4 varchar2(300) not null,   --항목
    cnt1 number default 0 not null, --선택
    cnt2 number default 0 not null, --선택
    cnt3 number default 0 not null, --선택
    cnt4 number default 0 not null --선택
);

insert into tblSurvey values(1, '가장 자신있는 프로그래밍 언어는?', 'JAVA', 'Python', 'C#', 'JavaScript', default, default, default, default);

select * from tblSurvey;

update tblSurvey set
    cnt1 = 8,
    cnt2 = 5,
    cnt3 = 10,
    cnt4 = 3
        where seq = 1;
        
commit;

select * from tabs;

select * from tblUser;


--고양이 Drag&Drop
--프로젝트  > 조직도 편성 or 주차장 도면 편집
create table tblCat (
    catid varchar2(50) primary key,     --<img id="cat">
    src varchar2(100) not null,           --<img src="images/catty01.png>
    x number not null,
    y number not null
);

commit;

select * from tblCat order by to_number(catid) desc;
 
select max(to_number(catid)) as catid from tblCat; --3

insert into tblCat values ('15', '01', 0, 0); --최대값이 15가 나와야하는데 여전히 3이 출력 > catid가 varchar2로 되어있기 때문에 숫자로 변환 필요
delete from tblCat where catid = '15';

delete from tblCat;

commit;

select * from tblAddress order by seq asc;

delete from tblAddress where seq=2;