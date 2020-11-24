
in hr schema

create table logon 
(
loginid number(6) primary key,
time timestamp not null
);

create sequence login;



create or replace trigger logon_trigger
after logon on schema
begin
  insert into  logon values(login.nextval,current_timestamp);
end;