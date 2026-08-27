select 
	order_id,
	customer_id,
	item,
	amount,
	sum(amount) over(order by customer_id) as total_by_customer
from Orders