create table employee(
	emp_no char(4)
	,emp_name varchar(20) NOT NULL
	,password varchar(8) NOT NULL
	,active_flg char(1)
	,primary key(emp_no)
);

ALTER TABLE employee ALTER COLUMN active_flg SET DEFAULT 1;
ALTER TABLE item ALTER COLUMN active_flg SET DEFAULT 1;


create table item(
	item_no char(4)
	,item_name varchar(20) UNIQUE NOT NULL
	,item_url varchar(100) 
	,unit_price numeric(6) NOT NULL
	,size varchar(15) NOT NULL
	,assortment_code varchar(20) NOT NULL REFERENCES item_assortment(assortment_code)
	,category_code varchar(20) NOT NULL REFERENCES item_category(category_code)
	,active_flg char (1) NOT NULL
	,primary key(item_no)
);


create table item_stock(
	item_no char(4) REFERENCES item(item_no) NOT NULL
	,stock numeric(4) NOT NULL
);

create table item_assortment(
	assortment_code varchar(20)
	,assortment_name varchar(20) NOT NULL
	,explain varchar(50) 
	,primary key(assortment_code)
	);

create table item_category(
	category_code varchar(20)
	,category_name varchar(15) NOT NULL
	,explain varchar(50) 
	,primary key(category_code)
	);
