create table dim_vet (
    vet_sk INT primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    specialization VARCHAR(100) not null,
    experience_years INT,
    phone VARCHAR(20),
    email VARCHAR(100),
    is_active BOOLEAN default true
);

