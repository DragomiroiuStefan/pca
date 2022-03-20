drop table if exists vehicles;
drop table if exists users;
drop table if exists connections;
drop table if exists locations;
drop table if exists trips;

create table users (
	user_id INT generated always as identity primary key,
	email VARCHAR (255) unique not null,
	password VARCHAR (50) not null,
	first_name VARCHAR (255) not null,
	last_name VARCHAR (255) not null,
	birth_date DATE not null,
	rating NUMERIC(2,1),
	created_on TIMESTAMP default NOW(),
    last_login TIMESTAMP
    --license - enum sau tabel
    -- phone_number
    -- profile_picture
);

create table vehicles (
	plate_number VARCHAR (20) primary key,
	country_code CHAR (2) not null,
	brand VARCHAR (50) not null,
	model VARCHAR (50) not null,
	color VARCHAR (50) not null,
	registration_year DATE not null,
	owner INT not null references users(user_id)
);

create table locations (
	location_id INT generated always as identity primary key,
	location_name VARCHAR (255) unique not null
);

create table trips (
	trip_id INT generated always as identity primary key,
	departure_address VARCHAR (255) not null,
	arrival_address VARCHAR (255) not null,
	price smallint not null,
	available_seats smallint not null
	-- traseu selectat pe harta
);

create table connections (
	connection_id INT generated always as identity primary key,
	departure_location INT references locations(location_id),
	arrival_location INT references locations(location_id),
	departure_timestamp TIMESTAMP not null,
	arrival_timestamp TIMESTAMP not null,
	trip INT references trips(trip_id)
);