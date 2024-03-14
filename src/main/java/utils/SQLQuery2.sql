create database big_project_mvc
go

use big_project_mvc;
go

create table accounts
(
    id int primary key identity,
	username varchar(100) NOT NULL,
	password varchar(200) NOT NULL,
	fullname varchar(200) NOT NULL,
	email varchar(200) NULL,
	phone varchar(200) NULL,
    avatar varchar(200) NULL,
    active bit,
    note ntext,
    birthday date,
    gender bit
);
go


--https://bcrypt-generator.com
INSERT INTO accounts(username, password, fullname, email, phone, avatar) VALUES ('admin','$2a$12$2sB8qmMWOc2JZrfuiwcjLuNyLPbxIKsq2UXgNatoKt7rQCNLGVQZe','adminok','admin@gmail.com','0123456789','resources/images/user/avatar.jpg', 1, 'ok', 2000-2-12, 1);
INSERT INTO accounts(username, password, fullname, email, phone, avatar) VALUES ('user','$2a$12$2sB8qmMWOc2JZrfuiwcjLuNyLPbxIKsq2UXgNatoKt7rQCNLGVQZe','userok','user@gmail.com','0123456789','resources/images/user/avatar.jpg', 1, 'ok', 2001-12-12, 1);
go


create table roles
(
    roleid int primary key identity,
    rolename varchar(20) NOT NULL
);
go

insert into roles(rolename) values('ROLE_ADMIN');
insert into roles(rolename) values('ROLE_USER');
go

create table accounts_roles
(
    id int primary key identity,
    accountid int NOT NULL,
    roleid int NOT NULL,
    foreign key(accountid) references accounts(id),
    foreign key(roleid) references roles(roleid)
);
go

insert into accounts_roles(accountid,roleid) values(1,1);
insert into accounts_roles(accountid,roleid) values(2,2);
go


CREATE TABLE authors
(
	id int primary key identity,
    image varchar(200),
    name varchar(200),
    description text
);
go


insert into authors(image,name,description) values('resources/image/author1.jpg', 'author 1', 'test desc');
insert into authors(image,name,description) values('resources/image/author2.jpg', 'author 2', 'test desc');
go

CREATE  TABLE categories
(
	id int primary key identity,
    name varchar(200),
    description text
);
go

insert into categories(name,description) values('category 1', 'test desc');
insert into categories(name,description) values('category 2', 'test desc');
go

CREATE TABLE products
(
	id int primary key identity,
    name varchar(200),
    price float,
    sale_price float,
    image varchar(200),
    description text,
    category_id int,
    author_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
go


insert into products(name,price,sale_price,image,description, category_id, author_id) values('product 1', 123, 120,'resources/image/product1.jpg', 'test desc', 1, 1);
insert into products(name,price,sale_price,image,description, category_id, author_id) values('product 2', 456, 450,'resources/image/product2.jpg', 'test desc', 2, 2);
go



