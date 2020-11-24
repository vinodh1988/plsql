
in hr schema

create table logon 
(
loginid number(6) primary key,
time timestamp not null
);

create sequence login;

login as sysdba

create or replace trigger logon_trigger
after logon on schema
begin
  insert into hr.logon values(hr.login.nextval,current_timestamp);
end;