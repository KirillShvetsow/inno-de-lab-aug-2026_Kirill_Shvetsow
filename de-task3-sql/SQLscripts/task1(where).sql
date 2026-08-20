select 
	c.first_name,
	c.last_name,
	c.age,
	c.country
from Customers as c
where c.age > 25 and c.country like('USA');


