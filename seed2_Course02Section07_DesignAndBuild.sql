-- kermit (superuser) Thr33_Muppets
-- mpiggy Mrf4433$1 (Miss Piggy) (Customer 1)
--  fozzy Fz44re2$1 (Fozzy Bear) (Customer 2)
--  rowlf Rddkf$332 (Rowlf Dog)  (Customer 3)
--    sam Frds33$ee (Sam Eagle)  (Customer 4)

delete from store_orderitem;
delete from store_product;
delete from store_order;
delete from store_customer;
delete from store_promotion;
delete from store_collection;


insert into core_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email)
values
	(1,"pbkdf2_sha256$260000$UyZRQjewjqpqS2ZbaHBR4u$yJH5kY2IghMntN51z209nm4IaoUlr+kbcOPPIrEA5jA=","2022-06-26 19:17:47.35012+00",True,"kermit","","",True,True,"2022-06-26 19:17:04.177521+00","kermit@example.com"),
	(2,"pbkdf2_sha256$260000$cHGef9wWhn8j2AOvW8kxd9$/lcvrC1nIAXXkYKWsu+trKHlitY9ksPfUmlWHvPNSh0=",NULL,False,"mpiggy","Miss","Piggy",False,True,"2022-06-26 19:20:41.180221+00","mpiggy@example.com"),
	(3,"pbkdf2_sha256$260000$IIixxGaR4FT3RKyhkhfd1t$E2phhsQCDo72cdWNa+PAd2Q6Dv7XGsufTK3EsnXx7C0=",NULL,False,"fozzy","Fozzy","Bear",False,True,"2022-06-26 19:21:00.39305+00","fozzy@example.com"),
	(4,"pbkdf2_sha256$260000$wL4VBsdjeNdOzWuruKeq6W$oQrAxfa6qqu4CDHvF/8Wn1t4Q4Kn6P8SWk+e/jnNTpk=",NULL,False,"rowlf","Rowlf","Dog",False,True,"2022-06-26 19:21:22.968066+00","rowlf@example.com"),
	(5,"pbkdf2_sha256$260000$u8OTq0ECyrq5kZSGVEEKjJ$njtlc/frdmy1tcQa+wVvPSczIz0kO0B7D6i16HkfWWo=",NULL,False,"sam","Sam","Eagle",False,True,"2022-06-26 19:25:10.692801+00","sam@example.com")

insert into store_customer (id, phone, birth_date, membership, user_id)
values
	(1,"897-661-9039","2020-10-28","G",2),
	(2,"649-120-2330","2020-07-16","G",3),
	(3,"434-940-7359","2021-04-28","S",4),
	(4,"326-516-2283","2021-05-22","B",5),


insert into store_collection (id, title, featured_product_id)
values
  (2, 'Grocery', null),
  (3, 'Beauty', null),
  (4, 'Cleaning', null),
  (5, 'Stationary', null),
  (6, 'Pets', null),
  (7, 'Baking', null),
  (8, 'Spices', null),
  (9, 'Toys', null),
  (10, 'Magazines', null);

insert into store_product (id, title, description, unit_price, inventory, last_update, collection_id, slug)
values  
    (1, 'Bread Ww Cluster', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 4.00, 11, '2020-09-11 00:00:00', 6, '-'),
    (2, 'Island Oasis - Raspberry', 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', 84.64, 40, '2020-07-07 00:00:00', 3, '-'),
    (3, 'Shrimp - 21/25, Peel And Deviened', 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', 11.52, 29, '2021-04-05 00:00:00', 3, '-'),
    (4, 'Wood Chips - Regular', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', 73.47, 40, '2020-07-20 00:00:00', 5, '-'),
    (5, 'Lettuce - Mini Greens, Whole', 'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 60.21, 56, '2020-08-18 00:00:00', 5, '-'),
    (6, 'Mustard - Individual Pkg', 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 76.62, 18, '2020-10-25 00:00:00', 6, '-'),
    (7, 'Turkey Tenderloin Frozen', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 13.64, 48, '2020-08-08 00:00:00', 4, '-'),
    (8, 'Silicone Parch. 16.3x24.3', 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 85.76, 55, '2021-06-03 00:00:00', 6, '-'),
    (9, 'Tomatoes - Cherry, Yellow', 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 30.81, 45, '2021-03-03 00:00:00', 5, '-'),
    (10, 'Sloe Gin - Mcguinness', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', 2.82, 69, '2021-04-18 00:00:00', 5, '-')


insert into store_customer (id, phone, birth_date, membership, user_id)
values
    (1, '897-661-9039', '2020-10-28', 'G'),
    (2, '649-120-2330', '2020-07-16', 'G'),
    (3, '434-940-7359', '2021-04-28', 'S'),
    (4, '326-516-2283', '2021-05-22', 'B')

insert into store_order (id, placed_at, payment_status, customer_id)
values
    (1, '2021-04-03 00:00:00', 'P', 1),
    (2, '2021-06-07 00:00:00', 'P', 2),
    (3, '2021-02-03 00:00:00', 'P', 3),
    (4, '2020-07-17 00:00:00', 'F', 3),
    (5, '2021-03-25 00:00:00', 'F', 3),

insert into store_orderitem (id, quantity, unit_price, order_id, product_id)
values  
    (1, 3, 81.61, 1, 1),
    (2, 4, 18.06, 2, 2),
    (3, 4, 38.24, 2, 3),
    (4, 3, 61.53, 3, 4),
    (5, 5, 78.22, 3, 5),
    (6, 1, 4.95, 3, 6),
    (7, 1, 9.07, 3, 7),
    (8, 2, 88.70, 4, 1),

insert into store_cart (id, created_at)
values 
	(1, '2022-06-05 11:12:00');

insert into store_cartitem (quantity, cart_id, product_id)
values 
	(5, 1, 1),
	(3, 1, 5),
	(2, 1, 9);

