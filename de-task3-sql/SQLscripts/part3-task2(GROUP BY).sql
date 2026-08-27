select 
	item,
	count(*),
	avg(amount) as avg_amount
from Orders
group by item