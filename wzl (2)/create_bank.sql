create database bank;
use bank;
create table Customer(
	customer_name varchar(20),
	customer_street varchar(20),
	customer_city	varchar(20),
	primary key(customer_name));

create table Branch(
	branch_name	varchar(20),
	branch_city	varchar(20),
	assets	numeric(10,0),
	primary key(branch_name));

create table Account(
	account_number	varchar(10),
	branch_name	varchar(20),
	balance		numeric(10,2),
	primary key(account_number),
	foreign key(branch_name) references Branch(branch_name));

create table Loan(
	loan_number	varchar(10),
	branch_name	varchar(20),
	amount		numeric(10,2),
	primary key(loan_number),
	foreign key (branch_name) references Branch(branch_name));


create table Depositor(
	customer_name varchar(20),
	account_number varchar(10),
	foreign key(customer_name) references Customer(customer_name),
	foreign key(account_number) references Account(account_number));
create table Borrower(
	customer_name varchar(20),
	loan_number varchar(10),
	foreign key(customer_name) references Customer(customer_name),
	foreign key(loan_number) references Loan(loan_number));