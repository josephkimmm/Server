--TodoList > script.sql

create table tblTodo (
    seq number primary key,             --번호(PK)
    todo varchar2(100) not null,        --할일
    state char(1) default 'n' not null,--완료(y), 미완료(n)
    regdate date default sysdate not null --등록일
);

create sequence seqTodo;

insert into tblTodo values (seqTodo.nextVal, '컴퓨터 포맷하기', default, default);

select * from tblTodo;

delete 


