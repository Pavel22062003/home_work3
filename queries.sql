--1
SELECT customers.company_name, CONCAT(employees.last_name, ' ',employees.first_name)
FROM orders
INNER JOIN customers USING(customer_id)
INNER JOIN employees USING(employee_id)
INNER JOIN shippers ON orders.ship_via=shippers.shipper_id
WHERE customers.city = 'London' and employees.city = 'London' AND shippers.company_name = 'United Package'

--2
SELECT products.product_name,products.units_in_stock, suppliers.contact_name,suppliers.phone
FROM products
INNER JOIN suppliers USING(supplier_id)
INNER JOIN categories USING(category_id)
WHERE products.discontinued <>1 AND products.units_in_stock < 25 
AND categories.category_name IN ('Dairy Products','Condiments')
ORDER BY products.units_in_stock DESC

--3
SELECT customers.company_name
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL

--4

SELECT DISTINCT(products.product_name)
FROM products
WHERE product_id IN (SELECT product_id FROM order_details
					           WHERE quantity = 10)

