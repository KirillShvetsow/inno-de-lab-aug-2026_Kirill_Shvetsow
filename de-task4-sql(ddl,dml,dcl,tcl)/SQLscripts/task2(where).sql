select 
	o.item,
	o.amount,
	o.customer_id
from Orders as o
where o.amount > 1000;


