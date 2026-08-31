create table fact_visits (
    visit_sk INT primary key,
    date_sk INT not null,
    client_sk INT not null,
    pet_sk INT not null,
    service_sk INT not null,
    vet_sk INT not null,
    service_price DECIMAL not null,
    discount_amount DECIMAL default 0,
    total_amount DECIMAL not null,
    visit_duration_min INT,
    visit_status VARCHAR(20) not null,
    diagnosis TEXT,
    recommendations TEXT,
    
    constraint fk_fact_date foreign key (date_sk) references dim_date(date_sk),
    constraint fk_fact_client foreign key (client_sk) references dim_client(client_sk),
    constraint fk_fact_pet foreign key (pet_sk) references dim_pet(pet_sk),
    constraint fk_fact_service foreign key (service_sk) references dim_service(service_sk),
    constraint fk_fact_vet foreign key (vet_sk) references dim_vet(vet_sk),
    
    constraint chk_fact_price check (service_price >= 0),
    constraint chk_fact_total check (total_amount >= 0),
    constraint chk_fact_status check (visit_status in('Scheduled', 'In Progress', 'Completed', 'Cancelled', 'No Show'))
);
