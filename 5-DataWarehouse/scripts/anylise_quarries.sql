--3 самые прибыльные услуги
select 
    ds.service_name as "Название услуги",
    ds.category as "Категория",
    COUNT(fv.visit_sk) as "Количество визитов",
    SUM(fv.totalamount) as "Общая выручка",
    ROUND(AVG(fv.totalamount), 2) as "Средний чек"
from fact_visits fv
join dim_service ds on fv.service_sk = ds.service_sk
where fv.visit_status = 'Completed'
group by ds.service_name, ds.category
order by SUM(fv.totalamount) desc
limit 3;


--Кто из врачей приносит больше денег
select 
    dv.first_name as "Имя",
    dv.last_name as "Фамилия",
    SUM(fv.totalamount) as "Общая выручка"
from fact_visits fv
join dim_vet dv on fv.vet_sk = dv.vet_sk
where fv.visit_status = 'Completed'
group by dv.first_name, dv.last_name
order by SUM(fv.totalamount) desc;


--Количество визитов в выходные дни
select 
    COUNT(*) as "Визитов в выходные"
from fact_visits fv
join dim_date dd on fv.date_sk = dd.date_sk
where fv.visit_status = 'Completed' and dd.is_weekend = true;
