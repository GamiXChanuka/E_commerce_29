INSERT INTO `address` VALUES (1,'123','Main St','New York','10001','Manhattan'),
							 (2,'456','Elm St','Los Angeles','90001','Downtown'),
							 (3,'789','Maple Ave','Chicago','60601','Loop'),
							 (4,'123','Main St','New York','10001','Manhattan'),
                             (5,'456','Elm St','Los Angeles','90001','Downtown'),
                             (6,'789','Maple Ave','Chicago','60601','Loop');

INSERT INTO `administrator` VALUES (1,'admin123','Admin','User','adminpassword','admin@example.com');

INSERT INTO `attributes` VALUES (1,'Color'),
								(2,'Storage'),
                                (3,'RAM');

INSERT INTO `backorders` VALUES (43,1,2,42,'2024-10-02 02:03:52'),
                                (46,1,13,45,'2024-10-07 15:51:10');
                                
INSERT INTO `cart` VALUES (1,1);

INSERT INTO `cartitem` VALUES (1,1,1),
                              (2,1,2),
                              (3,1,4),
                              (4,1,3),
                              (7,1,3),
                              (8,1,1);

INSERT INTO `category` VALUES (1,'Electronics',NULL),
							  (2,'Mobile Phones',1),
                              (3,'Laptops',1),
                              (4,'Home Appliances',NULL),
                              (5,'Toys',NULL),
                              (6,'Action Figures',5),
                              (7,'Dolls',5),
                              (8,'Educational Toys',5);

INSERT INTO `deliverymodule` VALUES (1,1,'2023-09-05',1),
								    (2,2,'2023-09-06',2);
                                    

INSERT INTO `image` VALUES (1,'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-14-pro/iphone-14-pro-deep-purple.jpg',1),
						   (2,'https://celltronics.lk/wp-content/uploads/2022/09/Apple-iPhone-14-pro-2.jpg',2),
                           (3,'https://img.drz.lazcdn.com/static/lk/p/8b2d5fdf01f0562a6c7c2065e0c2ff9d.jpg_200x200q80.jpg_.webp',3),
                           (4,'https://img.drz.lazcdn.com/static/lk/p/292aa54e558f4b630ce4855478f65f88.jpg_200x200q80.jpg_.webp',4),
                           (7,'https://img.drz.lazcdn.com/static/lk/p/a337b7a6699a1f8cc10650bbc5b02c6b.jpg_200x200q80.jpg_.webp',5),
                           (8,'https://img.drz.lazcdn.com/static/lk/p/b006cd13bcdc791ce6b91f4b05e1c988.jpg_200x200q80.jpg_.webp',6),
                           (9,'https://img.drz.lazcdn.com/static/lk/p/0414db07b3b792e896410bd830b0fc05.jpg_200x200q80.jpg_.webp',7),
                           (10,'https://img.drz.lazcdn.com/g/kf/S64f080ae314d4e32b7f1952a3f21da4eG.jpg_200x200q80.jpg_.webp',8);

INSERT INTO `order` VALUES (41,1,'2024-10-01','delivery','card',1999.98,1),
						   (42,1,'2024-10-02','delivery','card',2074.95,1),
                           (45,1,'2024-10-07','delivery','card',12999.87,1);
                           
INSERT INTO `orderitem` VALUES (41,1,2),
							   (42,1,2),
                               (42,6,3),
                               (45,1,13);
                               
INSERT INTO `product` (`ProductID`,`CategoryID`,`Title`) VALUES 
                      (1,2,'iPhone 14 Pro'),
                      (2,3,'MacBook Pro'),
                      (3,4,'Washing Machine'),
                      (5,5,'Lego Building Set'),
                      (6,7,'Barbie Doll'),
                      (7,6,'Action Figure Set'),
                      (8,8,'Educational Board Game');

INSERT INTO `productattribute` VALUES (1,1,1,'Black'),
									  (2,2,1,'128GB'),
                                      (3,1,2,'Silver'),
                                      (4,2,2,'256GB'),
                                      (5,3,3,'16GB'),
                                      (6,1,5,'Multi-Color'),
                                      (7,2,5,'1500 Pieces'),
                                      (8,1,6,'Pink'),
                                      (9,2,6,'N/A'),
                                      (10,1,7,'Various'),
                                      (11,2,7,'N/A'),
                                      (12,1,8,'Multi-Color'),
                                      (13,2,8,'N/A');
                                      
INSERT INTO `registeredcustomer` VALUES (1,'johndoe','john@example.com','password123',1),
                                        (2,'janesmith','jane@example.com','securepass',2);
                                        
INSERT INTO `user` VALUES (1,'1234567890','John','Doe','Registered'),
						  (2,'0987654321','Jane','Smith','Registered'),
                          (3,'1122334455','Alice','Johnson','UnRegistered'),
                          (4,'1234567890','John','Doe','Registered'),
                          (5,'0987654321','Jane','Smith','Registered'),
                          (6,'1122334455','Alice','Johnson','UnRegistered');
                          
INSERT INTO `variant` VALUES (1,'iPhone 14 Pro - 128GB','The latest iPhone with 128GB storage',1,'IP14P128',999.99,0),
                             (2,'iPhone 14 Pro - 256GB','The latest iPhone with 256GB storage',1,'IP14P256',1099.99,5),
                             (3,'MacBook Pro - 16GB RAM','MacBook Pro with M2 chip and 16GB RAM',2,'MBP16',2399.99,5),
                             (4,'Washing Machine - 8kg','Front-load washing machine with 8kg capacity',3,'WM8KG',499.99,15),
                             (5,'Lego Building Set - 1500 Pieces','A large Lego set for building multiple models',4,'Lego1500',59.99,10),
                             (6,'Barbie Doll - Classic','A classic Barbie doll with accessories',5,'BarbieClassic',24.99,17),
                             (7,'Action Figure Set - Superheroes','Set of 5 action figures from popular superhero movies',6,'AFSuperheroes',39.99,15),
                             (8,'Educational Board Game - Math Whiz','A fun board game to learn math skills',7,'MathWhizGame',29.99,5);                                                                           
                                        