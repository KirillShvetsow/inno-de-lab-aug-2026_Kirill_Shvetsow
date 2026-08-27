select
    first_name,
    last_name,
    amount
from Customers as c
join Orders as o on c.customer_id = o.customer_id
where not exists (
    select 
    from Orders as o2
    where o2.amount > o.amount
);