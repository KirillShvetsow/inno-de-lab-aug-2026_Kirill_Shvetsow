select 
	s.status,c.first_name,c.last_name
from Shippings as s
left join Customers as c
	on s.shipping_id = c.customer_id



