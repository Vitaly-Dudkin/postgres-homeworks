-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
alter table products add constraint chk_products_unit_price check (unit_price > 0);

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
alter table products add constraint chk_products_unit_price check (unit_price > 0);

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
select * into discontinued_products
from products 
where discontinued = 1


-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
ALTER TABLE ONLY order_details
    DROP CONSTRAINT IF EXISTS fk_order_details_products;

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_products
	FOREIGN KEY (product_id)
	REFERENCES products
	ON DELETE CASCADE;

DELETE FROM products
WHERE discontinued = 1;
