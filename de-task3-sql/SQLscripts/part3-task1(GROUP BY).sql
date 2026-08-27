select 
	country,
	count(*)
from Customers
group by country