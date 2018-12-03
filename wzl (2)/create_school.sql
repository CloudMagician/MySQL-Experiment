create database School;
use School;

create table Student(
	sno varchar(5),
	sname varchar(10),
	ssex varchar(6),
	sage numeric(3,0),
	sdept varchar(20),
	primary key(sno),
	check (ssex in ('male','female'))
);
	
create table Course(
	cno varchar(5),
	cname varchar(55),
	ctime numeric(3,0),
	ccredit  numeric(1,0),
	primary key(cno)
);

create table SC(
	sno varchar(5),
	cno varchar(5),
	grade numeric(3,0),
	primary key(sno,cno),
	foreign key (sno) references Student(sno),
	foreign key (cno) references Course(cno) 
);