create table dim_client (
    client_sk INT primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    phone VARCHAR(20),
    email VARCHAR(100)
);

