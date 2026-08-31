create table dim_date (
    date_sk INT primary key,
    date DATE not null,
    year INT not null,                      
    quarter INT not null,
    is_weekend BOOLEAN default false,
    is_holiday BOOLEAN default false
);

