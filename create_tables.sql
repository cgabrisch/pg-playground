create table customer (
	id serial primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null
);

create table product (
	id serial primary key,
	name varchar(100),
	description text
);

create table purchase_order (
	id serial primary key,
	customer_id integer references customer(id)
);

create table purchase_order_position (
	purchase_order_id integer references purchase_order(id) not null,
	pos integer constraint positive_pos check (pos > 0) not null,
	product_id integer references product(id) not null,
	quantity integer constraint positive_quantity check (quantity > 0) not null,
	price numeric(10, 2) constraint non_negative_price check (price >= 0) not null,
	unique (purchase_order_id, pos)
);
