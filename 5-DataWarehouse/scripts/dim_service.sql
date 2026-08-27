create table dim_service (
    service_sk INT primary key,
    service_name VARCHAR(50) not null,
    category VARCHAR(50) not null,
    description TEXT,
    price DECIMAL(10,2) not null,
    is_active BOOLEAN default true,
    
    constraint chk_service_price check (price >= 0)
);

