-- USER TABLE

CREATE TABLE users(
	user_id serial PRIMARY KEY,
	user_name character varying(100) NOT NULL,
   	first_name character varying(100) NOT NULL,
   	last_name character varying(100),
   	email character varying(255) UNIQUE NOT NULL,
	password character varying(255) NOT NULL, 
	profile_picture character varying(300),
	mobile_number character varying(10),
	address character varying(300),
	zipcode character varying(10),
	isAdmin bit DEFAULT 0::bit NOT NULL,
	isActive bit DEFAULT 1::bit NOT NULL,
	isDeleted bit DEFAULT 0::bit NOT NULL,
	role_id int NOT NULL REFERENCES role(role_id),
	country_id int NOT NULL REFERENCES country(country_id), 
	state_id int NOT NULL REFERENCES state(state_id), 
	city_id int NOT NULL REFERENCES city(city_id), 
   	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

Select * from users

-- COUNTRY TABLE

CREATE TABLE country(
	country_id serial PRIMARY KEY,
	country_name character varying(100) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

INSERT INTO country
(country_name,created_at,created_by,updated_at,updated_by)
VALUES
('India',null,'SuperAdmin',null,null)

-- STATE TABLE

CREATE TABLE state(
	state_id serial PRIMARY KEY,
	state_name character varying(100) NOT NULL,
	country_id int NOT NULL REFERENCES country(country_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- CITY TABLE

CREATE TABLE city(
	city_id serial PRIMARY KEY,
	city_name character varying(100) NOT NULL,
	country_id int NOT NULL REFERENCES country(country_id),
	state_id int NOT NULL REFERENCES state(state_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- ROLE TABLE

CREATE TABLE role(
	role_id serial PRIMARY KEY,
	role_name character varying(100) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- PERMISSION TABLE

CREATE TABLE permissions(
	permission_id serial PRIMARY KEY,
	permission_name character varying(100) NOT NULL,
	role_id int NOT NULL REFERENCES role(role_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- PERMISSION TYPE TABLE

CREATE TABLE permissiontype(
	permissiontype_id serial PRIMARY KEY,
	permisssion_id int NOT NULL REFERENCES permissions(permission_id),
	role_id int NOT NULL REFERENCES role(role_id),
	can_view bit DEFAULT 1::bit NOT NULL,
	can_add_edit bit DEFAULT 0::bit NOT NULL,
	can_delete bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- CATEGORY TABLE

CREATE TABLE category(
	category_id serial PRIMARY KEY,
	category_name character varying(100) NOT NULL,
	description character varying(200),
	isDeleted bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- MENUITEM TABLE

CREATE TABLE menuitem(
	item_id serial PRIMARY KEY,
	item_name character varying(100) NOT NULL,
	category_id int NOT NULL REFERENCES category(category_id),
	itemtype_id int NOT NULL REFERENCES itemtype(itemtype_id),
	isAvailable bit DEFAULT 1::bit NOT NULL,
	unit_id int NOT NULL REFERENCES unit(unit_id),
	rate money NOT NULL,
	quantity int DEFAULT 1 NOT NULL,
	description character varying(200),
	item_photo character varying(300),
	isDeleted bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

alter table menuitem
add column tax_id int NOT NULL REFERENCES taxandfees(tax_id) 

-- UNIT TABLE

CREATE TABLE unit(
	unit_id serial PRIMARY KEY,
	unit_name character varying(100)
)

-- ITEMTYPE TABLE

CREATE TABLE itemtype(
	itemtype_id serial PRIMARY KEY,
	itemtype_name character varying(100) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- MODIFIERGROUP TABLE

CREATE TABLE modifiergroup(
	modifiergroup_id serial PRIMARY KEY,
	modifiergroup_name character varying(100) NOT NULL,
	description character varying(200),
	isDeleted bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- MODIFIERITEM TABLE

CREATE TABLE modifieritem(
	modifieritem_id serial PRIMARY KEY,
	modifieritem_name character varying(100) NOT NULL,
	modifiergroup_id int NOT NULL REFERENCES modifiergroup(modifiergroup_id),
	unit_id int NOT NULL REFERENCES unit(unit_id),
	rate money NOT NULL,
	quantity int DEFAULT 1 NOT NULL,
	description character varying(200),
	isDeleted bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- MAPPINGMODIFIERGROUPWITHITEM TABLE

CREATE TABLE mappingmodifiergroupwithitem(
	mappingmodifiergroupwithitem_id serial PRIMARY KEY,
	modifiergroup_id int NOT NULL REFERENCES modifiergroup(modifiergroup_id),
	modifieritem_id int NOT NULL REFERENCES modifieritem(modifieritem_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- SECTION TABLE

CREATE TABLE section(
	section_id serial PRIMARY KEY,
	section_name character varying(100) NOT NULL,
	description character varying(200),
	isDeleted bit DEFAULT 0::bit NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- TABLES TABLE

CREATE TABLE tables(
	table_id serial PRIMARY KEY,
	table_name character varying(100) NOT NULL,
	capacity int NOT NULL,
	status_id int NOT NULL REFERENCES status(status_id),
	section_id int NOT NULL REFERENCES section(section_id),
	description character varying(200),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- STATUS TABLE

CREATE TABLE status(
	status_id serial PRIMARY KEY,
	status_name character varying(100) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- TAXANDFEES TABLE

CREATE TABLE taxandfees(
	tax_id serial PRIMARY KEY,
	tax_name character varying(100) NOT NULL,
	tax_type character varying(100) NOT NULL,
	isEnabled bit DEFAULT 0::bit NOT NULL,
	default_tax bit DEFAULT 1::bit NOT NULL,
	tax_amount money NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- ORDER TABLE

CREATE TABLE orders(
	order_id serial PRIMARY KEY,
	table_id int NOT NULL REFERENCES tables(table_id),
	customer_id int NOT NULL REFERENCES customer(customer_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- ORDERITEMS TABLE

CREATE TABLE orderitems(
	orderitems_id serial PRIMARY KEY,
	order_id int NOT NULL REFERENCES orders(order_id),
	item_id int NOT NULL REFERENCES menuitem(item_id),
	modifieritem_id int NOT NULL REFERENCES modifieritem(modifieritem_id),
	payment_id int NOT NULL REFERENCES payment(payment_id),
	quantity int NOT NULL,
	orderwisecomments character varying(200),
	itemwisecomments character varying(200),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- MAPPINGORDERITEMWITHMODIFIER TABLE

CREATE TABLE mappingorderitemwithmodifier(
	mappingorderitemwithmodifier serial PRIMARY KEY,
	orderitems_id int NOT NULL REFERENCES orders(order_id),
	modifieritem_id int NOT NULL REFERENCES modifieritem(modifieritem_id)
)

-- CUTOMER TABLE

CREATE TABLE customer (
    customer_id serial PRIMARY KEY,
    customer_name character varying(100) NOT NULL,
    customer_email character varying(100) NOT NULL,
    mobile_no  character varying(10) NOT NULL,
    noOfPerson INT NOT NULL,
    isWaiting bit NOT NULL DEFAULT 0::bit,
    created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
);

-- PAYMENT TABLE

CREATE TABLE payment (
    payment_id serial PRIMARY KEY,
    payment_mode character varying(100) NOT NULL,
    order_id INT NOT NULL REFERENCES orders(order_id),
    created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
);

-- REVIEW TABLE

CREATE TABLE review (
    review_id serial PRIMARY KEY,
    food_review int DEFAULT NULL CHECK (food_review BETWEEN 1 AND 5),
    service_review int DEFAULT NULL CHECK (service_review BETWEEN 1 AND 5),
    ambience_review INT DEFAULT NULL CHECK (ambience_review BETWEEN 1 AND 5),
    order_id INT NOT NULL REFERENCES orders(order_id),
    comment character varying(300),
   	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
);

-- WaitingList Table

CREATE TABLE waitinglist(
	waitinglist_id serial PRIMARY KEY,
	table_id int NOT NULL REFERENCES tables(table_id),
	customer_id int NOT NULL REFERENCES customer(customer_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- KOT Table

CREATE TABLE kot(
	kot_id serial PRIMARY KEY,
	order_id int NOT NULL REFERENCES orders(order_id),
	status character varying(20) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- KOTITEM Table

CREATE TABLE kotitem(
	token_id serial PRIMARY KEY,
	item_id int NOT NULL REFERENCES menuitem(item_id),
	kot_id int NOT NULL REFERENCES kot(kot_id),
	status character varying(20) NOT NULL,
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)

-- INVOICE TABLE

CREATE TABLE invoice(
	invoice_id serial PRIMARY KEY,
	invoice_no character varying(15) NOT NULL,
	orderitems_id int NOT NULL REFERENCES orderitems(orderitems_id),
	created_at TIMESTAMP with time zone NOT NULL DEFAULT now(),
	created_by character varying(100) NOT NULL,
   	updated_at timestamp with time zone,
	updated_by character varying(100) NOT NULL
)


