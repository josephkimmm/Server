/*
1. services.msc
   - OracleServiceXE
   - OracleOraDB21Home1TNSListener

2. 계정 생성 
   - system 접속
   - "server" 계정 생성
   
3. 접속   
   
*/
show user; --USER이(가) "SYSTEM"입니다.

alter session set "_ORACLE_SCRIPT"=true;
create user server identified by java1234;
grant connect, resource, dba to server;
alter user server default tablespace users; --hr > users

















