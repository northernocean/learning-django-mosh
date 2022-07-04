/*
user_id | user   | name (first last) | password | customer_id | notes
------- | ------ | ----------------- | -------- | ----------- | -----
1       | kermit | Kermit Frog       | muppets  |             | superuser
2       | mpiggy |  Miss Piggy       | muppets  | 1           | 
3       |  fozzy |  Fozzy Bear       | muppets  | 2           | staff
4       |  rowlf |  Rowlf Dog        | muppets  | 3           | 
5       |    sam |  Sam Eagle        | muppets  | 4           | 
6       |  rizzo |  Rizzo Rat        | muppets  |             | 
*/

-- Note that the passwords are not strong - remove or comment out the
-- password validators in storefront settingings.py

-- clear out old data for a "reset" - in the case of a new database,
-- these tables should all be empty already.
delete from store_cartitem;
delete from store_cart;
delete from store_orderitem;
delete from store_product;
delete from store_order;
delete from store_customer;
delete from store_promotion;
delete from store_collection;
delete from django_admin_log;
delete from core_user_groups;
delete from auth_group_permissions;
delete from auth_group;
delete from core_user;

alter sequence store_cartitem_id_seq restart with 1;
alter sequence store_cart_id_seq restart with 1;
alter sequence store_orderitem_id_seq restart with 1;
alter sequence store_product_id_seq restart with 1;
alter sequence store_order_id_seq restart with 1;
alter sequence store_customer_id_seq restart with 1;
alter sequence store_promotion_id_seq restart with 1;
alter sequence store_collection_id_seq restart with 1;
alter sequence django_admin_log_id_seq restart with 1;
alter sequence core_user_groups_id_seq restart with 1;
alter sequence auth_group_permissions_id_seq restart with 1;
alter sequence auth_group_id_seq restart with 1;
alter sequence core_user_id_seq restart with 1;

insert into core_user (password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email)
values
	('password123',NULL,True,'kermit','Kermit','Frog',True,True,'2022-06-26 19:17:04.177521+00','kermit@example.com'),
	('password123',NULL,False,'mpiggy','Miss','Piggy',False,True,'2022-06-26 19:20:41.180221+00','mpiggy@example.com'),
	('password123',NULL,False,'fozzy','Fozzy','Bear',False,True,'2022-06-26 19:21:00.39305+00','fozzy@example.com'),
	('password123',NULL,False,'rowlf','Rowlf','Dog',False,True,'2022-06-26 19:21:22.968066+00','rowlf@example.com'),
	('password123',NULL,False,'sam','Sam','Eagle',False,True,'2022-06-26 19:25:10.692801+00','sam@example.com'),
	('password123',NULL,False,'rizzo','Rizzo','Rat',False,True,'2022-06-26 19:25:10.692801+00','rizzo@example.com');

-- password: muppets (if you want a different password, create a new user, set the password, and inspect the db to get the hash)
update core_user set password = 'pbkdf2_sha256$260000$C3iOoWaCNHmJUWvRfcW1DQ$vtGAX/L5GMR6whiQ6coA/Ea/sszj0EOH8pNdgM3S7jw=';

insert into store_customer (phone, birth_date, membership, user_id)
values
	('897-661-9039','2020-10-28','G',2),
	('649-120-2330','2020-07-16','G',3),
	('434-940-7359','2021-04-28','S',4),
	('326-516-2283','2021-05-22','B',5);

insert into store_collection (title, featured_product_id)
values
  ('Grocery', null),
  ('Beauty', null),
  ('Cleaning', null),
  ('Stationary', null),
  ('Pets', null),
  ('Baking', null),
  ('Spices', null),
  ('Toys', null),
  ('Magazines', null);

insert into store_product (title, description, unit_price, inventory, last_update, collection_id, slug)
values  
    ('Bread Ww Cluster', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 4.00, 11, '2020-09-11 00:00:00', 6, '-'),
    ('Island Oasis - Raspberry', 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', 84.64, 40, '2020-07-07 00:00:00', 3, '-'),
    ('Shrimp - 21/25, Peel And Deviened', 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', 11.52, 29, '2021-04-05 00:00:00', 3, '-'),
    ('Wood Chips - Regular', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', 73.47, 40, '2020-07-20 00:00:00', 5, '-'),
    ('Lettuce - Mini Greens, Whole', 'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 60.21, 56, '2020-08-18 00:00:00', 5, '-'),
    ('Mustard - Individual Pkg', 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 76.62, 18, '2020-10-25 00:00:00', 6, '-'),
    ('Turkey Tenderloin Frozen', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 13.64, 48, '2020-08-08 00:00:00', 4, '-'),
    ('Silicone Parch. 16.3x24.3', 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 85.76, 55, '2021-06-03 00:00:00', 6, '-'),
    ('Tomatoes - Cherry, Yellow', 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 30.81, 45, '2021-03-03 00:00:00', 5, '-'),
    ('Sloe Gin - Mcguinness', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', 2.82, 69, '2021-04-18 00:00:00', 5, '-');

insert into store_order (placed_at, payment_status, customer_id)
values
    ('2021-04-03 00:00:00', 'P', 1),
    ('2021-06-07 00:00:00', 'P', 2),
    ('2021-02-03 00:00:00', 'P', 3),
    ('2020-07-17 00:00:00', 'F', 3),
    ('2021-03-25 00:00:00', 'F', 3);

insert into store_orderitem (quantity, unit_price, order_id, product_id)
values  
    (3, 81.61, 1, 1),
    (4, 18.06, 2, 2),
    (4, 38.24, 2, 3),
    (3, 61.53, 3, 4),
    (5, 78.22, 3, 5),
    (1, 4.95, 3, 6),
    (1, 9.07, 3, 7),
    (2, 88.70, 4, 1);

insert into store_cart (created_at)
values 
	('2022-06-05 11:12:00'),
	('2022-06-05 11:18:00'),
	('2022-06-05 12:14:00'),
	('2022-06-05 12:42:00');

insert into store_cartitem (quantity, cart_id, product_id)
values 
	(3, 1, 1),
	(4, 2, 2),
	(4, 2, 3),
	(3, 3, 4),
	(5, 3, 5),
	(1, 3, 6),
	(1, 3, 7),
	(2, 4, 1);

/* next three statement create a customer service group with store and order permissions */
insert into auth_group (name)
values
    ('Customer Service');

insert into core_user_groups (user_id, group_id)
values
    (3, 1);

insert into auth_group_permissions (group_id, permission_id)
values
    (1,29),
    (1,30),
    (1,31),
    (1,32),
    (1,33),
    (1,34),
    (1,35),
    (1,36),
    (1,37),
    (1,38),
    (1,51),
    (1,52),
    (1,53),
    (1,54);