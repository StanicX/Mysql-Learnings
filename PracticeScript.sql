create table `orders`(
orderid int(5),
Productname char(255),
Orderedby char(255),
);

insert into `orders`(
 (orderid,productname,Orderedby)
 values (1,smartphone,rishi)
);


select * from orders;

alter table orders add column todrop varchar(255);

alter table `order` add column time time after date;

alter table orders drop column todrop;

rename table `orderaa` to orders


alter table orders add primary key (id);