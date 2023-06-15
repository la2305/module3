create DATABASE furama_resort;
use furama_resort;
create table `position`(
	position int PRIMARY KEY,
    position_name VARCHAR(45)
);
create table specialize(
	specialize_id int PRIMARY KEY,
    specialize_name varchar(45)
);
CREATE TABLE department(
	department_id int PRIMARY KEY,
    department_name varchar(45)
);
CREATE TABLE staff(
	staff_id int PRIMARY KEY,
    full_name varchar(45) not null,
    date_of_birth Date not null,
    identification_number VARCHAR(45) NOT NULL,
    salary DOUBLE not NULL,
    phone_number varchar(45) NOT NULL,
    email VARCHAR(45),
    locaion VARCHAR(45),
	position int,
    specialize_id int,
    department_id int,
    FOREIGN KEY (position) REFERENCES `position`(position),
    FOREIGN KEY (specialize_id) REFERENCES specialize(specialize_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);
CREATE TABLE customer_type (
	customer_type_id int PRIMARY KEY,
    customer_type_name varchar(45)
);
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	customer_type_id int,
    full_name VARCHAR(45) not null,
    date_of_birth DATE not null,
    gender bit(1) not null,
    identification_number varchar(45) not null,
    phone_number varchar(45) not null,
    email varchar(45),
    location VARCHAR(45),
    foreign key(customer_type_id) references customer_type(customer_type_id)
);
CREATE TABLE service_type(
	service_type_id int PRIMARY KEY,
    service_type_name varchar(45)
);
CREATE TABLE rental_type(
	retal_type_id int PRIMARY KEY,
    retal_type_name VARCHAR(45)
);
CREATE TABLE service(
	service_id int PRIMARY KEY,
    service_name VARCHAR(45) NOT NULL,
    area int,
    rental_costs DOUBLE NOT NULL,
    maximum_number_of_people int ,
    retal_type_id int,
    service_type_id int,
    room_standard VARCHAR(45),
    other_amenities_description varchar(45),
    swmimming_pool_area double,
    number_of_floors int,
    foreign key (retal_type_id) references rental_type(retal_type_id),
    foreign key (service_type_id) references service_type(service_type_id)
);
