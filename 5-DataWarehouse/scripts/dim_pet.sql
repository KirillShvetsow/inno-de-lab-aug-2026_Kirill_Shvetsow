create table dim_pet (
    pet_sk INT primary key,
    pet_name VARCHAR(50) not null,
    species VARCHAR(50) not null,
    breed VARCHAR(50),
    gender CHAR(1),
    age INT,
    client_sk INT not null,
    blood_type VARCHAR(20),
    allergies TEXT,
    is_active BOOLEAN default true,
    
    constraint fk_pet_client foreign key(client_sk) references dim_client(client_sk),
    constraint chk_pet_gender check (gender IN ('M', 'F'))
);

