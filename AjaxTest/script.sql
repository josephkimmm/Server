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