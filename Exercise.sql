create database mycommerce

create table order_details(
	orderid serial Primary KEY,
	customer_name varchar(50) NOT NULL,
	product_name varchar(50) NOT NULL,
	order_from varchar(50) NOT NULL,
	order_amount Numeric(7,2),
	order_date date not null,
	delivery_date date
);

select * from order_details

insert into order_details(customer_name,product_name,order_from,order_amount,order_date,delivery_date)
values
('A','AAA','Amazon',900.0,'2025-01-01','2025-01-05'),
('B','BBB','Amazon',1900.0,'2025-02-01','2025-03-05'),
('C','CCC','Flipcart',500.0,'2025-01-01','2025-01-05'),
('D','DDD','Amazon',8000.0,'2025-05-01','2025-06-05'),
('E','EEE','Myntra',200.0,'2025-01-01','2025-01-05'),
('F','FFF','Swiggy',300.0,'2025-01-01','2025-01-05'),
('G','GGG','Amazon',4000.0,'2024-12-31','2025-01-05'),
('H','HHH','Zomato',900.0,'2025-01-01','2025-01-05'),
('I','III','Flipcart',3900.0,'2025-01-01','2025-01-05')

select product_name,count(*),sum(order_amount) as Sale
from order_details
group by product_name

alter table order_details
rename column customer_name to customer_first_name

select * from order_details

alter table order_details
add column cancel_date date
