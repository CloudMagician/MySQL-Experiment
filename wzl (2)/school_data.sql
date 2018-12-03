use School;

insert into Student
	values ('001','Zhang xin','male',18,'computer science'),
		('002','Wang peng','male',19,'electronic'),
		('003','Li na','female',20,'Information science'),
		('004','Ma fei','female',18,'computer science'),
		('005','Zuo li','male',	19,'Information science'),
		('006','Zhang hai','female',21,'Information science'),
		('007','Li jian','male',20,'electronic'),
		('008','Wang peng','male',20,'computer science'),
		('009','Li qiang','male',18,'electronic');
		
insert into Course
	values('C01','Database System',	48,	1),
	('C02','Introduction to the Internet',	64,	2),
	('C03','Programming in Java',72,1),
	('C04','Information Technology for Information Management',36,2),
	('C05','Bibliometrics',54,3),
	('C06','Fundamentals of Power Electronics',48,1),
	('C07','Library Automation and Resource Sharing',36,2);
	
insert into SC
	values('001','C01',78),
	('001','C02',64),
	('002','C03',57),
	('002','C04',89),
	('002','C05',97),
	('003','C04',null),
	('004','C06',26),
	('004','C07',58),
	('005','C02',85),
	('006','C03',85),
	('006','C06',75),
	('007','C07',null),
	('007','C02',88),
	('008','C03',52),
	('009','C03',93),
	('009','C01',63),
	('009','C02',73);
	
	