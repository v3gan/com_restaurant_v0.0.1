--
-- Clean up old tables
--
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `#__rl_contact`;
DROP TABLE IF EXISTS `#__rl_contact_role_location`;
DROP TABLE IF EXISTS `#__rl_location`;
DROP TABLE IF EXISTS `#__rl_neighborhood`;
DROP TABLE IF EXISTS `#__rl_restaurant`;
DROP TABLE IF EXISTS `#__rl_restaurant_contact`;
DROP TABLE IF EXISTS `#__rl_restaurant_location`;
DROP TABLE IF EXISTS `#__rl_role`;
DROP TABLE IF EXISTS `#__rl_v_restaurant_list`;
DROP VIEW IF EXISTS `#__rl_v_restaurant_list`;
DROP TABLE IF EXISTS `#__rl_disp_restaurant_list`;
DROP TABLE IF EXISTS `#__rl_v_location_neighborhood`;
DROP VIEW IF EXISTS `#__rl_v_location_neighborhood`;
SET foreign_key_checks = 1;

--
-- Table structure for table `#__rl_contact`
--

CREATE TABLE `#__rl_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_contact_role_location`
--

CREATE TABLE IF NOT EXISTS `#__rl_contact_role_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned NOT NULL,
  `location_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `contact_id` (`contact_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_location`
--

CREATE TABLE IF NOT EXISTS `#__rl_location` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`neighborhood_id` int(11) unsigned DEFAULT NULL,
	`address1` varchar(1000) DEFAULT NULL,
	`address2` varchar(1000) DEFAULT NULL,
	`city` varchar(1000) DEFAULT NULL,
	`state` char(2) DEFAULT NULL,
	`zip` varchar(10) DEFAULT NULL,
	`display_logo` tinyint(1) NOT NULL DEFAULT '0',
	`publish` tinyint(1) NOT NULL DEFAULT '0',
	`website` varchar(1000) DEFAULT NULL,
	`phone` char(10) DEFAULT NULL,
	`fax` char(10) DEFAULT NULL,
	`blurb` mediumtext
	,`has_veg_brunch` tinyint(1) NOT NULL default 0
	,`has_table_svc` tinyint(1) NOT NULL default 0
	,`has_alcohol` tinyint(1) NOT NULL default 0
	,`is_byob` tinyint(1) NOT NULL default 0
	,`can_sit_outside` tinyint(1) NOT NULL default 0
  
  PRIMARY KEY (`id`),
  KEY `neighborhood_id` (`neighborhood_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `#__rl_location`
--

INSERT INTO `#__rl_location` (`id`, `neighborhood_id`, `address1`, `address2`, `city`, `state`, `zip`, `display_logo`, `publish`, `website`, `phone`, `fax`, `blurb`) VALUES
(1, 2, '4812 Liberty Ave', NULL, 'Pittsburgh', 'PA', '15224', 1, 1, 'http://www.thebigideapgh.wordpress.com/', '4126874323', NULL, 'The Big Idea is a co-op bookstore, focused on alternative-political movements and literature. They have a café that prioritizes vegan food (including wraps, soups, and baked goods) and a downstairs meeting space that can be reserved for events.'),
(2, 3, '1108 Federal St', NULL, 'Pittsburgh', 'PA', '15212', 1, 1, 'http://www.elburropgh.com/', '4129043451', NULL, 'El Burro has been one of North Side''s hottest spots since they opened in November 2012. Located near Allegheny General Hospital, El Burro serves several vegan items and seems to be adding more by the month! Stop in for a vegan chorizo burrito, tofu tacos, or cauliflower & sweet potato tacos. Rotating vegan specials are also frequently on offer at this take-out restaurant.'),
(3, 4, '512 Perry Highway', NULL, 'Pittsburgh', 'PA', '15229', 1, 1, 'http://mandyspizza.com/', '4129311120', NULL, 'One of two locations, Mandy''s Pizza in Westview has an allergen-free pizza, including vegan cheese, as well as a dedicated fryer for vegan fries. They also sell prepackaged cupcake, muffin, brownie, cookie, pizza crust, flapjack, and flour mixes. They offer vegan lunch specials and coupons, delivery and have indoor seating. With a complete allergen-free menu, it''s a great place for everyone to enjoy pizza.'),
(4, 5, '5996 Penn Circle South', NULL, 'Pittsburgh', 'PA', '15206', 0, 1, 'http://www.plumpanasiankitchen.com/index.php', '4123637586', NULL, 'Plum is a Pan-Asian Fusion restaurant with elements of Thai, Japanese, Chinese, and Southeast Asian cuisine. Vegan options are numerous, with a well-labeled menu. Some vegan favorites are General Tso Tofu, Crispy Thai Spring Rolls, Vegetable Tempura, and Thai Style Mango. Choose Plum for a moderately upscale dining experience.'),
(5, 6, '216 E Eighth Ave', NULL, 'Pittsburgh', 'PA', '15220', 1, 1, 'http://www.tinfrontcafe.com/', '4124614615', NULL, 'The Tin Front Café is one of Pittsburgh''s few vegetarian resturants. It is located in the heart of Homestead''s historic shopping district, and it features many local ingredients. There are many vegan options, and highlights include sandwiches, salads, wraps, and chili, as well as the Sunday buffet brunch.'),
(6, 7, '4104 Penn Ave', NULL, 'Pittsburgh', 'PA', '15224', 1, 1, 'http://www.brillobox.net/', '4126214900', NULL, 'Brillobox may be known for its drinks and hoppin'' music scene, but they also serve up a large food menu! Several items are vegan as-is, and others are clearly labeled when a vegan option is available. Their menu changes seasonally, so be sure stop in often! In addition, Brillobox hosts their “Starving Artist Vegetarian Dinner” every Sunday evening, with a vegan option available.'),
(7, 8, '304 S. Craig St', NULL, 'Pittsburgh', 'PA', '15213', 1, 1, 'http://www.allindiapgh.com/', '4126816600', NULL, 'All India Authentic Cuisine has an extensive daily lunch buffet (excluding Mondays) which includes a plethora of marked vegan options. Over a dozen of the items on their large vegetarian menu can be made vegan. Dinner is half-price on Tuesdays, and they offer a 15% student discount every day. All India also rents a first-floor party room that seats 70.'),
(8, 9, '1118 S Braddock Ave', NULL, 'Pittsburgh', 'PA', '15218', 1, 1, 'http://www.ds6pax.com', '4122414666', NULL, 'D’s SixPax & Dogz is a hot dog shop and beer distributer with vegan-friendly dogz and rolls, a handful of vegans appetizers, and over a thousand beers available in their walk in cooler.'),
(9, 10, '5528 Walnut St', NULL, 'Pittsburgh', 'PA', '15232', 1, 1, 'http://www.pittsburghchinapalace.com/', '4126878586', NULL, 'China Palace has a separate menu of vegan options. Many options for soy and seitan “meats” are available, such as General Tso''s Soy Protein, Lemon Veggie Soy Protein, Sesame Soy Protein, Orange Soy Protein, and Thailand Halo Veggie Shrimp, along with a variety of Veggie “Beefs” and “Chickens”.'),
(10, 11, '2056 Broadway Ave', NULL, 'Pittsburgh', 'PA', '15216', 1, 1, 'http://www.casarastapgh.com/', '4123444700', NULL, 'Located in Beechview, Casa Rasta serves up a mix of authentic Mexican and Caribbean dishes, in a colorful, casual setting: Jalapeños, jerk-spices, plantains, tortillas, rice, mangoes, and agave abound on their menu. BYOB.'),
(11, 12, '1506 East Carson St', NULL, 'Pittsburgh', 'PA', '15203', 1, 1, 'http://www.amazingyoga.net/cafe', '4124325950', NULL, 'Amazing Café is a cheerful space that serves a healthy lunch and nutritious smoothies. They emphasize the importance of seeking out organic and local ingredients as much as possible, and their menu is almost entirely vegan. Nearly everything is fresh and made from scratch, and you can find a selection of raw dishes on their menu as well. Menus items include salads, soups, smoothies, sandwiches, and a hearty entree is always on special.'),
(12, 13, '5878 Forbes Ave', NULL, 'Pittsburgh', 'PA', '15217', 1, 1, 'http://www.aladdinseatery.com/index.php', '4124215100', '4124215390', 'Amazing Café is a cheerful space that serves a healthy lunch and nutritious smoothies. They emphasize the importance of seeking out organic and local ingredients as much as possible, and their menu is almost entirely vegan. Nearly everything is fresh and made from scratch, and you can find a selection of raw dishes on their menu as well. Menus items include salads, soups, smoothies, sandwiches, and a hearty entree is always on special.'),
(13, 2, '5107 Penn Ave', '', 'Pittsburgh', 'PA', '15224', 1, 1, 'http://www.spakbrothers.com/', '4123627725', NULL, 'Spak Brothers is your classic pizza and hoagie store-front, but with many vegan options. It is currently the only place in Pittsburgh where you can get vegan pizza made with Daiya cheese and toppings like seitan sausage and soy pepperoni. They also have Seitan Cheese Steaks, melts, hoagies, and delicious seitan wings.'),
(14, 2, '4627 Liberty Ave', '', 'Pittsburgh', 'PA', '15224', 1, 1, '', '4126889661', NULL, 'The whole separate Vegetarian Menu of this Thai restaurant that includes many various vegetable and curry dishes, all offered with the option of tofu, mock duck, mock scallops, or vegetarian chicken ham, makes this a favorite in the Pittsburgh vegan community.'),
(15, 2, '4903 Baum Blvd', '', 'Pittsburgh', 'PA', '15213', 1, 1, 'http://www.yinzburghbbq.com/', '4126219469', NULL, 'YinzBurgh BBQ offers barbecue fare prepared in the traditional southern style: rubbed with spices and smoked over hardwood, with homemade BBQ sauce on the side. YinzBurgh?s Barbecue-Smoked Tofu can be served up a la cart, or as part of a salad, wrap, or burrito. In addition, they offer a variety of vegan-friendly, southern-style sides, such as Hoppin'' John, collard greens, and black-eyed peas. Yinzburgh is also available for catering your special event.'),
(16, 3, '510 Market St', '', 'Pittsburgh', 'PA', '15222', 1, 1, 'http://www.habitatrestaurant.com/', '4127738848', NULL, 'Habitat is an upscale dining restaurant located in the Fairmont Hotel. They offer vegan selections as part of their "lifestyle" menu, which also features raw, macrobiotic, and other cuisine. Habitat is committed to a variety of environmental initiatives, including composting, recycling, and using locally-sourced ingredients whenever possible.'),
(17, 3, '3138 Dobson Street', '', 'Pittsburgh', 'PA', '15219', 1, 1, 'https://www.facebook.com/lilicoffeeshop', '4126823600', NULL, 'Lili Caf&eacute; is a cozy place in Polish Hill that serves an extensive list of coffee drinks as well as food items such as a Black Bean Burrito, Tempe Ruben, Bahn Mi, Asian Rice Bowl, bagel with Earth Balance or cream cheese and sausage. Twice a month, there is an all-vegan dinner on Wednesday nights, and the menus can be found on their <a href="https://www.facebook.com/lilicoffeeshop" target="_blank">Facebook page</a>. Also, their Sunday brunch always includes a vegan meal option.'),
(18, 3, '701 Smithfield St', '', 'Pittsburgh', 'PA', '15222', 1, 1, 'http://sreesfoods.com/', '4128609181', NULL, 'Sree''s is great for quick, inexpensive Indian food. For one low price you get rice, nan bread, and 3 vegan side dishes-usually a dal, a potato dish, and a tofu dish. It''s delicious!'),
(19, 3, '2401 Penn Ave', 'Pittsburgh Public Market', 'Pittsburgh', 'PA', '15222', 1, 1, '', '4122128816', NULL, 'Specializing in organic and local sourcing, good taste and good health go hand-in-hand at Zest Wishes/Lean Chef En Route. Chef Mya Zeronis''s offerings include Veggie Patties, Millet Mix with Organic Veggies, Raw Soup, Vegan Bacon, freshly made Almond Milk, Raw Cheesecake, raw cold-pressed juices, and superfood Super Shakes. Items vary by location. Currently Zest Wishes/Lean Chef En Route maintains a booth at Schwartz Living Market (South Side) on Fridays and Saturdays, hosts a monthly all-you-can-eat vegan buffet (also at Schwartz), and runs a booth at the Bloomfield Saturday Market.'),
(20, 4, '929 Freeport Rd', '', 'Pittsburgh', 'PA', '15238', 1, 1, 'http://www.aladdinseatery.com/index.php', '4127814300', NULL, 'Aladdin''s Eatery is a great place for Middle Eastern food, with 6 locations around the Pittsburgh area. The menu clearly identifies vegan, gluten-free, and even nut/seed-free options. Vegan offerings include favorites like hummus, baba, tabouli, and falafel, but also specialities such as Aladdin''s rolled pitas, Lebanese Salata, the Loubie Plate, and the Mujadara Pocket.'),
(21, 7, '3511 Butler St', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'http://www.asweetboutique.com/', '4126871265', NULL, 'Bella Christie and Lil? Z?s Sweet Boutique offers a large array of fancy and fun baked goods, pastries, and chocolate-dipped goodies. Their diverse selection of vegan treats includes a cupcake flavor of the month, chocolate dipped s''mores, Oreos, licorice, Rice Krispie treats...and more! They also specialize in custom-designed cakes and desert tables for special occasions. Check out their featured lunch offerings, courtesy of Vegan ABC.'),
(22, 7, '3811 Butler St', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'http://www.coca-cafe.net/', '4126213171', NULL, 'Coca Caf? is a popular breakfast and brunch caf? in Lawrenceville, which is also open for small plates and BYOB 3 nights per week. The menu rotates, but vegan options are clearly marked as vegan/vegan Possible, and the kitchen is flexible with creations.'),
(23, 7, '3810 Butler St', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'http://www.franktuary.com/', '4125867224', NULL, 'Franktuary is a sit-down restaurant and bar with vegan hot dogs! You can get your vegan dog prepared with many different toppings on a variety of rolls-- or you can ask about the veg-chilli, veg-sausage, and veg-(meat)balls du jour, to see if that day''s selections are vegan. They even have vegan Lemon Mini Mousse for dessert!'),
(24, 7, '4717 Butler St', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'https://www.facebook.com/Gusscafe', '4123157271', NULL, 'Gus''s Caf? is a comfortable neighborhood bar, with a completely gluten-free menu. Gus''s specializes in casual street food and a quality beer selection. Look for a coffee menu and outdoor patio, coming soon. Also, every day they feature a soup priced at $4 or pay-what-you-can.'),
(25, 7, '3720 Butler St', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'http://roundcornercantina.com/', '4129042279', '', 'The Round Corner Cantina is a Mexican bar with creative cocktails and tapas. Vegan options are clearly marked and include items such as seitan tacos and potato rolled tacos.'),
(26, 7, '3418 Penn Avenue', '', 'Pittsburgh', 'PA', '15201', 1, 1, 'http://www.pittsburghjuicecompany.com/', '4125865060', '', 'The Pittsburgh Juice Company specializes in vibrant cold-pressed juices, with health at the core of their mission. In addition, PJC offers fresh coconut water and almond milk, as well as an assortment of snacks made with leftovers of the juicing process. Located where Lawrenceville meets the Strip meets Bloomfield, PJC is a central spot to drink your fill of fresh fruits and veggies, and they''re even open early to give your day a healthy start!'),
(27, 8, '305 S Craig St', '', 'Pittsburgh', 'PA', '15213', 1, 0, 'http://avapgh.wordpress.com/', '4129043400', '', 'The owners of Ava Caf? and Lounge partnered with the Quiet Storm Caf? to offer a blend of coffee and globally inspired food and drink, much of which is vegan. Raw and gluten-free options are available too. Currently open weekdays from 8-3, they have loaded bagels, Anytime Quinoa, Spicy Crunchy Salad, and Golden Oat Shakes. Evening hours, shared plate dining, liquor and entertainment are coming soon.'),
(28, 9, '7516 Meade St', '', 'Pittsburgh', 'PA', '15208', 0, 1, 'http://www.eastendfood.coop/', '4122423598', '', 'The East End Food Co-op is a local, member-owned, grocery store. While they carry all the staples, they are best known for supplying local produce and having an extensive bulk goods selection. They carry many vegan prepared food items and baked goods, and they have a small caf? with a hot bar and salad bar (much of which is vegan), fresh juice, and delicious smoothies.'),
(29, 9, '1113 South Braddock Ave,', '', 'Pittsburgh', 'PA', '15218', 1, 1, 'http://root174.com/', '4122434348', '', 'Root 174 is an intimate neighborhood bistro, specializing in the use of locally-sourced, seasonal produce. Their unique menu changes frequently, but always features vegan options.'),
(30, 9, '1137 S Braddock Ave', '', 'Pittsburgh', 'PA', '15218', 1, 1, 'http://square-cafe.com/', '4122448002', '', 'The Square Caf? is a cheerful East-End caf? with breakfast and lunch offerings. Menu items include a seasonal vegan pancake option, vegan sausage, and several tofu dishes, as well as smoothies that can be veganized.'),
(31, 10, '735 Copeland St', '', 'Pittsburgh', 'PA', '15232', 1, 1, 'http://www.edenpitt.com/', '4128027070', '', 'Eden is a moderately upscale restaurant, featuring an array of creative vegan dishes, both raw and cooked. It has a seasonally-changing menu (check their site for current offerings), and special attention is placed on sourcing fresh, locally-grown and organic ingredients (hand-selected from local cooperatives and farms), whenever possible. In addition, Eden''s brunch menu (available on Saturdays and Sundays) contains many vegan options.'),
(32, 10, '232 S. Highland Ave', '', 'Pittsburgh', 'PA', '15206', 1, 1, '', '4122005574', '', 'Oh Yeah! is an ice cream shop and caf? with an outdoor seating area and several flavors of soy ice cream. They offer a huge variety of different toppings (including vegan marshmallows and soy whipped cream!), as well as organic, gluten-free, vegan cinnamon waffles. The fresh-brewed coffee is fair-trade, and they have vegan creamer.'),
(33, 11, '4080 Washington Rd', '', 'Pittsburgh', 'PA', '15317', 1, 1, 'http://www.aladdinseatery.com/', '7242600072', '', 'Aladdin''s Eatery is a great place for Middle Eastern food, with 6 locations around the Pittsburgh area. The menu clearly identifies vegan, gluten-free, and even nut/seed-free options. Vegan offerings include favorites like hummus, baba, tabouli, and falafel, but also specialities such as Aladdin''s rolled pitas, Lebanese Salata, the Loubie Plate, and the Mujadara Pocket.'),
(34, 11, '630 Washington Rd', '', 'Pittsburgh', 'PA', '15228', 1, 1, 'http://www.aladdinseatery.com/', '4123441111', '', 'Aladdin''s Eatery is a great place for Middle Eastern food, with 6 locations around the Pittsburgh area. The menu clearly identifies vegan, gluten-free, and even nut/seed-free options. Vegan offerings include favorites like hummus, baba, tabouli, and falafel, but also specialities such as Aladdin''s rolled pitas, Lebanese Salata, the Loubie Plate, and the Mujadara Pocket.'),
(35, 11, '5474 Campbells Run Road', '', 'Pittsburgh', 'PA', '15205', 1, 1, 'http://lovinghut.us/pittsburgh_01/index.html', '4127872727', '', 'Loving Hut, located in Robinson Township, is currently Pittsburgh?s only fully vegan restaurant. The Asian cuisine includes many different soup, rice, vegetable, and noodle dishes with a variety of soy meats, seitan, and tofu. Some favorite dishes include Cheese Bread, Wonton Soup, BBQ Noodle, Grilled Sensation, Lucky Lemon Grass, and Spicy Cha Cha soy shrimp. Loving Hut also has a dessert case with vegan cakes and a buffet lunch or dinner every Saturday from 12-9 PM.'),
(36, 12, '1327 East Carson St,?', '', 'Pittsburgh', 'PA', '15203', 1, 1, 'http://www.beehivebuzz.com/', '4124884483', '', 'The Beehive is an eclectic cafe with light lunch options. Offerings include premade daily sandwiches and one or two daily soups, all well-labeled. They offer a variety of non-dairy milks for coffee and have a number of vegan baked goods.'),
(37, 12, '2339 East Carson St', '', 'Pittsburgh', 'PA', '15203', 0, 1, 'http://www.doublewidegrill.com/', '4123901111', '', 'Double Wide Grill is another favorite amongst the vegan community in Pittsburgh because it has a whole vegetarian menu with clearly labeled vegan options that include delicious entrees like Tofu with Chimichurri Sauce, Caribbean Coconut Tofu, Meatless Stroganoff, and BBQ Pulled Seitan. Their seitan wings are another favorite. They have a separate fryer for their deep-fried vegan items and vegan wood-grilled items are grilled on a separate elevated section.'),
(38, 12, '1317 East Carson St', '', 'Pittsburgh', 'PA', '15203', 1, 0, 'https://www.facebook.com/pages/jonathans-foods/125584417601735', '4128559573', '', 'Jonathan''s Foods is a booth located within the Schwartz Living Market on East Carson Street between 13th and 14th Streets. His food is entirely vegan, gluten-free and uses organic ingredients. Jonathan serves hummus wraps, veggie burgers, quesadillas, and rotating specials, as well as organic chocolate chip cookies. Schwartz Living Market is currently open Tuesday through Saturday from 11AM to 5PM.'),
(39, 12, '1828 East Carson St,?', '', 'Pittsburgh', 'PA', '15203', 1, 1, 'http://www.piperspub.com/', '4123813977', '', 'Piper''s Pub specializes in traditional English, Irish, and Scottish fare, complete with an extensive beer and Scotch list and televised soccer matches. They also have plenty of vegan options, such as Vegan Stuffed Peppers and a Seitan Thai Chili Wrap, and lunch and dinner specials are vegan every Tuesday night.'),
(40, 12, '86 South 26th St', '', 'Pittsburgh', 'PA', '15203', 0, 1, 'http://www.zenithpgh.com/', '4124814833', '', 'Zenith is a vegetarian restaurant in the South Side and most of their food is vegan. Their menu changes weekly, so be sure to check it out ahead of time on their website. Don''t miss their popular Sunday brunch, which includes their vegan, all-you-can-eat buffet (including several vegan cakes), coffee or tea, AND an entree dish (choice of vegan or vegetarian).'),
(41, 12, '1317 East Carson St', '', 'Pittsburgh', 'PA', '15203', 1, 1, 'http://www.zestwishes.com/', '4122128816', '', 'Specializing in organic and local sourcing, good taste and good health go hand-in-hand at Zest Wishes/Lean Chef En Route. Chef Mya Zeronis''s offerings include Veggie Patties, Millet Mix with Organic Veggies, Raw Soup, Vegan Bacon, freshly made Almond Milk, Raw Cheesecake, raw cold-pressed juices, and superfood Super Shakes. Items vary by location. Currently Zest Wishes/Lean Chef En Route maintains a booth at Schwartz Living Market (South Side) on Fridays and Saturdays, hosts a monthly all-you-can-eat vegan buffet (also at Schwartz), and runs a booth at the Bloomfield Saturday Market.'),
(42, 12, '1207 East Carson St', '', 'Pittsburgh', 'PA', '15203', 1, 1, '', '4123811820', '', 'Kassab''s Lebanese Cuisine is a quaint restaurant in the heart of the South Side on East Carson Street. Plentiful vegan options include Falafel, Spinach Pie, Hummus, Sleek, Baba Ghannooj, and Mjaddara, just to name a few. Two of their salad dressings, Balsamic Vinaigrette and the House Dressing, are vegan. All vegan items are clearly labeled on their in-house menu.'),
(43, 13, '2218 Murray Ave', '', 'Pittsburgh', 'PA', '15217', 1, 1, 'http://bubblepi.com/', '4124220993', '', 'Bubble Pi is an Asian bakery that specializes in "healthy and delicious" options focusing on fresh, wholesome foods. They use locally-grown herbs and imported Okinawa black sugar. They offer a separate vegan menu, which includes Chocolate Coconut Cookies, Black or White Russian Tea Balls, Brown Rice Tea Cookies, and Walnut Sticks. They also offer vegan Tofu Dim Sum and bubble tea.'),
(44, 13, '1937 Murray Ave', '', 'Pittsburgh', 'PA', '15217', 1, 1, 'http://dobrateapgh.com/', '4124499833', '', 'Dobra Tea is a multicultural teahouse offering deserts, snacks, and light fare, as well as over 100 teas and specialty drinks. They also hold events, such as bellydancing shows and classes.'),
(45, 13, '1923 Murray Ave', '', 'Pittsburgh', 'PA', '15217', 1, 1, 'https://www.gluuteny.com/', '4125214890', '', 'Gluuteny is a dedicated gluten free, casein free, preservative free bakery. On a daily basis, a visitor is likely to find Mexican wedding cookies, cream-filled cupcakes, white almond cupcakes, or similar baked vegan treats. They also have gluten-free vegan pizza by the slice or by the pie.'),
(46, 13, '1900 Murray Ave', '', 'Pittsburgh', 'PA', '15217', 1, 1, 'http://mandyspizza.com/', '', '', 'One of two locations, Mandy''s Pizza on Murray Ave has an allergen-free pizza, including vegan cheese, as well as a dedicated fryer for vegan fries. They also sell prepackaged cupcake, muffin, brownie, cookie, pizza crust, flapjack, and flour mixes. The Squirrel Hill location has an expanded vegan menu with options like Vegan Pizza Parmigiano, White Pizza, The Not-So Pulled Pork Sub, and The Nearly Buffalo Chicken Sub. They offer vegan lunch specials and coupons, delivery and have indoor seating. With a complete allergen-free menu, it''s a great place for everyone to enjoy pizza.'),
(47, 13, '2103 Murray Ave', '', 'Pittsburgh', 'PA', '15217', 1, 1, '', '', '', 'Sree''s is an Indian restaurant with quick, delicious, inexpensive food. For one price you get rice, naan bread, and 3 vegan side dishes-usually a dal, a potato dish, and a tofu dish.'),
(48, 14, '', '', '', '', '', 1, 1, 'http://www.mygoodiesbakery.com/', '', '', 'Since 2007, My Goodies Bakery has served the Pittsburgh area with vegan treats. You can find My Goodies at the East Liberty Farmers? Market, The Big Idea Bookstore and Caf?, and Vibo''s Italian Bakery to name a few. Many of the desserts can be made with allergies and preferences in mind. Visit www.mygoodiesbakery.com for more locations and to request a special order.'),
(49, 14, '', '', '', '', '', 0, 0, 'https://www.facebook.com/RedVelveteenSweets', '', '', 'Red Velveteen is a one-woman, all-vegan baking company, specializing in cupcakes, cookies, muffins, and other baked goods. Orders for Red Velveteen can be placed by going to www.redvelveteen.com, emailing?mweston@redvelveteen.com?or through Facebook, facebook.com/redvelveteensweets. Her baked goods can also be found at Espresso a Mano and the 720 Music Cafe.'),
(50, 14, '', '', '', '', '', 1, 1, 'http://saludpgh.webs.com/', '', '', 'SaludPgh is expanding to bring healthy, accessible, and affordable Latino cuisine to the ''Burgh! You''ll find them serving up a variety of vegan empanadas at the Bloomfield Market every Saturday, and at StartUptown on Tuesdays and Thursdays from 12:00-2:00 pm. Also, join them the last Sunday of every month at 720 Cafe for "Best Brunch," an all-you-can eat buffet of delicious Latino- and Asian-fusion dishes.'),
(51, 14, '', '', '', '', '', 1, 1, 'https://www.facebook.com/pages/The-Vegan-Goddess/133043010088657', '', '', 'The Vegan Goddess - where decadence meets compassion - has been serving the Pittsburgh area with baked goods since 2007. The Vegan Goddess specializes in both sweets and savory items, as well as an ever-increasing line of gluten-free and/or soy-free treats. Orders can be placed via email or phone, and she can frequently be found at community events. Check her Facebook page for more information and a schedule of upcoming events. the Vegan Goddess has also published the "I Don''t Feel Like Cooking" Cookbook, and she hopes to debut another soon.'),
(52, 14, '', '', '', '', '', 1, 1, 'http://www.veganabc.com/', '', '', 'Vegan ABC''s offerings include "Chicken" Salad, Buffalo "Chicken," Pulled "Pork" and "Beefy" Chili. According to their brochure, "All of our products are completely plant-based. No animals were harmed or involved in our recipes." Vegan ABC products are currently available at Marty''s Market (Strip District), Biddle''s Escape (Regent Square), Allegheny City Market (North Side), Naturally Soergel''s (Wexford), East End Food Co-op (East End), Three Little Birds Cafe (Glenshaw), Eden''s Market (Mt. Lebanon), Sunny Bridge Natural Foods (McMurray), Sweet Boutique (Lawrenceville), 52nd Street Market (Lawrenceville), and Mandy''s Pizza (Squirrel Hill).'),
(53, 4, '150 Gamma Dr', NULL, 'Pittsburgh', 'PA', '15238', 1, 1, 'http://www.blueelephantcafe.com/', '4129637200', NULL, 'Located off exit 28 in RIDC park, the Blue Elephant Café is a coffee shop, meeting space, and all-vegetarian eatery, with breakfast and lunch hours. The Blue Elephant Café features organic coffee and specialty beverages, in addition to soups, salads, wraps, sandwiches, and more, all available for eat-in or grab-and-go convenience. In addition to their regular café seating, they also offer outdoor seating in warm weather and several private conference rooms for meetings.'),
(54, 4, '210 W. Main St.', NULL, 'Saxonburg', 'PA', '16056', 1, 1, 'http://www.randitas.com/', '7248228677', NULL, 'Randita''s, in Saxonburg, offers an entirely vegan and organic menu, making them the only independently-owned vegan restaurant in the area. In addition, they cater and have a food truck. They''re open for lunch Monday-Saturday, and also for dinner on Friday and Saturday.'),
(55, 2, '5523 Penn Ave', NULL, 'Pittsburgh', 'PA', '15206', 1, 1, 'http://www.saltpgh.com/', '4124417258', NULL, 'Salt of the Earth brings you a fine-dining experience… without all the fine-dining pretense! Their menu changes with the seasons in order to capitalize on local ingredients, and they offer an impressive selection of beers, wine, and craft cocktails to pair with your meal. You can be seated communal-style on the first floor, in sight of the exposed kitchen, or upstairs on the mezzanine. Vegan creations are clearly labeled, and many vegetarian options can be made vegan as well: Ask your server!'),
(56, 4, '20510 Perry Highway', NULL, 'Pittsburgh', 'PA', '16066', 0, 1, 'http://www.madmex.com/', '7247415656', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(57, 4, '4100 William Penn Hwy', NULL, 'Pittsburgh', 'PA', '15146', 0, 1, 'http://www.madmex.com/', '4123496767', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(58, 4, '7905 McKnight Road', NULL, 'Pittsburgh', 'PA', '15237', 0, 1, 'http://www.madmex.com/', '4123665656', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(59, 5, '130 S.Highland Ave', NULL, 'Pittsburgh', 'PA', '15206', 1, 1, 'http://www.casarastapgh.com/', '4123627969', NULL, 'Located in East Liberty, Casa Rasta serves up a mix of authentic Mexican and Caribbean dishes, in a colorful, casual setting: Jalapenos, jerk-spices, plantains, tortillas, rice, mangoes, and agave abound on their menu. BYOB.'),
(60, 8, 'One Schenley Park', NULL, 'Pittsburgh', 'PA', '15213', 1, 1, 'http://phipps.conservatory.org/visit-phipps/cafe-phipps.aspx', '4126226914', NULL, 'Located in the Welcome Center at Phipps Conservatory and Botanical Gardens, Café Phipps strives to produce healthy food for people and the planet, which includes sourcing local, organic, sustainably produced ingredients. They offer a variety of vegan salads, sandwiches, snacks, and soups daily, with additional meatless items on Mondays. As a "Green Restaurant Certified" establishment, they choose reusable dishware, 100% paper products, and filtered water instead of plastic bottles. Food and Wine magazine recently featured Café Phipps as one of the best museum restaurants in the country.'),
(61, 8, '370 Atwood Street', NULL, 'Pittsburgh', 'PA', '15213', 0, 1, 'http://www.madmex.com/', '4126815656', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(62, 10, '220 South Highland Ave', NULL, 'Pittsburgh', 'PA', '15206', 0, 1, 'http://www.madmex.com/', '4123450185', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(63, 11, '2 Robinson Plaza', NULL, 'Pittsburgh', 'PA', '15205', 0, 1, 'http://www.madmex.com/', '4124945656', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(64, 11, '2101 Green Tree Road', NULL, 'Pittsburgh', 'PA', '15220', 0, 1, 'http://www.madmex.com/', '4122790200', NULL, 'One of seven locations, Mad Mex is known for its large portions of Tex-mex and for its even larger margaritas. Along with a hip vibe and Día de Muertos-themed decor, Mad Mex offers vegan options in every section of the menu, whether it be tacos, enchilladas, fajitas, or burritos! You can select between portabella mushrooms or tofu as your protein filling, and vegan cheese and sour cream can be substituted on any dish.'),
(65, 12, '1317 East Carson St', 'Schwartz Living Market', 'Pittsburgh', 'PA', '15203', 1, 1, 'http://www.zestwishes.com/', '4122128816', NULL, 'Specializing in organic and local sourcing, good taste and good health go hand-in-hand at Zest Wishes/Lean Chef En Route. Chef Mya Zeronis&#39;s offerings include Veggie Patties, Millet Mix with Organic Veggies, Raw Soup, Vegan Bacon, freshly made Almond Milk, Raw Cheesecake, raw cold-pressed juices, and superfood Super Shakes. Items vary by location. Currently Zest Wishes/Lean Chef En Route maintains a booth at Schwartz Living Market (South Side) on Fridays and Saturdays, hosts a monthly all-you-can-eat vegan buffet (also at Schwartz), and runs a booth at the Bloomfield Saturday Market.'),
(66, 13, '2103 Murray Ave', NULL, 'Pittsburgh', 'PA', '15217', 1, 1, NULL, '4128609181', NULL, 'Sree&#39;s is an Indian restaurant with quick, delicious, inexpensive food. For one price you get rice, naan bread, and 3 vegan side dishes-usually a dal, a potato dish, and a tofu dish.'),
(67, 14, NULL, NULL, 'Pittsburgh', 'PA', '15217', 1, 1, 'http://www.chipandkale.com/', NULL, NULL, 'Chip and Kale is a vegan meal delivery business that delivers within 20 miles of downtown Pittsburgh. Chip and Kale&#39;s mission is to make healthy, plant-based food accessible and easy to anyone with a busy lifestyle. Meals are prepared fresh each week (menu also changes weekly) and dishes are delivered in frozen meal kits with easy-to-follow instructions.'),
(68, 14, NULL, NULL, 'Pittsburgh', 'PA', '15217', 1, 1, 'http://saludpgh.webs.com/', NULL, NULL, 'SaludPgh is expanding to bring healthy, accessible, and affordable Latino cuisine to the &#39;Burgh! You&#39;ll find them serving up a variety of vegan empanadas at the Bloomfield Market every Saturday, and at StartUptown on Tuesdays and Thursdays from 12:00-2:00 pm. Also, join them the last Sunday of every month at 720 Cafe for &ldquo;Best Brunch,&rdquo; an all-you-can eat buffet of delicious Latino- and Asian-fusion dishes.');

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_neighborhood`
--

CREATE TABLE IF NOT EXISTS `#__rl_neighborhood` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `sort_order` int(4) DEFAULT NULL,
  `hex_background` char(6) DEFAULT 'FFFFFF',
  `hex_text` char(6) NOT NULL DEFAULT '000000',
  `hex_color_code` char(6) NOT NULL,
  `text_theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `#__rl_neighborhood`
--

INSERT INTO `#__rl_neighborhood` (`id`, `name`, `sort_order`, `hex_background`, `hex_text`, `hex_color_code`, `text_theme`) VALUES
(2, 'Bloomfield / Garfield', 10, 'B22DE6', '000000', '', 'dark'),
(3, 'Downtown / North Side / Polish Hill / Strip District', 20, 'e7af39', '000000', '', 'dark'),
(4, 'East and North', 25, '9A7017', '000000', '', 'dark'),
(5, 'East Liberty / Friendship', 30, 'ccffcc', '000000', '', 'dark'),
(6, 'Homestead / Waterfront', 40, 'C0B2FF', '000000', '', 'dark'),
(7, 'Lawrenceville', 50, 'CCAA8F', '000000', '', 'dark'),
(8, 'Oakland', 60, '66b38d', '000000', '', 'dark'),
(9, 'Point Breeze / Regent Square', 70, '6699b4', '000000', '', 'dark'),
(10, 'Shadyside', 80, 'bc7fce', '000000', '', 'dark'),
(11, 'South and West', 90, 'd08e86', '000000', '', 'dark'),
(12, 'South Side', 100, '6c91c7', '000000', '', 'dark'),
(13, 'Squirrel Hill', 110, 'bfab7f', '000000', '', 'dark'),
(14, 'Online / Mobile', 9999, '000000', 'FFFFFF', '', 'light');

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_restaurant`
--

CREATE TABLE IF NOT EXISTS `#__rl_restaurant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tier` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `#__rl_restaurant`
--

INSERT INTO `#__rl_restaurant` (`id`, `name`, `tier`) VALUES
(1, 'The Big Idea Cooperative Bookstore and Café', 1),
(2, 'El Burro', 1),
(3, 'Mandy''s Pizza', 1),
(4, 'Plum Pan-Asian Kitchen', 1),
(5, 'Tin Front Café', 1),
(6, 'Brillobox', 1),
(7, 'All India Authentic Cuisine', 1),
(8, 'D''s Six Pax & Dogz', 1),
(9, 'China Palace', 1),
(10, 'Casa Rasta', 1),
(11, 'Amazing Café', 1),
(12, 'Aladdins Eatery', 1),
(13, 'Spak Brothers', 1),
(14, 'Thai Cuisine', 1),
(15, 'YinzBurgh BBQ', 1),
(16, 'Habitat', 1),
(17, 'Lili Caf&eacute;', 1),
(18, 'Sree''s', 1),
(19, 'Zest Wishes/Lean Chef En Route', 1),
(21, 'Blue Elephant Caf&eacute;', 1),
(23, 'Randita''s Organic Vegan Caf', 1),
(24, 'Bella Christie''s & Lil Z''s Sweet Boutique', 1),
(25, 'Coca Caf&eacute;', 1),
(26, 'Franktuary', 1),
(27, 'Gus''s', 1),
(28, 'Round Corner Cantina', 1),
(29, 'The Pittsburgh Juice Company', 1),
(30, 'Ava Caf&eacute; and Lounge', 1),
(31, 'East End Food Co-op', 1),
(32, 'Root 174', 1),
(33, 'Square Caf&eacute;', 1),
(34, 'Eden', 1),
(35, 'Oh Yeah! Ice Cream & Coffee', 1),
(36, 'Loving Hut Vegan Cuisine', 1),
(37, 'Beehive', 1),
(38, 'Double-Wide Grill', 1),
(39, 'Jonathan''s Foods', 1),
(40, 'Kassab''s Lebanese Cuisine', 1),
(41, 'Piper''s Pub', 1),
(42, 'Zenith', 1),
(43, 'Bubble Pi Bakery', 1),
(44, 'Dobra Tea', 1),
(45, 'Gluuteny', 1),
(46, 'My Goodies Bakery', 1),
(47, 'Red Velveteen Vegan Sweets and Eats', 1),
(48, 'The Vegan Goddess', 1),
(49, 'Vegan ABC', 1),
(50, 'Salt of the Earth', 1),
(51, 'Mad Mex', 2),
(52, 'Phipps', 2),
(53, 'Chip and Kale', 1),
(54, 'Salud', 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_restaurant_contact`
--

CREATE TABLE IF NOT EXISTS `#__rl_restaurant_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_restaurant_location`
--

CREATE TABLE IF NOT EXISTS `#__rl_restaurant_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) unsigned NOT NULL,
  `location_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `#__rl_restaurant_location`
--

INSERT INTO `#__rl_restaurant_location` (`id`, `restaurant_id`, `location_id`) VALUES
(25, 1, 1),
(26, 2, 2),
(27, 3, 3),
(28, 4, 4),
(29, 5, 5),
(30, 6, 6),
(31, 7, 7),
(32, 8, 8),
(33, 9, 9),
(34, 10, 10),
(35, 11, 11),
(36, 12, 12),
(37, 13, 13),
(38, 14, 14),
(39, 15, 15),
(40, 16, 16),
(41, 17, 17),
(42, 18, 18),
(44, 21, 53),
(45, 23, 54),
(46, 24, 21),
(47, 25, 22),
(48, 26, 23),
(49, 27, 24),
(50, 28, 25),
(51, 29, 26),
(52, 30, 27),
(53, 31, 28),
(54, 32, 29),
(55, 33, 30),
(56, 34, 31),
(57, 35, 32),
(58, 36, 35),
(59, 37, 36),
(60, 38, 37),
(61, 39, 38),
(62, 40, 42),
(63, 41, 39),
(64, 42, 40),
(65, 43, 43),
(66, 44, 44),
(67, 45, 45),
(68, 46, 44),
(69, 47, 49),
(70, 48, 51),
(71, 49, 52),
(72, 3, 46),
(73, 12, 20),
(74, 12, 33),
(75, 12, 34),
(76, 50, 55),
(77, 51, 56),
(78, 51, 57),
(79, 51, 58),
(80, 10, 59),
(81, 52, 60),
(82, 51, 61),
(83, 46, 48),
(84, 51, 62),
(85, 51, 64),
(86, 51, 63),
(87, 19, 65),
(88, 18, 66),
(89, 18, 66),
(90, 54, 68),
(91, 53, 67);

-- --------------------------------------------------------

--
-- Table structure for table `#__rl_role`
--

CREATE TABLE IF NOT EXISTS `#__rl_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Structure for view `#__rl_v_location_neighborhood`
--

CREATE VIEW `#__rl_v_location_neighborhood` AS select `l`.`id` AS `location_id`,`n`.`id` AS `neighborhood_id`,`n`.`name` AS `neighborhood`,`n`.`hex_background` AS `hex_background`,`n`.`text_theme` AS `hex_text`,`n`.`sort_order` AS `sort_order`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip`,`l`.`display_logo` AS `display_logo`,`l`.`publish` AS `publish`,`l`.`website` AS `website`,`l`.`phone` AS `phone`,`l`.`fax` AS `fax`,`l`.`blurb` AS `blurb` from (`#__rl_location` `l` join `#__rl_neighborhood` `n` on((`l`.`neighborhood_id` = `n`.`id`))) where (`l`.`publish` = 1);

-- --------------------------------------------------------

--
-- Structure for view `#__rl_v_restaurant_list`
--

CREATE VIEW `#__rl_v_restaurant_list` AS 
select rl.id as restaurant_location_id
	,`n`.`id` AS `neighborhood_id`
	,`n`.`name` AS `neighborhood`
	,`n`.`hex_background` AS `hex_background`
	,`n`.`text_theme` AS `hex_text`
	,`n`.`sort_order` AS `neighborhood_sort_order`
	,`r`.`name` AS `restaurant`
	,`r`.`id` AS `restaurant_id`
	,`l`.`id` AS `location_id`
	,`l`.`address1` AS `address1`
	,`l`.`address2` AS `address2`
	,`l`.`city` AS `city`
	,`l`.`state` AS `state`
	,`l`.`zip` AS `zip`
	,`l`.`display_logo` AS `display_logo`
	,`l`.`publish` AS `pub_state`
	,`l`.`website` AS `website`
	,`l`.`phone` AS `phone`
	,`l`.`fax` AS `fax`
	,`l`.`blurb` AS `blurb` 
	,0 AS `catid`
	,0 AS `ordering`
	,'0000-00-00 00:00:00' AS `publish_up`
	,'0000-00-00 00:00:00' AS `publish_down`	
	,'' AS alias
	from ((`#__rl_location` `l` join `#__rl_neighborhood` `n` on `l`.`neighborhood_id` = `n`.`id`) 
		join `#__rl_restaurant_location` `rl` on `rl`.`location_id` = `l`.`id`) 
		join `#__rl_restaurant` `r` on `rl`.`restaurant_id` = `r`.`id`
	where `l`.`publish` = 1;
	
CREATE TABLE IF NOT EXISTS `#__rl_disp_restaurant_list` (
`id` int(11) unsigned NOT NULL AUTO_INCREMENT
,`restaurant_location_id` int(11) unsigned NOT NULL default 0
,`neighborhood_id` int(11) unsigned NOT NULL
,`neighborhood` varchar(1000)
,`hex_background` char(6)
,`hex_text` varchar(50)
,`neighborhood_sort_order` int(4)
,`restaurant` varchar(100)
,`restaurant_id` int(11) unsigned
,`location_id` int(11) unsigned
,`address1` varchar(1000)
,`address2` varchar(1000)
,`city` varchar(1000)
,`state` char(2)
,`zip` varchar(10)
,`display_logo` tinyint(1)
,`pub_state` tinyint(1) NOT NULL default 0
,`website` varchar(1000)
,`phone` char(10)
,`fax` char(10)
,`blurb` mediumtext
,`catid` int(11) NOT NULL default 0
,`ordering` int(11) NOT NULL DEFAULT 0
,`publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
,`publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
,`alias` varchar(255) NOT NULL DEFAULT ''
,`has_veg_brunch` tinyint(1) NOT NULL default 0
,`has_table_svc` tinyint(1) NOT NULL default 0
,`has_alcohol` tinyint(1) NOT NULL default 0
,`is_byob` tinyint(1) NOT NULL default 0
,`can_sit_outside` tinyint(1) NOT NULL default 0
,PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `#__rl_disp_restaurant_list`(`restaurant_location_id`, `neighborhood_id`, `neighborhood`, `hex_background`, `hex_text`, `neighborhood_sort_order`, `restaurant`, `restaurant_id`, `location_id`, `address1`, `address2`, `city`, `state`, `zip`, `display_logo`, `pub_state`, `website`, `phone`, `fax`, `blurb`, `catid`, `ordering`, `publish_up`, `publish_down`) SELECT `restaurant_location_id`, `neighborhood_id`, `neighborhood`, `hex_background`, `hex_text`, `neighborhood_sort_order`, `restaurant`, `restaurant_id`, `location_id`, `address1`, `address2`, `city`, `state`, `zip`, `display_logo`, `pub_state`, `website`, `phone`, `fax`, `blurb`, `catid`, `ordering`, `publish_up`, `publish_down` FROM `#__rl_v_restaurant_list`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `#__rl_contact_role_location`
--
ALTER TABLE `#__rl_contact_role_location`
  ADD CONSTRAINT `#__rl_contact_role_location_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `#__rl_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `#__rl_contact_role_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `#__rl_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `#__rl_contact_role_location_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `#__rl_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `#__rl_location`
--
ALTER TABLE `#__rl_location`
  ADD CONSTRAINT `#__rl_location_ibfk_1` FOREIGN KEY (`neighborhood_id`) REFERENCES `#__rl_neighborhood` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `#__rl_restaurant_contact`
--
ALTER TABLE `#__rl_restaurant_contact`
  ADD CONSTRAINT `#__rl_restaurant_contact_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `#__rl_restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `#__rl_restaurant_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `#__rl_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `#__rl_restaurant_location`
--
ALTER TABLE `#__rl_restaurant_location`
  ADD CONSTRAINT `#__rl_restaurant_location_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `#__rl_restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `#__rl_restaurant_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `#__rl_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;