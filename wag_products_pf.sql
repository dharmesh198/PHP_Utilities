mysql -usvcLongbow -phx@zB$Vt3Qf!nC9fR -h 10.10.70.5 commerce -A;

mysql> select pf.pf_id,pf.pf_code,pf.pf_name,p.part_name,ws.wag_scat_name,wc.wag_cat_name from product_family pf inner join partnames p using(part_id) inner join wag_part_subcategory wps using(part_id) inner join wag_subcategory ws using(wag_scat_id) inner join wag_category wc using(wag_cat_id) where wc.wag_cat_name IN ('exterior','interior') order by wc.wag_cat_name limit 10;
+-------+---------+-------------------------------------------+-----------+--------------------------+--------------+
| pf_id | pf_code | pf_name                                   | part_name | wag_scat_name            | wag_cat_name |
+-------+---------+-------------------------------------------+-----------+--------------------------+--------------+
|  1466 | 5312    | Chrome Air Dam by Bully                   | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1467 | 5314    | Paintable Air Dam by Distintive Truck     | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1468 | 5316    | Paintable Air Dam by JSP                  | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1469 | 5318    | Paintable Air Dam by Stylin'              | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1470 | 5319    | Paintable Air Dam by Truck Master Designs | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1473 | 5327    | Front Air Dams by Xenon                   | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1735 | 5868    | Replacement Front Air Dam                 | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  3448 | 1921    | F150 Front Air Dam by 3D Carbon           | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  3982 | 5317    | Paintable Air Dam by Keystone             | Air Dam   | Bumper Covers & Air Dams | Exterior     |
|  1466 | 5312    | Chrome Air Dam by Bully                   | Air Dam   | Replacement Body Parts   | Exterior     |
+-------+---------+-------------------------------------------+-----------+--------------------------+--------------+
10 rows in set (0.05 sec)

mysql> SELECT
    -> distinct(prod.product_id),prod.sku,prod.part_id,pf.pf_code,pf.pf_name,pa.part_name,ws.wag_scat_name,wc.wag_cat_name
    -> FROM
    -> products prod
    -> inner join product_family pf ON prod.sty_pf_id = pf.pf_id
    -> inner join partnames pa ON prod.part_id = pa.part_id
    -> inner join wag_part_subcategory wps ON pa.part_id = wps.part_id
    -> inner join wag_subcategory ws using(wag_scat_id)
    -> inner join wag_category wc using(wag_cat_id)
    -> WHERE
    -> wc.wag_cat_name IN ('exterior','interior')
    -> ORDER BY
    -> wc.wag_cat_name,pf.pf_code  limit 10;
+------------+----------+---------+---------+-----------------------------+-----------+-----------------+--------------+
| product_id | sku      | part_id | pf_code | pf_name                     | part_name | wag_scat_name   | wag_cat_name |
+------------+----------+---------+---------+-----------------------------+-----------+-----------------+--------------+
|     297136 | P4539808 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297137 | P4539809 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297138 | P4539810 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297139 | P4539811 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297140 | P4539812 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297141 | P4539813 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297142 | P4539814 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297143 | P4539815 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297144 | P4539816 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
|     297145 | P4539817 |     505 | 1052    | Rocket Locker LED Bed Rails | Bed Rails | Bed Accessories | Exterior     |
+------------+----------+---------+---------+-----------------------------+-----------+-----------------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT
    -> count(distinct(prod.product_id)) as total_products,pf.pf_code,pf.pf_name,pa.part_name,ws.wag_scat_name,wc.wag_cat_name
    -> FROM
    -> products prod
    -> inner join product_family pf ON prod.sty_pf_id = pf.pf_id
    -> inner join partnames pa ON prod.part_id = pa.part_id
    -> inner join wag_part_subcategory wps ON pa.part_id = wps.part_id
    -> inner join wag_subcategory ws using(wag_scat_id)
    -> inner join wag_category wc using(wag_cat_id)
    -> WHERE
    -> wc.wag_cat_name IN ('exterior','interior')
    -> GROUP BY
    -> pf.pf_code
    -> limit 10;
+----------------+---------+---------------------------------------+-------------------+----------------------------------+--------------+
| total_products | pf_code | pf_name                               | part_name         | wag_scat_name                    | wag_cat_name |
+----------------+---------+---------------------------------------+-------------------+----------------------------------+--------------+
|            302 | 1       | Black Armor Floor Mats                | Floor Liner       | Carpet - Replacement             | Interior     |
|             41 | 1052    | Rocket Locker LED Bed Rails           | Bed Rails         | Bed Accessories                  | Exterior     |
|              1 | 107     | Cargo Stabilizer Bar & Net            | Cargo Bar         | Cargo Organizers/Storage         | Interior     |
|              1 | 108     | Cargo Area Pet Barriers               | Pet Divider       | For Your Pet                     | Interior     |
|             52 | 10904   | BakFlip HD Tonneau Cover              | Tonneau Cover     | Tonneau Covers, Truck Bed Covers | Exterior     |
|             17 | 114     | Slide-On Towing Mirrors               | Mirror            | Mirrors - Side View              | Exterior     |
|             37 | 1254    | Bushwacker Pocket Style Fender Flares | Fender Flares     | Fender Flares & Trim             | Exterior     |
|              3 | 1267    | Smooth Bed Steps                      | Smooth Steps      | Bed Accessories                  | Exterior     |
|            161 | 1315    | WeatherTech All-Weather Floor Mats    | Floor Mats        | Floor Mats                       | Interior     |
|              2 | 1338    | Tailgate Seal Kit                     | Weatherstrip Seal | Tailgate Accessories             | Exterior     |
+----------------+---------+---------------------------------------+-------------------+----------------------------------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT distinct(pf.pf_id), pf.pf_code, pf.pf_name, vt.vehicle_type, pf.isnew, pfr.rating, pfr.review_count, pfrns.ref_number FROM product_family pf INNER JOIN products p ON pf.pf_id = p.sty_pf_id INNER JOIN product_family_vehicle_type pfvt ON pf.pf_id = pfvt.pf_id INNER JOIN vehicle_type vt ON pfvt.vehicle_type_id = vt.vehicle_type_id LEFT JOIN product_family_ratings pfr ON pf.pf_id = pfr.pf_id  LEFT JOIN product_family_ref_number_stylin pfrns ON pf.pf_id = pfrns.pf_id limit 50;
+-------+---------+---------------------------------+------------------------+-------+--------+--------------+------------+
| pf_id | pf_code | pf_name                         | vehicle_type           | isnew | rating | review_count | ref_number |
+-------+---------+---------------------------------+------------------------+-------+--------+--------------+------------+
|    16 | 1       | Black Armor Floor Mats          | Cars                   |     0 |   1.00 |            3 | NULL       |
|    16 | 1       | Black Armor Floor Mats          | Chevy/GMC SUV          |     0 |   1.00 |            3 | NULL       |
|    16 | 1       | Black Armor Floor Mats          | Chevy/GMC Truck        |     0 |   1.00 |            3 | NULL       |
|    16 | 1       | Black Armor Floor Mats          | Ford Truck and SUV     |     0 |   1.00 |            3 | NULL       |
|    16 | 1       | Black Armor Floor Mats          | Sport Compact Car      |     0 |   1.00 |            3 | NULL       |
|    16 | 1       | Black Armor Floor Mats          | Truck, SUV and Minivan |     0 |   1.00 |            3 | NULL       |
|    17 | 2       | Catch-All Carpet Floor Mats     | Cars                   |     0 |   4.89 |           18 | RN12628    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Cars                   |     0 |   4.89 |           18 | RN12643    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Chevy/GMC SUV          |     0 |   4.89 |           18 | RN12628    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Chevy/GMC SUV          |     0 |   4.89 |           18 | RN12643    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Chevy/GMC Truck        |     0 |   4.89 |           18 | RN12628    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Chevy/GMC Truck        |     0 |   4.89 |           18 | RN12643    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Ford Truck and SUV     |     0 |   4.89 |           18 | RN12628    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Ford Truck and SUV     |     0 |   4.89 |           18 | RN12643    |
|    17 | 2       | Catch-All Carpet Floor Mats     | Sport Compact Car      |     0 |   4.89 |           18 | RN12628    |


mysql> select * from vehicle_type;
+-----------------+---------------+---------------------+----------------+---------------------+----------------+---------+
| vehicle_type_id | vehicle_type  | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-----------------+---------------+---------------------+----------------+---------------------+----------------+---------+
|               1 | All           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               2 | ATV           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               3 | Car           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               4 | Jeep          | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               5 | Motorcycle    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               6 | RV            | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               7 | Sport Compact | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               8 | SUV           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               9 | Truck         | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              10 | UTV           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              11 | Van           | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              12 | Volkswagen    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-----------------+---------------+---------------------+----------------+---------------------+----------------+---------+
12 rows in set (0.00 sec)

mysql> select count(1) from product_family;
+----------+
| count(1) |
+----------+
|     3782 |
+----------+
1 row in set (0.01 sec)

mysql> select count(1) from product_family_vehicle_type;
+----------+
| count(1) |
+----------+
|        0 |
+----------+
1 row in set (0.01 sec)

mysql> select * from vehicle_type;
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
| vehicle_type_id | vehicle_type           | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
|               1 | All                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               2 | ATV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               3 | Car                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               4 | Jeep                   | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               5 | Motorcycle             | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               6 | RV                     | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               7 | Sport Compact          | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               8 | SUV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               9 | Truck                  | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              10 | UTV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              11 | Van                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              12 | Volkswagen             | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              13 | Cars                   | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              14 | Chevy/GMC SUV          | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              15 | Chevy/GMC Truck        | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              16 | Ford Truck and SUV     | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              17 | Motorcycles            | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              18 | Sport Compact Car      | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              19 | Truck, SUV and Minivan | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
19 rows in set (0.00 sec)

mysql> select count(1) from product_family_vehicle_type;
+----------+
| count(1) |
+----------+
|     4510 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from wag_category;
+----------+
| count(1) |
+----------+
|       17 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from wag_subcategory;
+----------+
| count(1) |
+----------+
|      239 |
+----------+
1 row in set (0.00 sec)

mysql> 

+------------+-----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
| wag_cat_id | wag_cat_name                      | channel_id | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+------------+-----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
|          1 | Interior                          |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          2 | Tools & Garage                    |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          3 | Lighting                          |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          4 | Exterior                          |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          5 | Towing                            |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          6 | Suspension                        |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          7 | Performance                       |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          8 | Gift Guide                        |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          9 | Jeep® Suspension                  |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         10 | Fuel Savings                      |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         11 | Jeep® Exterior                    |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         12 | Jeep® Performance                 |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         13 | Jeep® Tops & Accessories          |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         14 | Jeep® Interior                    |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         15 | Jeep® Lighting                    |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         16 | Jeep® Towing & Recovery Equipment |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         17 | Jeep® Tools & Garage              |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+------------+-----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
17 rows in set (0.02 sec)

mysql> select * from wag_subcategory limit 10;
+-------------+------------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
| wag_scat_id | wag_scat_name                      | wag_cat_id | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-------------+------------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
|           1 | Floor Mats                         |          1 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           2 | Other Safety & Convenience         |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           3 | Seat Covers                        |          1 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           4 | Tools                              |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           5 | Back Up Cameras, Alerts & Lighting |          3 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           6 | Gas Doors & Caps                   |          4 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           7 | Antennas                           |          4 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           8 | Snow Brushes                       |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|           9 | Garage Gear                        |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|          10 | Horns, Air Horns & Train Horns     |          4 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-------------+------------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
10 rows in set (0.00 sec)

mysql> select * from wag_subcategory where wag_scat_name like '%home%' limit 10;
+-------------+----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
| wag_scat_id | wag_scat_name                    | wag_cat_id | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-------------+----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
|         136 | Home, Office & Garage Décor      |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|         236 | Home, Office, & Garage Logo Mats |          2 | 2011-01-08 06:17:07 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-------------+----------------------------------+------------+---------------------+----------------+---------------------+----------------+---------+
2 rows in set (0.00 sec)

mysql> select count(1) from wag_subcategory_linklist;
+----------+
| count(1) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from product_family_assets;
+----------+
| count(1) |
+----------+
|        0 |
+----------+
1 row in set (0.00 sec)

mysql> select a.pf_id,a.asset_id,b.asset_name,b.sequence from product_family_assets a inner join assets b using(asset_id) WHERE b.asset_type_id = 2;
+-------+----------+------------------------------------------+----------+
| pf_id | asset_id | asset_name                               | sequence |
+-------+----------+------------------------------------------+----------+
|   114 |   752768 | Airaid-Tour.flv                          |        1 |
|   225 |   752769 | GibsonVideoGameLA-Rush.flv               |        1 |
|   299 |   752770 | CWTahoeBoltOverInstall.flv               |        1 |
|   299 |   752771 | CWf150BoltOverInstall.flv                |        2 |


mysql> select count(1) from product_family_attributes;
+----------+
| count(1) |
+----------+
|      750 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from product_family_filters;
+----------+
| count(1) |
+----------+
|     1071 |
+----------+

mysql> select count(1) from  product_family_ref_number_stylin;
+----------+
| count(1) |
+----------+
|     1672 |
+----------+

mysql> select count(1) from  product_family_ratings;
+----------+
| count(1) |
+----------+
|      695 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from products_ref_number_stylin;
+----------+
| count(1) |
+----------+
|     5424 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from related_product_families_stylin;
+----------+
| count(1) |
+----------+
|     5704 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from related_products_pf_stylin;
+----------+
| count(1) |
+----------+
|      251 |
+----------+
1 row in set (0.00 sec)

mysql> select count(1) from vehicle_type_model;
+----------+
| count(1) |
+----------+
|      533 |
+----------+
1 row in set (0.00 sec)

mysql> select distinct(vehicle_type_id) from vehicle_type_model limit 10;
+-----------------+
| vehicle_type_id |
+-----------------+
|              13 |
|              14 |
|              15 |
|              16 |
|              18 |
|              19 |
+-----------------+
6 rows in set (0.01 sec)

mysql> SELECT * from vehicle_type where vehicle_type_id IN (select distinct(vehicle_type_id) from vehicle_type_model);
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
| vehicle_type_id | vehicle_type           | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
|               3 | Cars                   | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              26 | Chevy/GMC SUV          | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              27 | Chevy/GMC Truck        | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              28 | Dodge Truck & SUV      | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              29 | Ford Truck and SUV     | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              30 | Sport Compact Car      | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              31 | Truck, SUV and Minivan | 2011-01-19 04:29:06 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+


mysql> select * from vehicle_type;
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
| vehicle_type_id | vehicle_type           | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
|               1 | All                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               2 | ATV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               3 | Car                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               4 | Jeep                   | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               5 | Motorcycle             | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               6 | RV                     | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               7 | Sport Compact          | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               8 | SUV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|               9 | Truck                  | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              10 | UTV                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              11 | Van                    | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              12 | Volkswagen             | 2010-12-10 22:52:49 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              13 | Cars                   | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              14 | Chevy/GMC SUV          | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              15 | Chevy/GMC Truck        | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              16 | Ford Truck and SUV     | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              17 | Motorcycles            | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              18 | Sport Compact Car      | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
|              19 | Truck, SUV and Minivan | 2011-01-08 06:26:33 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+-----------------+------------------------+---------------------+----------------+---------------------+----------------+---------+
19 rows in set (0.00 sec)

mysql> select * from asset_type;

mysql> select * from assets where asset_type_id = 2;

mysql> select count(sku) from LONGBOW_data.products where sty_pf_id > 0;
+------------+
| count(sku) |
+------------+
|     104919 |
+------------+
1 row in set (0.41 sec)

mysql> select count(1) from tmp_stylin_product_families_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_stylin_product_families_v3 where invalid = 1;

mysql> select count(1) from tmp_stylin_realted_product_families_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_stylin_realted_product_families_v3 where invalid = 1;

mysql> select count(1) from tmp_stylin_reference_product_families_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_stylin_reference_product_families_v3 where invalid = 1;

mysql> select count(1) from tmp_pf_ratings_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_pf_ratings_v3 where invalid = 1;

mysql> select count(1) from tmp_stylin_product_families_assets_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_stylin_product_families_assets_v3 where invalid = 1;

mysql> select count(1) from  tmp_stylin_reference_products_v3 where invalid = 1;
mysql> select distinct(reason) from  tmp_stylin_reference_products_v3 where invalid = 1;

mysql> select count(1) from  tmp_stylin_related_product_pf_v3 where invalid = 1;
mysql> select distinct(reason) from  tmp_stylin_related_product_pf_v3 where invalid = 1;

mysql> select count(1) from tmp_stylin_product_families_products_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_stylin_product_families_products_v3 where invalid = 1;

mysql> select count(1) from tmp_wag_subcategory_linklist_v6 where invalid = 1;
mysql> select distinct(reason) from tmp_wag_subcategory_linklist_v6 where invalid = 1;

mysql> select count(1) from tmp_copy_prodattributes_pfattr_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_copy_prodattributes_pfattr_v3 where invalid = 1;

mysql> select count(1) from tmp_pf_filters_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_pf_filters_v3 where invalid = 1;

mysql> select count(1) from tmp_pf_vehicle_type_v3 where invalid = 1;
mysql> select distinct(reason) from tmp_pf_vehicle_type_v3 where invalid = 1;

mysql> select a.part_id,a.brand_id,b.part_name,c.brand_name from product_family a inner join partnames b using(part_id) inner join brands c using(brand_id) limit 100;

mysql> select * from wag_subcategory a inner join wag_category b using(wag_cat_id) where a.wag_scat_name like '%Jeep® %';

mysql> select a.wag_scat_id,a.wag_scat_name,b.wag_parent_scat_id,b.wag_child_scat_id,c.wag_scat_name from wag_subcategory a inner join wag_subcategory_linklist b ON a.wag_scat_id = b.wag_parent_scat_id INNER JOIN wag_subcategory c ON b.wag_child_scat_id = c.wag_scat_id WHERE a.wag_scat_name = 'Bed Accessories';

I. TIRES
# Products
mysql> select product_id, sku,  part_name,brand_name, wag_scat_name, PP.publish_channel_name as product_publish_channel_name,asset_name, asset_desc, sequence, start_date, end_date, AP.publish_channel_name as asset_publish_channel_name
    -> from products
    -> inner join partnames using (part_id)
    -> inner join brands using (brand_id)
    -> inner join product_assets using (product_id)
    -> inner join assets using (asset_id)
    -> inner join asset_type using (asset_type_id)
    -> inner join publish_channel PP on (PP.publish_channel_id = products.publish_channel_id)
    -> inner join publish_channel AP on (AP.publish_channel_id = assets.publish_channel_id)
    -> inner join wag_part_subcategory using (part_id)
    -> inner join wag_subcategory using (wag_scat_id)
    -> where wag_scat_name = 'Tires' limit 10;
+------------+----------+-----------+------------+---------------+------------------------------+---------------------+------------+----------+---------------------+---------------------+----------------------------+
| product_id | sku      | part_name | brand_name | wag_scat_name | product_publish_channel_name | asset_name          | asset_desc | sequence | start_date          | end_date            | asset_publish_channel_name |
+------------+----------+-----------+------------+---------------+------------------------------+---------------------+------------+----------+---------------------+---------------------+----------------------------+
|    2948077 | MIC21201 | Tire      | Michelin   | Tires         | All                          | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2948078 | MIC94200 | Tire      | Michelin   | Tires         | All                          | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2948079 | MIC85527 | Tire      | Michelin   | Tires         | All                          | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2948080 | MIC63035 | Tire      | Michelin   | Tires         | All                          | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963406 | MIC31837 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963419 | MIC33284 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963531 | MIC54891 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963533 | MIC54929 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963565 | MIC65211 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
|    2963589 | MIC70184 | Tire      | Michelin   | Tires         | Stylin Only                  | PilotMXM4_23591.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
+------------+----------+-----------+------------+---------------+------------------------------+---------------------+------------+----------+---------------------+---------------------+----------------------------+
10 rows in set (8.54 sec)

# Product Family
mysql> select pf_code, pf_name, part_name,brand_name, wag_scat_name, channel_name, PP.publish_channel_name as pf_publish_channel_name,asset_name, asset_desc, sequence, start_date, end_date, AP.publish_channel_name as asset_publish_channel_name
    -> from product_family
    -> inner join partnames using (part_id)
    -> inner join brands using (brand_id)
    -> inner join product_family_assets using (pf_id)
    -> inner join assets using (asset_id)
    -> inner join asset_type using (asset_type_id)
    -> inner join channels using (channel_id)
    -> inner join publish_channel PP on (PP.publish_channel_id = product_family.publish_channel_id)
    -> inner join publish_channel AP on (AP.publish_channel_id = assets.publish_channel_id)
    -> inner join wag_part_subcategory using (part_id)
    -> inner join wag_subcategory using (wag_scat_id)
    -> where wag_scat_name = 'Tires' limit 10;
+---------+------------------------------------+-----------+-------------+---------------+--------------+-------------------------+--------------------------------+------------+----------+---------------------+---------------------+----------------------------+
| pf_code | pf_name                            | part_name | brand_name  | wag_scat_name | channel_name | pf_publish_channel_name | asset_name                     | asset_desc | sequence | start_date          | end_date            | asset_publish_channel_name |
+---------+------------------------------------+-----------+-------------+---------------+--------------+-------------------------+--------------------------------+------------+----------+---------------------+---------------------+----------------------------+
| 2285    | Pure Leather Protectant            | Tire      | Stylin'     | Tires         | STYLIN       | Stylin Only             | PureLeatherProtectant_2285.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21371   | Kumho Steel Radial (722) Tire      | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | 722tire_21371.jpg              | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21372   | Kumho Steel Radial (798) Tire      | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | 798tire_21372.jpg              | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21375   | Kumho Ecsta AST (KU25) HP Tire     | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | KU25_21375.jpg                 | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21378   | Kumho Ecsta LX (KU27) HP Tire      | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | ku27_21378.jpg                 | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21387   | Kumho Solus (KH14) Tire            | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | SolusKH14Tire_21387.jpg        | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21390   | Kumho Road Venture AT (KL78) Tire  | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | KL78_21390.jpg                 | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21373   | Kumho Radial (716) Tire            | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | KumhoRadialTire_2_21373.jpg    | Image      |        2 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21373   | Kumho Radial (716) Tire            | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | KumhoRadialTire_21373.jpg      | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21389   | Kumho Road Venture APT (KL51) Tire | Tire      | Kumho Tires | Tires         | STYLIN       | Stylin Only             | KL51_21389.jpg                 | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
+---------+------------------------------------+-----------+-------------+---------------+--------------+-------------------------+--------------------------------+------------+----------+---------------------+---------------------+----------------------------+
10 rows in set (0.03 sec)

II. JEEP
mysql> select * from wag_category where wag_cat_name like 'Jeep%';
+------------+--------------+------------+---------------------+----------------+---------------------+----------------+---------+
| wag_cat_id | wag_cat_name | channel_id | created_datetime    | create_user_id | modified_datetime   | modify_user_id | deleted |
+------------+--------------+------------+---------------------+----------------+---------------------+----------------+---------+
|         18 | Jeep®        |          3 | 2011-01-18 09:58:50 |            839 | 0000-00-00 00:00:00 |           NULL |       0 |
+------------+--------------+------------+---------------------+----------------+---------------------+----------------+---------+
1 row in set (0.00 sec)

-- Products

mysql> select product_id, sku,  part_name,brand_name, wag_scat_name, PP.publish_channel_name as product_publish_channel_name,asset_name, asset_desc, sequence, start_date, end_date, AP.publish_channel_name as asset_publish_channel_name
    -> from products
    -> inner join partnames using (part_id)
    -> inner join brands using (brand_id)
    -> inner join product_assets using (product_id)
    -> inner join assets using (asset_id)
    -> inner join asset_type using (asset_type_id)
    -> inner join publish_channel PP on (PP.publish_channel_id = products.publish_channel_id)
    -> inner join publish_channel AP on (AP.publish_channel_id = assets.publish_channel_id)
    -> inner join wag_part_subcategory using (part_id)
    -> inner join wag_subcategory using (wag_scat_id)
    -> inner join wag_category using (wag_cat_id)
    -> where wag_cat_id = 18 limit 10;
+------------+-----------+-----------+--------------+-----------------------------------------+------------------------------+----------------------+------------+----------+---------------------+---------------------+----------------------------+
| product_id | sku       | part_name | brand_name   | wag_scat_name                           | product_publish_channel_name | asset_name           | asset_desc | sequence | start_date          | end_date            | asset_publish_channel_name |
+------------+-----------+-----------+--------------+-----------------------------------------+------------------------------+----------------------+------------+----------+---------------------+---------------------+----------------------------+
|    2439015 | 11151.11  | Sound Box | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | rr_soundbox_gen.jpg  | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|    2439094 | 11156.11  | Sound Box | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | rr_soundbox_gen.jpg  | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|     287931 | O23792515 | Sound Bar | Outland      | Jeep® Mobile Audio, Video & Accessories | All                          | 792515.jpg           | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|    2439267 | 792515    | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 792515.jpg           | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|      73637 | 13001.09  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13001.09-dis.jpg     | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|     397460 | 13001.15  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13001.09-dis.jpg     | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|     397461 | 13001.37  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13001.09-dis.jpg     | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|      73638 | 13001.51  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13001_51_updated.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|      73639 | 13001.61  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13001_61_updated.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
|      73642 | 13002.01  | Sound Bar | Rugged Ridge | Jeep® Mobile Audio, Video & Accessories | All                          | 13002.01.jpg         | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | All                        |
+------------+-----------+-----------+--------------+-----------------------------------------+------------------------------+----------------------+------------+----------+---------------------+---------------------+----------------------------+
10 rows in set (1.54 sec)

-- Product family

mysql> select pf_code, pf_name, part_name,brand_name, wag_scat_name, channel_name, PP.publish_channel_name as pf_publish_channel_name,asset_name, asset_desc, sequence, start_date, end_date, AP.publish_channel_name as asset_publish_channel_name
    -> from product_family
    -> inner join partnames using (part_id)
    -> inner join brands using (brand_id)
    -> inner join product_family_assets using (pf_id)
    -> inner join assets using (asset_id)
    -> inner join asset_type using (asset_type_id)
    -> inner join channels using (channel_id)
    -> inner join publish_channel PP on (PP.publish_channel_id = product_family.publish_channel_id)
    -> inner join publish_channel AP on (AP.publish_channel_id = assets.publish_channel_id)
    -> inner join wag_part_subcategory using (part_id)
    -> inner join wag_subcategory using (wag_scat_id)
    -> inner join wag_category using (wag_cat_id)
    -> where wag_cat_id = 18 limit 10;
+---------+---------------------------------------------------------+-----------+-------------------+-----------------------------------------+--------------+-------------------------+------------------------------+------------+----------+---------------------+---------------------+----------------------------+
| pf_code | pf_name                                                 | part_name | brand_name        | wag_scat_name                           | channel_name | pf_publish_channel_name | asset_name                   | asset_desc | sequence | start_date          | end_date            | asset_publish_channel_name |
+---------+---------------------------------------------------------+-----------+-------------------+-----------------------------------------+--------------+-------------------------+------------------------------+------------+----------+---------------------+---------------------+----------------------------+
| 22027   | Bestop Sound Bar Cap                                    | Sound Bar | Bestop            | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | 8004035BES_22027.jpg         | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22478   | 3-Way Custom-Fit Overhead Sound Bar by Rampage Products | Sound Bar | Rampage           | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | custom_sound_bar_22478.jpg   | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22617   | Select Increments Sky-Pod Speaker Enclosure             | Sound Bar | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | skypod_22617.jpg             | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22773   | Select Increments Quad-Pod Speaker Enclosures           | Sound Bar | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | quadpod_22773.jpg            | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21779   | Select Increments Centra-Pod Speaker Enclosures         | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | speakerenclosure_2_21779.jpg | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 21779   | Select Increments Centra-Pod Speaker Enclosures         | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | speakerenclosure_21779.jpg   | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22772   | Select Increments Mod-Pod Enclosures                    | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | modpod_2_22772.jpg           | Image      |        2 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22772   | Select Increments Mod-Pod Enclosures                    | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | modpod_22772.jpg             | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22774   | Select Increments XJ-Pod Speaker Enclosures             | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | xjpod_22774.jpg              | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
| 22775   | Select Increments Intra-Pod Subwoofer Center Console    | Sound Box | Select Increments | Jeep® Mobile Audio, Video & Accessories | STYLIN       | Stylin Only             | intrapod_22775.jpg           | Image      |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 | Stylin Only                |
+---------+---------------------------------------------------------+-----------+-------------------+-----------------------------------------+--------------+-------------------------+------------------------------+------------+----------+---------------------+---------------------+----------------------------+
10 rows in set (0.01 sec)
 

-- Query to find parent and child subcategories from linklist table
 
mysql> select scl.wag_scat_lnklst_id,scl.wag_parent_scat_id as parent_scat_id,ws1.wag_scat_name as parent_scat_name,scl.wag_child_scat_id as child_scat_id,ws2.wag_scat_name as child_scat_name, wc.wag_cat_name as child_wag_category from wag_subcategory_linklist scl inner join wag_subcategory ws1 ON scl.wag_parent_scat_id = ws1.wag_scat_id INNER JOIN wag_subcategory ws2 ON scl.wag_child_scat_id = ws2.wag_scat_id INNER JOIN wag_category wc ON ws2.wag_cat_id = wc.wag_cat_id order by parent_scat_name;

-- Query to find product families for wag category & subcategories

mysql> select e.wag_cat_name,d.wag_scat_name,b.part_name,f.brand_name ,a.pf_code,a.pf_name,a.pf_status_id from product_family a inner join partnames b using(part_id)
    -> INNER join wag_part_subcategory c ON b.part_id = c.part_id
    -> INNER JOIN brands f ON a.brand_id = f.brand_id
    -> INNER join wag_subcategory d ON c.wag_scat_id = d.wag_scat_id
    -> LEFT join wag_category e ON d.wag_cat_id = e.wag_cat_id
    -> WHERE
    -> d.wag_scat_name = 'Antennas';
+--------------+---------------+-----------------+-------------------------+-----------+-----------------------------------------------------------------+--------------+
| wag_cat_name | wag_scat_name | part_name       | brand_name              | pf_code   | pf_name                                                         | pf_status_id |
+--------------+---------------+-----------------+-------------------------+-----------+-----------------------------------------------------------------+--------------+
| Exterior     | Antennas      | Antenna Adapter | All Sales               | 3054      | Antenna Adapters by All Sales                                   |            1 |
| Exterior     | Antennas      | Antenna Adapter | Empire Motor Sports     | 3056      | Antenna Adapters by Empire Motor Sports                         |            1 |
| Exterior     | Antennas      | Antenna Adapter | Shorty                  | 3057      | Antenna Adapters by Shorty                                      |            1 |
| Exterior     | Antennas      | Antenna Adapter | Billet Specialties      | 3055      | Antenna Adapters by Billet Specialties                          |            1 |
| Exterior     | Antennas      | Antenna         | Aries                   | 55        | Cellular Phone Booster Antennas                                 |            1 |
| Exterior     | Antennas      | Antenna         | Stylin'                 | Stylin'55 | Stylin' Antenna Cellular Phone Booster Antennas                 |    



-- Query to find wag category and subcategories and their active pf count

mysql> select a.wag_cat_name,b.wag_scat_name,count(e.pf_id) from wag_category a inner join wag_subcategory b USING(wag_cat_id) INNER JOIN wag_part_subcategory c USING(wag_scat_id) INNER JOIN partnames d USING(part_id) INNER JOIN product_family e USING(part_id) WHERE e.pf_status_id = 1 AND a.wag_cat_name = 'Jeep®' GROUP BY b.wag_scat_name;
+--------------+------------------------------------------------------+----------------+
| wag_cat_name | wag_scat_name                                        | count(e.pf_id) |
+--------------+------------------------------------------------------+----------------+
| Jeep®        | Air Compressors                                      |             45 |
| Jeep®        | Doors, Windows, & Protective Covers                  |             53 |
| Jeep®        | Floor Jacks, Jack Stands & Accessories               |              4 |
| Jeep®        | Gas Cans, Funnels & Carriers                         |              5 |
| Jeep®        | Jeep Air Filters                                     |              8 |
| Jeep®        | Jeep Bikini Tops                                     |             15 |
| Jeep®        | Jeep Billet & Stainless Interior Accessories         |              3 |
| Jeep®        | Jeep Body Armor, Rocker Guards, & Rock Sliders       |             14 |
| Jeep®        | Jeep Brake Parts & Accessories                       |             32 |
| Jeep®        | Jeep Bumpers                                         |             49 |
| Jeep®        | Jeep Chrome & Stainless Trim                         |             94 |
| Jeep®        | Jeep Corner Lenses                                   |             18 |
| Jeep®        | Jeep Covers                                          |             18 |
| Jeep®        | Jeep Dash Kits, Covers & Accessories                 |             57 |
| Jeep®        | Jeep Differentials & Components                      |             23 |
| Jeep®        | Jeep Door Handles & Arm Rest                         |             94 |
| Jeep®        | Jeep Door Handles, Hinges & Accessories              |              9 |
| Jeep®        | Jeep Engine & Trans Cooling                          |             16 |
| Jeep®        | Jeep Exhaust Systems                                 |             43 |
| Jeep®        | Jeep Fenders, Fender Flares & Trim                   |            120 |

-- Query to find the products of product families
mysql> select pf.pf_id,pf.pf_code,pf.pf_name, p.product_id as usap_product_id,p.sku as usap_sku,ps.sty_sku as stylin_sku,ps.sty_part_id as stylin_part_id, pf.publish_channel_id,p.publish_channel_id from product_family pf inner join products p ON pf.pf_id = p.sty_pf_id INNER  JOIN products_stylin ps ON p.sty_product_id = ps.sty_product_id WHERE p.sty_product_id > 1 limit 100;
+-------+---------+-----------------------------------------------------------+-----------------+---------------+-------------+----------------+
| pf_id | pf_code | pf_name                                                   | usap_product_id | usap_sku      | stylin_sku  | stylin_part_id |
+-------+---------+-----------------------------------------------------------+-----------------+---------------+-------------+----------------+
|  4709 | 238     | Stainless Steel Door Edge Guards                          |         2894491 | ADE37000320   | 37000320    |           7785 |
|  2847 | 6297    | Designer Key Fobs by US Speedo                            |         2944488 | USS11020514   | 11020514USS |         596826 |
|  6193 | 22684   | Custom Molded Replacement Carpet by Trim Parts            |         2994371 | TMP520442964  | 520442964   |         761194 |
|   372 | 1422    | Magnetic Billet-Look Decals                               |         2939736 | TSC00076      | 00076TAS    |         477965 |
|   372 | 1422    | Magnetic Billet-Look Decals                               |         2939737 | TSC00079      | 00079TAS    |         477968 |
|   372 | 1422    | Magnetic Billet-Look Decals                               |         2939738 | TSC00080      | 00080TAS    |         477969 |
|   372 | 1422    | Magnetic Billet-Look Decals                               |         2940440 | TSC00083      | 00083TAS    |         477972 |
|  4200 | 23465   | Light Mine Magnetic LED Hands-Free Task Light             |         2914934 | RSR00105      | 00105RIS    |         789249 |
|  1081 | 3135    | Steep Square Port Accents by TFP                          |         2940507 | TFP00127      | 00127TFP    |         524633 |
|  1082 | 3136    | Trapezoid Port Accents by TFP                             |         2940502 | TFP00137      | 00137TFP    |         524634 |
|  1079 | 3131    | Round Port Accents by TFP                                 |         2940504 | TFP00157      | 00157TFP    |         524635 |
|  1075 | 3127    | Oval Port Accents by TFP                                  |         2940503 | TFP00167      | 00167TFP    |         524636 |
|  1082 | 3136    | Trapezoid Port Accents by TFP                             |         2940501 | TFP00197      | 00197TFP    |         524637 |


SELECT * FROM ( 
	SELECT 'pf.pf_id','pf.pf_code','pf.pf_name',' p.product_id as usap_product_id','p.sku as usap_sku','ps.sty_sku as stylin_sku','ps.sty_part_id as stylin_part_id',' pf.publish_channel_id','p.publish_channel_id' UNION 
(select pf.pf_id,pf.pf_code,pf.pf_name, p.product_id as usap_product_id,p.sku as usap_sku,ps.sty_sku as stylin_sku,ps.sty_part_id as stylin_part_id, pf.publish_channel_id,p.publish_channel_id from product_family pf inner join products p ON pf.pf_id = p.sty_pf_id INNER  JOIN products_stylin ps ON p.sty_product_id = ps.sty_product_id WHERE p.sty_product_id > 1 )) AS x4d492b540582d  
INTO OUTFILE '/tmp/product_family_products_08_feb.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Query to find the product families under specific categories
select e.wag_cat_name,d.wag_scat_name,b.part_name,f.brand_name ,a.pf_code,a.pf_name,a.pf_status_id from product_family a inner join partnames b using(part_id)
INNER join wag_part_subcategory c ON b.part_id = c.part_id
INNER JOIN brands f ON a.brand_id = f.brand_id
INNER join wag_subcategory d ON c.wag_scat_id = d.wag_scat_id
INNER join wag_category e ON d.wag_cat_id = e.wag_cat_id;


SELECT * FROM ( 
	SELECT 'wag_cat_name','wag_scat_name','part_name','brand_name','pf_code','pf_name','pf_status_id' UNION 
(select e.wag_cat_name,d.wag_scat_name,b.part_name,f.brand_name ,a.pf_code,a.pf_name,a.pf_status_id from product_family a inner join partnames b using(part_id)
INNER join wag_part_subcategory c ON b.part_id = c.part_id
INNER JOIN brands f ON a.brand_id = f.brand_id
INNER join wag_subcategory d ON c.wag_scat_id = d.wag_scat_id
LEFT join wag_category e ON d.wag_cat_id = e.wag_cat_id)
) AS x4d492b540582d  
INTO OUTFILE '/tmp/categories_pfs_2.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Query to find product families and their products

CREATE TABLE LONGBOW_temp.tmp_product_family_products
select 
	pf.pf_id, pf.pf_code, pf.pf_name, p.product_id as usap_product_id, p.sku as usap_sku, ps.sty_sku as stylin_sku, ps.sty_part_id as stylin_part_id, pf.publish_channel_id 

from product_family pf inner join products p ON pf.pf_id = p.sty_pf_id INNER  JOIN products_stylin ps ON p.sty_product_id = ps.sty_product_id WHERE p.sty_product_id > 1;

mysql> select
    -> a.part_id,a.wag_scat_id,ws.wag_scat_name,ws.wag_cat_id,pn.part_name,pf.pf_code,pf.pf_name
    -> from
    -> wag_part_subcategory a INNER JOIN wag_subcategory ws USING(wag_scat_id)
    -> INNER JOIN partnames pn using(part_id)
    -> INNER JOIN product_family pf ON pn.part_id = pf.part_id
    -> where pn.part_name = 'Gloves';
+---------+-------------+-------------------------+------------+-----------+---------+-------------------------------------------------------+
| part_id | wag_scat_id | wag_scat_name           | wag_cat_id | part_name | pf_code | pf_name                                               |
+---------+-------------+-------------------------+------------+-----------+---------+-------------------------------------------------------+
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 5720    | Pro Comp Gloves                                       |
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 23653   | Mechanix Wear FastFit Gloves                          |
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 23654   | Mechanix Wear M-Pact 2 Gloves                         |
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 23655   | Mechanix Wear Original Gloves                         |
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 23656   | Mechanix Wear M-Pact Gloves                           |
|    1891 |          73 | Lift Kits & Accessories |          6 | Gloves    | 24316   | Eastwood Harsh Environment & Abrasive Blasting Gloves |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 5720    | Pro Comp Gloves                                       |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 23653   | Mechanix Wear FastFit Gloves                          |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 23654   | Mechanix Wear M-Pact 2 Gloves                         |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 23655   | Mechanix Wear Original Gloves                         |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 23656   | Mechanix Wear M-Pact Gloves                           |
|    1891 |         162 | Paint & Body Supplies   |          2 | Gloves    | 24316   | Eastwood Harsh Environment & Abrasive Blasting Gloves |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 5720    | Pro Comp Gloves                                       |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 23653   | Mechanix Wear FastFit Gloves                          |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 23654   | Mechanix Wear M-Pact 2 Gloves                         |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 23655   | Mechanix Wear Original Gloves                         |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 23656   | Mechanix Wear M-Pact Gloves                           |
|    1891 |         243 | Gloves                  |          0 | Gloves    | 24316   | Eastwood Harsh Environment & Abrasive Blasting Gloves |
+---------+-------------+-------------------------+------------+-----------+---------+-------------------------------------------------------+


-- Query to find duplicate product families for which pf_Code is appended with brand name
select * from product_family pf where pf.pf_code REGEXP '[a-z]';

-- Query to find the product families based on new "wag_part_subcategory" table.
select wps.part_id,p.part_name,wps.wag_scat_id,ws.wag_scat_name,wc.wag_cat_name, wps.pf_id,pf.pf_code,pf.pf_name from wag_part_subcategory wps INNER JOIN wag_subcategory ws ON wps.wag_scat_id = ws.wag_scat_id INNER JOIN partnames p ON wps.part_id = p.part_id INNER JOIN product_family pf ON wps.pf_id = pf.pf_id LEFT JOIN wag_category wc ON ws.wag_cat_id = wc.wag_cat_id 
WHERE ws.wag_scat_name = 'Air Compressors' ORDER BY wps.part_id,wps.wag_scat_id;


mysql> select count(distinct p.sku) from products p inner join products_stylin ps ON p.sty_product_id = ps.sty_product_id WHERE p.sty_pf_id = 0 AND p.usap_pf_id = 0 AND p.jcw_pf_id = 0 AND p.sty_product_id > 1 ;
+-----------------------+
| count(distinct p.sku) |
+-----------------------+
|                  2341 |
+-----------------------+

SELECT * FROM ( 
	SELECT 'p.sku','p.product_id','ps.sty_part_id','ps.sty_sku' UNION 
(select distinct p.sku,p.product_id,ps.sty_part_id,ps.sty_sku from products p inner join products_stylin ps ON p.sty_product_id = ps.sty_product_id WHERE p.sty_pf_id = 0 AND p.usap_pf_id = 0 AND p.jcw_pf_id =  0 AND p.sty_product_id > 1)
) AS x4d492b540582d  
INTO OUTFILE '/tmp/products_without_pfs_11_feb_1.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';


--- Query to find the product families which does not have single product

SELECT 
	ws.wag_scat_name,pn.part_name ,pf.pf_id,pf.pf_name,pf.pf_code,p.sku, count(p.sty_pf_id) as cnt
FROM
	LONGBOW_products.wag_part_subcategory wps 
	INNER JOIN LONGBOW_products.wag_subcategory ws ON ws.wag_scat_id = wps.wag_scat_id 
	INNER JOIN LONGBOW_products.product_family pf ON wps.pf_id = pf.pf_id
	INNER JOIN LONGBOW_products.partnames pn ON wps.part_id = pn.part_id
	LEFT JOIN products p ON pf.pf_id = p.sty_pf_id 
GROUP BY 
	pf.pf_code HAVING p.sku IS NULL;
	
-- Query to find the products which does not belong to any family
SELECT * FROM ( 
	SELECT 'p.sku','p.product_id', 'ps.sty_part_id','ps.sty_sku' UNION 
(SELECT 
	p.sku,p.product_id, ps.sty_part_id,ps.sty_sku
FROM
	products p INNER JOIN products_stylin ps ON ps.sty_product_id = p.sty_product_id
WHERE
	ps.sty_product_id > 1 AND
	p.sty_pf_id = 0)
) AS x4d492b540582d  
INTO OUTFILE '/tmp/products_without_pfs_13_feb_1.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- Query to get Navigation

select ifNULL(s5.wag_scat_name,'') as category,
IFNULL(s3.wag_scat_name,'') as category_subcategory_1,
s1.wag_scat_name as category_subcategory_2,
s2.wag_scat_name as subcategory_1,pf_code,pf_name from wag_subcategory_linklist ll

JOIN wag_subcategory s1 on ll.wag_parent_scat_id = s1.wag_scat_id
JOIN wag_subcategory s2 on ll.wag_child_scat_id = s2.wag_scat_id

LEFT JOIN wag_subcategory_linklist ll2 on ll.wag_parent_scat_id = ll2.wag_child_scat_id
LEFT JOIN wag_subcategory s3 on ll2.wag_parent_scat_id = s3.wag_scat_id
LEFT JOIN wag_subcategory s4 on ll2.wag_child_scat_id = s4.wag_scat_id

LEFT JOIN wag_subcategory_linklist ll3 on ll2.wag_parent_scat_id = ll3.wag_child_scat_id
LEFT JOIN wag_subcategory s5 on ll3.wag_parent_scat_id = s5.wag_scat_id
LEFT JOIN wag_subcategory s6 on ll3.wag_child_scat_id = s6.wag_scat_id


JOIN wag_part_subcategory ps on ll.wag_child_scaT_id = ps.wag_scat_id
JOIN product_family pf on ps.pf_id = pf.pf_id
where s2.wag_scat_name in ('Taillights')
order by category,category_subcategory_1,category_subcategory_2,subcategory_1

-- Only navigation from link list
select ifNULL(s5.wag_scat_name,'') as category,
IFNULL(s3.wag_scat_name,'') as category_subcategory_1,
s1.wag_scat_name as category_subcategory_2,
s2.wag_scat_name as subcategory_1 from wag_subcategory_linklist ll

JOIN wag_subcategory s1 on ll.wag_parent_scat_id = s1.wag_scat_id
JOIN wag_subcategory s2 on ll.wag_child_scat_id = s2.wag_scat_id

LEFT JOIN wag_subcategory_linklist ll2 on ll.wag_parent_scat_id = ll2.wag_child_scat_id
LEFT JOIN wag_subcategory s3 on ll2.wag_parent_scat_id = s3.wag_scat_id
LEFT JOIN wag_subcategory s4 on ll2.wag_child_scat_id = s4.wag_scat_id

LEFT JOIN wag_subcategory_linklist ll3 on ll2.wag_parent_scat_id = ll3.wag_child_scat_id
LEFT JOIN wag_subcategory s5 on ll3.wag_parent_scat_id = s5.wag_scat_id
LEFT JOIN wag_subcategory s6 on ll3.wag_child_scat_id = s6.wag_scat_id

order by category,category_subcategory_1,category_subcategory_2,subcategory_1


mysql> select count(1) from product_attribute_type_cpam;
+----------+
| count(1) |
+----------+
|     1072 |
+----------+
1 row in set (0.01 sec)

-- Query to get product family's attributes

SELECT 
	pf.pf_id,pf.pf_code,pf.pf_name,patc.pa_type_name,pavc.pa_value_name,patc.isnavigational ,pfft.pf_filter_type
FROM
	product_family pf 
	INNER JOIN product_family_attributes pfa ON pf.pf_id = pfa.pf_id	
	INNER JOIN product_family_filters pff ON pf.pf_id = pff.pf_id AND pfa.pa_type_id = pff.pa_type_id
	INNER JOIN product_family_filter_type pfft ON pff.pf_filter_type_id = pfft.pf_filter_type_id
	INNER JOIN product_attribute_type_cpam patc ON pff.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pfa.pa_value_id = pavc.pa_value_id
WHERE 
	pf.pf_name = "McGaughy's Lowering Kits";
	
-- Query to get product family's attribute names and is navigational flag	
SELECT 
	pf.pf_id,pf.pf_code,pf.pf_name,patc.pa_type_name,patc.isnavigational ,pfft.pf_filter_type
FROM
	product_family pf 
	INNER JOIN product_family_attributes pfa ON pf.pf_id = pfa.pf_id	
	INNER JOIN product_family_filters pff ON pf.pf_id = pff.pf_id AND pfa.pa_type_id = pff.pa_type_id
	INNER JOIN product_family_filter_type pfft ON pff.pf_filter_type_id = pfft.pf_filter_type_id
	INNER JOIN product_attribute_type_cpam patc ON pff.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pfa.pa_value_id = pavc.pa_value_id
WHERE 
	pf.pf_name IN ("McGaughy's Lowering Kits",'K&N Air Intake System - FIPK','LED Tail Lights by RECON','Lowering Control Arms by DJM');


-- Query to find product family's product and their attribute and values

mysql> SELECT pf.pf_id,pf.pf_name,p.product_id,p.sku,ps.sty_sku,patc.pa_type_name,patc.isnavigational,pavc.pa_value_name FROM product_family pf  INNER JOIN products p ON pf.pf_id = p.sty_pf_id INNER JOIN products_stylin ps ON p.sty_product_id = ps.sty_product_id INNER JOIN product_attributes_cpam pac ON p.product_id = pac.product_id INNER JOIN product_attribute_type_cpam patc ON pac.pa_type_id = patc.pa_type_id INNER JOIN product_attribute_value_cpam pavc ON pac.pa_value_id = pavc.pa_value_id WHERE pf.pf_name IN("McGaughy's Lowering Kits") AND p.sty_product_id > 1;
+-------+--------------------------+------------+-------------+----------+-----------------------+----------------+---------------+
| pf_id | pf_name                  | product_id | sku         | sty_sku  | pa_type_name          | isnavigational | pa_value_name |
+-------+--------------------------+------------+-------------+----------+-----------------------+----------------+---------------+
|   475 | McGaughy's Lowering Kits |    2950143 | MCG11018    | 11018MGY | Front Lowering Amount |              0 | 2 in.         |
|   475 | McGaughy's Lowering Kits |    2950143 | MCG11018    | 11018MGY | Rear Lowering Amount  |              0 | 3 in.         |
|   475 | McGaughy's Lowering Kits |    2950143 | MCG11018    | 11018MGY | Shocks Included       |              0 | No            |
|   475 | McGaughy's Lowering Kits |    2950145 | MCG93031    | 93031MGY | Front Lowering Amount |              0 | 5 in.         |
|   475 | McGaughy's Lowering Kits |    2950145 | MCG93031    | 93031MGY | Rear Lowering Amount  |              0 | 7 in.         |

-- Query to get a product families which does not have products

SELECT 
	ws.wag_scat_name,pn.part_name ,pf.pf_id,pf.pf_name,pf.pf_code,p.sku, count(p.sty_pf_id) as cnt
FROM
	LONGBOW_products.wag_part_subcategory wps 
	INNER JOIN LONGBOW_products.wag_subcategory ws ON ws.wag_scat_id = wps.wag_scat_id 
	INNER JOIN LONGBOW_products.product_family pf ON wps.pf_id = pf.pf_id
	INNER JOIN LONGBOW_products.partnames pn ON wps.part_id = pn.part_id
	LEFT JOIN products p ON pf.pf_id = p.sty_pf_id 
WHERE
	pf.pf_code IN ('1','102','1031','104')
GROUP BY 
	pf.pf_code HAVING p.sku IS NULL;
	
mysql> select count(1) from wag_part_subcategory;
+----------+
| count(1) |
+----------+
|     7479 | 8589
+----------+
1 row in set (0.08 sec)

mysql> select count(1) from wag_subcategory_linklist;
+----------+
| count(1) |
+----------+
|      466 | 470
+----------+
1 row in set (0.01 sec)

mysql> select count(pf_name) from product_family where channel_id = 3;
+----------------+
| count(pf_name) |
+----------------+
|           6879 |
+----------------+
1 row in set (0.00 sec)

mysql> select count(1) from wag_subcategory;
+----------+
| count(1) |
+----------+
|      480 |
+----------+
1 row in set (0.00 sec)

mysql> select publish_channel_id,publish_channel_name from publish_channel order by publish_channel_id;
+--------------------+---------------------------------------------+
| publish_channel_id | publish_channel_name                        |
+--------------------+---------------------------------------------+
|                  1 | USAP                                        |
|                  2 | Stylin                                      |
|                  3 | USAP & Stylin                               |
|                  4 | JCW                                         |
|                  5 | USAP & JCW                                  |
|                  6 | Stylin & JCW                                |
|                  7 | USAP & Stylin & JCW                         |
|                  8 | Sears                                       |
|                  9 | USAP & Sears                                |
|                 10 | Stylin & Sears                              |
|                 11 | USAP & Stylin & Sears                       |
|                 12 | JCW & Sears                                 |
|                 13 | USAP & JCW & Sears                          |
|                 14 | Stylin & JCW & Sears                        |
|                 15 | USAP & Stylin & JCW & Sears                 |
|                 16 | eBay                                        |
|                 17 | USAP & eBay                                 |
|                 18 | Stylin & eBay                               |
|                 19 | USAP & Stylin & eBay                        |
|                 20 | JCW & eBay                                  |
|                 21 | USAP & JCW & eBay                           |
|                 22 | Stylin & JCW & eBay                         |
|                 23 | USAP & Stylin & JCW & eBay                  |
|                 24 | Sears & eBay                                |
|                 25 | USAP & Sears & eBay                         |
|                 26 | Stylin & Sears & eBay                       |
|                 27 | USAP & Stylin & Sears & eBay                |
|                 28 | JCW & Sears & eBay                          |
|                 29 | USAP & JCW & Sears & eBay                   |
|                 30 | Stylin & JCW & Sears & eBay                 |
|                 31 | USAP & Stylin & JCW & Sears & eBay          |
|                 32 | Amazon                                      |
|                 33 | USAP & Amazon                               |
|                 34 | Stylin & Amazon                             |
|                 35 | USAP & Stylin & Amazon                      |
|                 36 | JCW & Amazon                                |
|                 37 | USAP & JCW & Amazon                         |
|                 38 | Stylin & JCW & Amazon                       |
|                 39 | USAP & Stylin & JCW & Amazon                |
|                 40 | Sears & Amazon                              |
|                 41 | USAP & Sears & Amazon                       |
|                 42 | Stylin & Sears & Amazon                     |
|                 43 | USAP & Stylin & Sears & Amazon              |
|                 44 | JCW & Sears & Amazon                        |
|                 45 | USAP & JCW & Sears & Amazon                 |
|                 46 | Stylin & JCW & Sears & Amazon               |
|                 47 | USAP & Stylin & JCW & Sears & Amazon        |
|                 48 | eBay & Amazon                               |
|                 49 | USAP & eBay & Amazon                        |
|                 50 | Stylin & eBay & Amazon                      |
|                 51 | USAP & Stylin & eBay & Amazon               |
|                 52 | JCW & eBay & Amazon                         |
|                 53 | USAP & JCW & eBay & Amazon                  |
|                 54 | Stylin & JCW & eBay & Amazon                |
|                 55 | USAP & Stylin & JCW & eBay & Amazon         |
|                 56 | Sears & eBay & Amazon                       |
|                 57 | USAP & Sears & eBay & Amazon                |
|                 58 | Stylin & Sears & eBay & Amazon              |
|                 59 | USAP & Stylin & Sears & eBay & Amazon       |
|                 60 | JCW & Sears & eBay & Amazon                 |
|                 61 | USAP & JCW & Sears & eBay & Amazon          |
|                 62 | Stylin & JCW & Sears & eBay & Amazon        |
|                 63 | USAP & Stylin & JCW & Sears & eBay & Amazon |
|         4294967295 | All                                         |
+--------------------+---------------------------------------------+

mysql> SELECT TABLE_NAME,CREATE_TIME FROM information_schema.tables WHERE  TABLE_SCHEMA = 'LONGBOW_temp' AND CREATE_TIME < '2011-12-19' AND TABLE_NAME LIKE 'temp%';
mysql> SELECT count(TABLE_NAME) FROM information_schema.tables WHERE  TABLE_SCHEMA = 'LONGBOW_temp' AND CREATE_TIME < '2011-12-05';
mysql> SELECT count(TABLE_NAME) FROM information_schema.tables WHERE  TABLE_SCHEMA = 'LONGBOW_temp' AND TABLE_NAME LIKE 'tmp_comp_pricing%';
mysql> SELECT TABLE_NAME,CREATE_TIME FROM information_schema.tables WHERE  TABLE_SCHEMA = 'LONGBOW_temp' AND TABLE_NAME = 'tmp_mediaprice_370910669e3eae11413cacd1319c2575'\G;


*************************** 1. row ***************************
  TABLE_CATALOG: NULL
   TABLE_SCHEMA: LONGBOW_data
     TABLE_NAME: products
     TABLE_TYPE: BASE TABLE
         ENGINE: MyISAM
        VERSION: 10
     ROW_FORMAT: Dynamic
     TABLE_ROWS: 3116574
 AVG_ROW_LENGTH: 453
    DATA_LENGTH: 1412059916
MAX_DATA_LENGTH: 281474976710655
   INDEX_LENGTH: 649737216
      DATA_FREE: 0
 AUTO_INCREMENT: 3619892
    CREATE_TIME: 2011-04-02 04:15:15
    UPDATE_TIME: 2011-04-06 14:37:39
     CHECK_TIME: 2011-04-02 04:21:18
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
1 row in set (0.01 sec)

************************************ Query to get user name and their role ***********************
SELECT 
	a.first_name,
	a.last_name,
	a.user_id,
	a.username,
	b.role_id,
	b.role_name,
	lafg.function_group_name
FROM 
	local_auth_users a 
	INNER JOIN local_auth_role_information b ON a.role_id = b.role_id 
	LEFT JOIN local_auth_function_group lafg ON b.function_group_id = lafg.function_group_id
	LEFT JOIN user_team_map utm ON a.user_id = utm.user_id 
WHERE 
	a.username like '%rmatignas%'; -- QA Admin = 34

SELECT a.user_id,a.username,a.first_name,a.last_name,b.role_id,b.role_name FROM local_auth_users a INNER JOIN local_auth_role_information b ON a.role_id = b.role_id  WHERE role_name IN ('Product Management');
SELECT a.user_id,a.username,a.first_name,a.last_name,b.role_id,b.role_name FROM local_auth_users a INNER JOIN local_auth_role_information b ON a.role_id = b.role_id  WHERE role_name IN ('Private Label Analyst - Price Ma');

SELECT a.user_id,a.username,b.role_id,b.role_name FROM local_auth_users a INNER JOIN local_auth_role_information b ON a.role_id = b.role_id WHERE b.role_name = 'Senior Category Manager';

CREATE TABLE LONGBOW_temp.local_auth_users_20110926 SELECT * FROM LONGBOW_data.local_auth_users;
CREATE TABLE LONGBOW_temp.user_team_map_20110926 SELECT * FROM LONGBOW_data.user_team_map;
CREATE TABLE LONGBOW_temp.qb_report_20110926 SELECT * FROM LONGBOW_data.qb_report;

UPDATE local_auth_users SET role_id = 34 WHERE user_id = 641 LIMIT 1;
UPDATE user_team_map SET team_id = 1 WHERE user_id = 641 LIMIT 1;
+---------+-------------+---------+-----------+
| user_id | username    | role_id | role_name |
+---------+-------------+---------+-----------+
|     839 | user_cybage |      33 | Sys Admin |
+---------+-------------+---------+-----------+


----------- Query to fid product family and their valid products for stylin -----------
SELECT pf.pf_code, pf.pf_name, p.sku, ps.sty_sku, pp.regular_price, pp.media_cd_id, wps.wag_scat_id, ws.wag_scat_name, wc.wag_cat_name, p.sty_pf_id FROM products p INNER JOIN products_stylin ps ON p.sty_product_id = ps.sty_product_id INNER JOIN product_pricing pp ON p.product_id = pp.product_id INNER JOIN product_family_products pfp ON p.product_id = pfp.product_id INNER JOIN product_family pf ON pfp.pf_id = pf.pf_id INNER JOIN wag_part_subcategory wps ON pf.pf_id = wps.pf_id INNER JOIN wag_subcategory ws ON wps.wag_scat_id = ws.wag_scat_id INNER JOIN wag_category wc ON ws.wag_cat_id = wc.wag_cat_id WHERE pf.pf_code = 'ANZTA7592' AND ps.sty_sku != '' AND p.isactive_stylin = 1 limit 10;

======== Very useful commands to load data and scp =============

mysqldump -ulongbow -pXD56JK45 LONGBOW_data product_family > /tmp/product_family_products_21may.sql;
mysqldump -h 10.234.65.118 -ulongbow -pXD56JK45 LONGBOW_temp tmp_enter_stylin_data_20_may_1 > /tmp/tmp_enter_stylin_data_21may.sql;

cd /tmp
tar cvzf product_family_products_21may.tar.gz product_family_products_21may.sql;
tar cvzf tmp_enter_stylin_data_21may.tar.gz tmp_enter_stylin_data_21may.sql;

scp mpatel@69.20.62.92:/tmp/product_family_products_21may.tar.gz /tmp
scp mpatel@69.20.62.92:/tmp/tmp_enter_stylin_data_21may.tar.gz /tmp

scp dpatel@173.203.162.24:/tmp/buyers.php /data/longbow/catalog/crond/
scp /tmp/buyers.php dpatel@192.168.100.25:/data/longbow/catalog/crond/
scp /tmp/phpseclib/* dpatel@192.168.100.25:/data/longbow/catalog/vi/includes/misc/phpseclib/*

scp /tmp/waw_20120614_181003.tar.gz dpatel@173.203.162.24:/tmp
scp /tmp/usautovirginia_20120614_181005.tar.gz dpatel@192.168.100.25:/tmp
scp /tmp/usautoparts_20120614_181001.tar.gz dpatel@192.168.100.25:/tmp

scp csvcreator@69.20.24.105:/tmp/waw_20120614_181003.tar.gz /tmp/

DX!@KJ@#

-- Login to 101 server in diff connection ---
scp achandankar@10.10.75.143:/tmp/product_family_products_21may.tar.gz /tmp
scp achandankar@10.10.75.143:/tmp/tmp_enter_stylin_data_21may.tar.gz /tmp

# Untar files
tar xvzf product_family_products.tar.gz
tar xvzf products.tar.gz

mysql -ulongbow -pXD56JK45 LONGBOW_data < /tmp/product_family_products_20111214.sql
mysql -ulongbow -pXD56JK45 LONGBOW_temp < /tmp/product_family_20120328.sql

---------
mysql> select count(1) from product_assets;
+----------+
| count(1) |
+----------+
|  3816849 |
+----------+
1 row in set (3.02 sec)

mysql> select count(1) from assets;
+----------+
| count(1) |
+----------+
|  2655677 |
+----------+
1 row in set (0.71 sec)

mysql> SELECT count(pab.product_id)
    -> FROM LONGBOW_temp.product_assets_20_may pab
    -> LEFT JOIN LONGBOW_data.product_assets pa USING (product_id,asset_id)
    -> JOIN LONGBOW_data.assets a ON (a.asset_id=pab.asset_id)
    -> WHERE ISNULL(pa.asset_id);
+-----------------------+
| count(pab.product_id) |
+-----------------------+
|                  8098 |
+-----------------------+

SELECT
	p.product_id,
	p.sku,
	p.jcw_product_id,
	pa.asset_id,
	pa.sequence,
	a.asset_name,
	a.asset_type_id
FROM
	products  p
	inner join product_assets pa ON p.product_id = pa.product_id
	inner join assets a ON pa.asset_id = a.asset_id
WHERE
	a.asset_type_id = 1 AND
	pa.sequence = 1 AND
	(a.asset_name like '%\_CL\_%' OR
	a.asset_name like '%\_SW\_%') limit 10;

---------------------------------
RSRUBBE03 : ssh mpatel@207.97.233.112
RSRUBFE01 : ssh mpatel@69.20.62.92
RSRUBBE02 : ssh mpatel@69.20.62.91
RSRUBBE01 : ssh mpatel@69.20.62.93
RSRUBBE04 : ssh csvcreator@69.20.24.105 (pass : ccusap1q2w)
RSCATFE01 : ssh dpatel@173.203.162.24
RSCATBE01 : ssh dpatel@192.168.100.25


mysql -ulongbow -pXD56JK45 -h10.234.65.118 -A;
mysql -ulongbow -pXD56JK45 -h10.234.65.89 LONGBOW_data -A;
----------------------------------

select 
	p.product_id, sku, p.publish_channel_id, b.brand_name, pf.pf_code, pf.pf_name, pf.publish_channel_id, patc.pa_type_name,pc.publish_channel_name,pfp.channel_id,pp.regular_price,pp.media_cd_id 
from 
	products p 
	inner join product_family_products pfp using(product_id) 
	inner join product_family pf using(pf_id) 
	inner join brands b on(p.brand_id = b.brand_id) 
	inner join product_attributes_cpam pac using(product_id) 
	inner join product_attribute_type_cpam patc using(pa_type_id)
	inner join publish_channel pc ON pf.publish_channel_id = pc.publish_channel_id
	left join product_pricing pp ON p.product_id = pp.product_id
where 
	b.brand_name = 'lloyd mats' and 
	p.publish_channel_id%8>3 and
	patc.pa_type_name = 'Series' and
	pf.publish_channel_id%8>3 and
	p.isactive = 1 limit 100;
	
-- Find products with series attribute

SELECT 
	p.product_id,
	p.sku,
	pfp.pf_id,
	pfp.channel_id,
	pf.pf_code,
	pp.regular_price,
	mc.media_cd,
	pc1.publish_channel_name as product_dc,
	pc2.publish_channel_name as group_dc,
	ss.sku_status,
	patc.pa_type_name,
	pavc.pa_value_name
FROM
	products p
	INNER JOIN product_family_products pfp ON p.product_id = pfp.product_id
	INNER JOIN product_family pf ON pfp.pf_id = pf.pf_id
	INNER JOIN publish_channel pc1 ON p.publish_channel_id = pc1.publish_channel_id
	INNER JOIN publish_channel pc2 ON pf.publish_channel_id = pc2.publish_channel_id
	INNER JOIN product_pricing pp ON p.product_id = pp.product_id
	INNER JOIN media_code mc ON pp.media_cd_id = mc.media_cd_id
	INNER JOIN sku_status ss ON p.sku_status_id = ss.sku_status_id
	INNER JOIN product_attributes_cpam pac ON p.product_id = pac.product_id
	INNER JOIN product_attribute_type_cpam patc ON pac.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pac.pa_value_id = pavc.pa_value_id
WHERE
	p.sku IN ('LLOHP001','LLOLU001','LLOLU002','LLOLU003','LLOLU004','LLOLU005','LLOLU006','LLOLU007','LLOLU008','LLOLU009','LLOLU010','LLOLU011','LLOLU012','LLOLU013') AND
	p.isactive = 1 AND
	patc.pa_type_name = 'Series';
	
--------------- Query to find dropship JCW products ------------- START -----------------

select pj.jcw_sku,br.brand_name,p.stockship_id from products p inner join products_jcw pj ON (p.jcw_product_id = pj.jcw_product_id) inner join brands br ON p.brand_id = br.brand_id where isdropship = 0 AND isactive_jcw = 1 AND stockship_id = 0  limit 50;
--------------- Query to find dropship JCW products ------------- END -----------------


--------------- Query to fix product kill list data ------------- START -----------------

desc temp_kill_list_update_20110726;

alter table temp_kill_list_update_20110726 add product_id int(10) unsigned, add brand_id int(10) unsigned, add index (product_id), add index (brand_id);

select count(distinct product_id) from temp_kill_list_update_20110726;

UPDATE temp_kill_list_update_20110726 tmp inner join brands br ON tmp.brand_name = br.brand_name SET tmp.brand_id = br.brand_id;

UPDATE temp_kill_list_update_20110726 tmp inner join products pr ON tmp.sku = pr.sku AND tmp.brand_id = pr.brand_id SET tmp.product_id = pr.product_id;

UPDATE `product_kill_list` pkl INNER JOIN temp_kill_list_update_20110726 tmp ON pkl.product_id = tmp.product_id SET pkl.start_date = tmp.start_date, pkl.end_date = tmp.end_date, pkl.active = tmp.active, pkl.description = tmp.description;

select pkl.* from temp_kill_list_update_20110726 tmp INNER JOIN `product_kill_list` pkl ON pkl.product_id = tmp.product_id WHERE pkl.product_id IS NULL;

desc product_kill_list;

SELECT
	pkl.*,
	p.sku,
	br.brand_name
FROM
	products p
	INNER JOIN brands br ON p.brand_id = br.brand_id
	INNER JOIN product_kill_list pkl ON p.product_id = pkl.product_id	
WHERE
	p.sku IN ('K33632576');

--------------- Query to find dropship JCW products ------------- END -----------------

--------------- Query to find  ------------- START -----------------

LOAD DATA INFILE "/data/longbow/catalog/exports/wag_usap/20110727/120708/1194/e4e309dd92a6011311808985.csv"
                    INTO TABLE tmp_e4e309dd92a601
                    FIELDS TERMINATED BY ','
                    ENCLOSED BY  '"'
                    LINES TERMINATED BY '\n'
                    (@column1,@column2,@column3,@column4)  SET sku=@column1,sku_merchant=@column2,brand_name=@column3;
					
					
LOAD DATA INFILE 'sku_and_pfs_jcw.txt'
                    INTO TABLE endeca_sku_group_20110907
                    FIELDS TERMINATED BY '\t'
                    OPTIONALLY ENCLOSED BY  '"'
                    LINES TERMINATED BY '\n'
                    (@column1,@column2)  SET PRODUCT_ID=@column1,PRODUCT_SKU=@column2;
					
create table name select * from tablename;
					
--------------- Query to find  ------------- END -----------------


3.13 - https://svn.usautoparts.com/repos/LONGBOW/branches/POS-UC_Integration-3.13-Cybage
Snapshot_wag - https://svn.usautoparts.com/repos/LONGBOW_backend/snapshot/branches/wag_snapshot
Snapshot - https://svn.usautoparts.com/repos/LONGBOW_backend/snapshot/tags/3.5-patch-q1
Crossbow - https://svn.usautoparts.com/repos/LONGBOW_backend/uc_services/branches/wag_services_1.2.x
Bowstring - https://svn.usautoparts.com/repos/LONGBOW_backend/bowstring/export/branches/3.13.x
Data migration scripts - https://svn.usautoparts.com/repos/LONGBOW_backend/wag_data_migration
Backend scripts - https://svn.usautoparts.com/repos/LONGBOW/backend_scripts/sku_counter/tags/SKUCOUNT-3.8-PROD

-------- ACL import permission --------------
SELECT
	write_access,
	import_access,
	permitted_fields,
	function_fields,
	function_import_table_map
FROM
	local_auth_roles lar
	INNER JOIN local_auth_users AS usr ON (lar.role_id=usr.role_id)
	INNER JOIN local_auth_functions AS laf ON (lar.function_id=laf.function_id)
WHERE
	usr.user_id      = '24' AND
	laf.function_map = 'products';
	
-------- Query to pull Group assets --------------
SELECT
	distinct
	pf.pf_code,
	pf.pf_name,
	a.asset_name,
	at.asset_desc,
	pf.pf_status_id
FROM
	product_family pf
	INNER JOIN product_family_assets pfa ON pf.pf_id = pfa.pf_id
	INNER JOIN assets a ON pfa.asset_id = a.asset_id
	INNER JOIN asset_type at ON a.asset_type_id = at.asset_type_id
WHERE
	at.asset_type_id IN (2,3);
	
select at.asset_desc,count(a.asset_id),p.product_id from products p inner join product_assets pa ON p.product_id = pa.product_id inner join assets a ON pa.asset_id = a.asset_id inner join asset_type at on a.asset_type_id = at.asset_type_id WHERE p.product_id IN (232908) GROUP BY a.asset_type_id;
	
------------- Query to find APW categorization -----------------

SELECT
	tc.tlc_id,
	tc.tlc_name,
	c.cat_id,
	c.cat_name,
	s.scat_id,
	s.scat_name,
	p.part_name
FROM
	toplevel_category tc 
	INNER JOIN category_toplevel ct ON tc.tlc_id = ct.tlc_id
	INNER JOIN category c ON ct.cat_id = c.cat_id
	INNER JOIN partnames p ON tc.tlc_id = p.tlc_id AND ct.cat_id = p.cat_id
	INNER JOIN subcategory s ON p.scat_id = s.scat_id
WHERE
	tc.tlc_name like '%Headlights & lighting%';
	
-------------------- Query to update part/brand of group --------------- START -----

CREATE TABLE LONGBOW_temp.product_family_20111121 SELECT * FROM LONGBOW_data.product_family;

SELECT
	pf.pf_id,
	pf.pf_code,
	pn.part_name,
	pf.part_id,
	b.brand_name,
	pf.brand_id
FROM
	product_family pf
	INNER JOIN partnames pn USING (part_id)
	INNER JOIN brands b USING(brand_id)
WHERE
	pf.pf_code IN ('REPAL6975');
	
SELECT part_id,part_name FROM partnames pn WHERE pn.part_name IN ('Alternator');
SELECT brand_id,brand_name FROM brands b WHERE b.brand_name = 'Mossi';

SELECT pf_code,pf_name,part_id FROM product_family pf WHERE pf.pf_code = '24773G';
CREATE TABLE LONGBOW_temp.product_family_20111011 SELECT * FROM LONGBOW_data.product_family;

UPDATE product_family pf SET pf.part_id = '251' WHERE pf.pf_code IN ('REPAL6975') LIMIT 1;

SELECT * FROM wag_part_subcategory WHERE pf_id IN (3042);
CREATE TABLE LONGBOW_temp.wag_part_subcategory_20110913 SELECT * FROM LONGBOW_data.wag_part_subcategory;

UPDATE wag_part_subcategory wps SET wps.part_id = '1658' WHERE wps.pf_id IN (3042) AND wps.part_id = 1656 LIMIT 1;


UPDATE product_family pf SET pf.brand_id = '815' WHERE pf.pf_code = '29016G' LIMIT 1;

-- Add delivery channel

SELECT pf_code,pf_name,publish_channel_name FROM product_family pf INNER JOIN publish_channel pc USING(publish_channel_id) WHERE pf_code IN ('ACD7638','DAVCA38262');

SELECT pf_code,pf_name,publish_channel_name FROM product_family pf INNER JOIN publish_channel pc USING(publish_channel_id) WHERE pf_code IN ('38807G','39793G','38808G');

// Add JCW = DC + 4, usap = DC + 1, STY = DC + 2
CREATE TABLE LONGBOW_temp.product_family_20110921 SELECT * FROM LONGBOW_data.product_family;

UPDATE product_family pf SET pf.publish_channel_id = pf.publish_channel_id + 2 WHERE pf_code IN ('38807G','39793G','38808G') LIMIT 3;

INSERT INTO wag_part_subcategory (part_id,wag_scat_id,created_datetime,create_user_id,pf_id,channel_id)
select part_id,wag_scat_id,now(),839,pf_id,'3' from wag_part_subcategory wps WHERE wps.pf_id IN (3195,3196,3197,3198,3199,3200,3201,3202,3203,4924,3261,3262,3263,4372,6272,7637) order by pf_id;

-------------------- Query to update part/brand of group --------------- END ------

-------------------- Query to find attributes of group --------------- START ------
SELECT
	pf.pf_code,
	pf.pf_name,
	patc.pa_type_name,
	pavc.pa_value_name,
	pn.part_name,
	b.brand_name
FROM
	product_family pf
	INNER JOIN partnames pn ON pf.part_id = pn.part_id
	INNER JOIN brands b ON pf.brand_id = b.brand_id
	INNER JOIN product_family_attributes pfa ON pf.pf_id = pfa.pf_id
	INNER JOIN product_attribute_type_cpam patc ON pfa.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pfa.pa_value_id = pavc.pa_value_id
WHERE
	pf.pf_code = 'PEAJU39507';
	
SELECT
	pf.pf_code,
	pf.pf_name,
	patc.pa_type_name,
	pavc.pa_value_name,
	pn.part_name,
	b.brand_name
FROM
	product_family_tmp pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products pfa ON pfp.product_id = pfa.product_id
	
	
	INNER JOIN product_attribute_type_cpam patc ON pfa.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pfa.pa_value_id = pavc.pa_value_id
WHERE
	pn.part_name = 'Sun Visor' AND
	b.brand_name = 'Rugged Ridge' AND
	patc.pa_type_id = '1303';
-------------------- Query to find attributes of group --------------- END ------

select work_order,user_id,filename,ptime,record_count,insert_count,error_count from motorcycle_local_import_list where work_order = 'wag_product_family_association' order by ptime desc limit 5;


DELETE FROM LONGBOW_data.products_jcw WHERE jcw_product_id = 221597;

---- Query to find applicatino of specific product -- START -----------
SELECT
		count(p.product_id) as cnt
	FROM 
		LONGBOW_data.products p
		INNER JOIN LONGBOW_data.vehicle_product vp ON (p.product_id = vp.product_id)
		INNER JOIN LONGBOW_data.applications USING (mp_id)
		INNER JOIN LONGBOW_data.applications_year USING (application_id)
	WHERE
		p.product_id = 90;
		
SELECT
	p.product_id,
	ap.year_id,
	y.year,
	m.model_name,
	mk.make_name
FROM 
	LONGBOW_data.products p
	INNER JOIN LONGBOW_data.vehicle_product vp ON (p.product_id = vp.product_id)
	INNER JOIN models m ON vp.model_id = m.model_id
	INNER JOIN makes mk ON m.make_id = mk.make_id
	INNER JOIN LONGBOW_data.applications USING (mp_id)
	INNER JOIN LONGBOW_data.applications_year ap USING (application_id)
	INNER JOIN LONGBOW_data.years y ON ap.year_id = y.year_id
WHERE
	p.product_id = 90;
---- Query to find applicatino of specific product -- END -----------

SELECT sku,product_id,p.part_id,pn.part_name from products p inner join partnames pn using(part_id) where p.product_id IN (4009059,4006343,4006344,4006354,3249860,3249874,3249876,3249853,3249854,3249851,3249850,3249875,3249852,3249873,3249855,3249844,3249845,3249848,3249849,3249861);

------- Query to find duplicate asset sequence --------- START ----------

SELECT product_id, COUNT(product_id) AS noofseq
FROM assets
INNER JOIN product_assets USING(asset_id)
INNER JOIN asset_type USING(asset_type_id)
WHERE asset_type_id = 1
GROUP BY product_id,product_assets.sequence
HAVING noofseq > 1;

------- Query to find duplicate asset sequence --------- END ----------

------- Query to regenerate JCW ranking --------- START ----------

use `LONGBOW_data`;

select * from product_family;
select * from jcw_productfamily_ranking order by qty_sold desc;
select a.*,b.pf_name from jcw_productfamily_ranking a inner join product_family b using(pf_code) order by qty_sold desc LIMIT 10;

SELECT
	a.*,
	b.pf_name
FROM
	jcw_productfamily_ranking_20110830 a 
	INNER JOIN product_family b USING(pf_code)
WHERE
	a.pf_code IN ('27263G','35325G','27229G','25150G','27226G','25173G','25180G','35330G','35209G','35234G')
ORDER BY 
	rank,qty_sold desc;
	rank,qty_sold desc;

-- Load temp table (jcw_productfamily_ranking)
-- Alter that table and add pf_name in it
ALTER TABLE jcw_productfamily_ranking ADD pf_name varchar(250), ADD INDEX (pf_name);
UPDATE jcw_productfamily_ranking a INNER JOIN product_family pf ON a.pf_code = pf.pf_code SET a.pf_name = pf.pf_name;
SELECT count(1) from jcw_productfamily_ranking a WHERE a.pf_name = '' OR a.pf_name IS NULL;
DELETE FROM jcw_productfamily_ranking WHERE pf_name = '' OR pf_name IS NULL;

-- Truncate jcw_productfamily_newranking
TRUNCATE TABLE `jcw_productfamily_newranking`;

create table jcw_productfamily_newranking_2 like jcw_productfamily_newranking;

-- Run PHP script

------- Query to regenerate JCW ranking --------- END ----------

select  export_id,hasher,work_order,user_id,status,record_count,ptime from local_export_list where user_id = 80 order by export_id desc limit 30;
select  export_id,work_order,username,status,record_count,ptime from local_export_list a inner join local_auth_users using(user_id) order by export_id desc limit 50;


------------ Query to find out active JCW group and products under it -----------------

CREATE TABLE LONGBOW_temp.inactive_jcw_groups_skus_20110831
SELECT
	pf.pf_id,
	pf.pf_code,
	pf.pf_name,
	p.product_id,
	p.sku_status_id,
	ss.sku_status
FROM
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
	INNER JOIN products_jcw pj ON p.jcw_product_id = pj.jcw_product_id
	INNER JOIN sku_status ss USING(sku_status_id)
WHERE
	pfp.channel_id = 3 AND
	pf.publish_channel_id%8>3 AND
	pf.pf_status_id = 1 AND
	pf.pf_code = '40926G'	
ORDER BY
	pf.pf_code;

-------------	
CREATE TABLE LONGBOW_temp.active_jcw_groups_sku_count_20110831
SELECT
	pf.pf_id,
	pf.pf_code,
	pf.pf_name,
	count(distinct p.product_id) as skucnt
FROM
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
	INNER JOIN products_jcw pj ON p.jcw_product_id = pj.jcw_product_id
WHERE
	pfp.channel_id = 3 AND
	pf.publish_channel_id%8>3 AND
	pf.pf_status_id = 1 AND
	p.isactive_jcw = 1
Group BY
	pf.pf_code
ORDER BY
	pf.pf_code;

------------
CREATE TABLE LONGBOW_temp.all_jcw_groups_sku_count_20110831
SELECT
	pf.pf_id,
	pf.pf_code,
	pf.pf_name,
	count(distinct p.product_id) as skucnt
FROM
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
	INNER JOIN products_jcw pj ON p.jcw_product_id = pj.jcw_product_id
WHERE
	pfp.channel_id = 3 AND
	pf.publish_channel_id%8>3 AND
	pf.pf_status_id = 1 
Group BY
	pf.pf_code
ORDER BY
	pf.pf_code;

-----------
select count(distinct pf_code) from product_family pf where pf.publish_channel_id%8>3 AND pf.pf_status_id = 1;
	
select * from active_jcw_groups_skus_20110830;

select a.pf_code,a.pf_name,count(a.product_id) as total_products from active_jcw_groups_skus_20110830 a group by a.pf_code Order by total_products desc;

------------ Query to find out active JCW group and products under it -----------------

mysql> select count(1) from product_family;
mysql> select count(1) from product_family_products;
mysql> select count(1) from products;
mysql> select count(1) from wag_part_subcategory;
mysql> select count(1) from products_jcw;
mysql> select count(1) from products_stylin;

------------------ find mismatch between categorization part id and group part id ------------ START -----------------
SELECT 
	pf.pf_code,
	pf.pf_name,
	pf.part_id,
	GROUP_CONCAT(distinct p.part_id),
	wps.part_id as wps_part_id,
	wps.wag_scat_id,
	wps.channel_id,
	wps.pf_id,
	CONCAT('UPDATE wag_part_subcategory SET part_id = ',pf.part_id,' WHERE part_id = ',wps.part_id,' AND pf_id = ',wps.pf_id,' AND wag_scat_id = ',wps.wag_scat_id,' AND channel_id = ',wps.channel_id,' LIMIT 1;') as query	
FROM
	product_family pf
	INNER JOIN wag_part_subcategory wps ON pf.pf_id = wps.pf_id
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
WHERE
	pf.part_id != wps.part_id 
GROUP BY
	pf.pf_id	
LIMIT 70;

SELECT 
	pf.pf_code,
	pf.pf_name,
	pf.part_id,
	GROUP_CONCAT(distinct p.part_id) as pro_part,
	pf.part_id,
	GROUP_CONCAT(distinct p.brand_id) as pro_brand,
	pf.brand_id
FROM
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
WHERE
	pf.pf_code IN ('BOREX38371','FLO38351','38340','SKYCA38409')
GROUP BY
	pf.pf_id;
------------------ find mismatch between categorization part id and group part id ------------ END -----------------

------------------ find all the JCW products which does not have ship code ------------- START ---------------------

SELECT 
	distinct 
	p.sku,pj.jcw_sku,pj.jcw_prod_id,pj.ship_code,pp.regular_price,pp.media_cd_id,pf.pf_code,pf.pf_name,
	jpf.qty_sold as group_qty_sold,
	jpf.rank as group_rank
FROM 
	products p
	INNER JOIN products_jcw pj USING(jcw_product_id)
	INNER JOIN product_pricing pp ON p.product_id = pp.product_id
	INNER JOIN product_family_products pfp ON p.product_id = pfp.product_id
	INNER JOIN product_family pf ON pfp.pf_id = pf.pf_id
	INNER JOIN jcw_productfamily_ranking jpf ON pf.pf_code = jpf.pf_code
WHERE 
	pj.ship_code = '' AND
	pj.jcw_product_id > 1 AND
	pp.media_cd_id = 7 AND
	p.publish_channel_id%8>3 AND
	p.isactive = 1 AND
	p.sku_status_id NOT IN (3,18,25) AND
	p.part_id NOT IN (5698,5623,5625,5624,5508,6095) AND
	p.ebay != 1 AND
	pf.pf_status_id = 1
ORDER BY
	jpf.rank,pf.pf_code DESC
LIMIT 10;

SELECT * FROM ( 
	SELECT 'p.sku','pj.jcw_sku','pj.jcw_prod_id','pj.ship_code','pp.regular_price','pp.media_cd_id','pf.pf_code','pf.pf_name','group_qty_sold','group_rank' UNION 
(SELECT 
	distinct 
	p.sku,pj.jcw_sku,pj.jcw_prod_id,pj.ship_code,pp.regular_price,pp.media_cd_id,pf.pf_code,pf.pf_name,
	jpf.qty_sold as group_qty_sold,
	jpf.rank as group_rank
FROM 
	products p
	INNER JOIN products_jcw pj USING(jcw_product_id)
	INNER JOIN product_pricing pp ON p.product_id = pp.product_id
	INNER JOIN product_family_products pfp ON p.product_id = pfp.product_id
	INNER JOIN product_family pf ON pfp.pf_id = pf.pf_id
	INNER JOIN jcw_productfamily_ranking jpf ON pf.pf_code = jpf.pf_code
WHERE 
	pj.ship_code = '' AND
	pj.jcw_product_id > 1 AND
	pp.media_cd_id = 7 AND
	p.publish_channel_id%8>3 AND
	p.isactive = 1 AND
	p.sku_status_id NOT IN (3,18,25) AND
	p.part_id NOT IN (5698,5623,5625,5624,5508,6095) AND
	p.ebay != 1 AND
	pf.pf_status_id = 1 AND
	pp.regular_price > 0
ORDER BY
	jpf.rank,pf.pf_code DESC )) AS x4d492b540582d  
INTO OUTFILE '/tmp/jcw_products_without_shipcode_1.txt' FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

------------------ find all the JCW products which does not have ship code ------------- END ---------------------

update `43k` SET jcw_sku = REPLACE(jcw_sku,'\r','');

------------------
mysql -ulongbow -pXD56JK45 LONGBOW_temp < /tmp/atg_sku_notin_endeca_20110907.sql;

ALTER TABLE LONGBOW_temp.atg_sku_notin_endeca_20110907 ADD 1JA_regular_price double(7,2), ADD USAP_product_id int(10) unsigned DEFAULT 0, ADD group_code varchar(50), ADD apps int(10) unsigned DEFAULT 0, ADD isuniveral tinyint(1) default 0, ADD sku_status varchar(50), ADD jcw_product_id mediumint(8) unsigned DEFAULT 0, ADD index (USAP_product_id);

-- UPDATE jcw_product_id
UPDATE
	LONGBOW_temp.atg_sku_notin_endeca_20110907 tmp
	INNER JOIN LONGBOW_data.products_jcw pj ON tmp.product_sku = pj.jcw_sku
SET
	tmp.jcw_product_id = pj.jcw_product_id;

--------
UPDATE
	LONGBOW_temp.atg_sku_notin_endeca_20110907 tmp
	INNER JOIN LONGBOW_data.products p ON tmp.jcw_product_id = p.jcw_product_id
SET
	tmp.USAP_product_id = p.product_id;
	
------------------

mysql -ulongbow -pXD56JK45 LONGBOW_temp < /tmp/find_jcw_groupcode.sql;

ALTER TABLE LONGBOW_temp.find_jcw_groupcode ADD USAP_product_id int(10) unsigned DEFAULT 0, ADD group_code varchar(50), CHANGE jcw_prod_id jcw_prod_id mediumint(8) unsigned, ADD jcw_product_id mediumint(8) unsigned DEFAULT 0, ADD index (USAP_product_id), ADD INDEX (jcw_prod_id), ADD INDEX (jcw_product_id);

-- Find & update jcw_product_id
UPDATE
	LONGBOW_temp.find_jcw_groupcode tmp
	INNER JOIN LONGBOW_data.products_jcw pj ON tmp.jcw_prod_id = pj.jcw_prod_id
SET
	tmp.jcw_product_id = pj.jcw_product_id;
	
-- Find & update USAP_product_id
UPDATE
	LONGBOW_temp.find_jcw_groupcode tmp
	INNER JOIN LONGBOW_data.products p ON tmp.jcw_product_id = p.jcw_product_id
SET
	tmp.USAP_product_id = p.product_id;
	
-- Find & update Group_code
UPDATE
	LONGBOW_temp.find_jcw_groupcode tmp
	INNER JOIN LONGBOW_data.product_family_products pfp ON (tmp.USAP_product_id = pfp.product_id AND pfp.channel_id = 3)
	INNER JOIN LONGBOW_data.product_family pf ON pfp.pf_id = pf.pf_id
SET
	tmp.group_code = pf.pf_code;
	
-- Export data from temp table to text file

SELECT * FROM ( 
	SELECT 'sty_sku','sty_part_id','sku' UNION 
(SELECT distinct ps.sty_sku, ps.sty_part_id,p.sku from products_stylin ps inner join products p USING (sty_product_id) where p.sty_product_id > 1 AND p.ship_code = '')) AS x4d492b540582d  
INTO OUTFILE '/tmp/stylin_skus_no_shipcode.txt' FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';


SELECT distinct ps.sty_sku, ps.sty_part_id,p.sku,p.ship_code from products_stylin ps inner join products p USING (sty_product_id) where p.sty_product_id > 1 AND p.ship_code = '' limit 10;

-------------------------------------------------------------------
-- CREATE backup of product_family_products table
CREATE TABLE LONGBOW_temp.product_family_products_20110908 SELECT * FROM LONGBOW_data.product_family_products;
CREATE TABLE LONGBOW_temp.products_20110908 SELECT * FROM LONGBOW_data.products;

mysql -ulongbow -pXD56JK45 LONGBOW_data < /tmp/change_group_jcw_skus_20110908.sql;

ALTER table LONGBOW_data.change_group_jcw_skus_20110908 change jcw_sku jcw_sku varchar(50), add index (jcw_sku), change sku sku varchar(50), add index (sku), change pf_code old_pf_code varchar(50), add index (old_pf_code), change group_number new_pf_code varchar(50), add index (new_pf_code);

ALTER table LONGBOW_data.change_group_jcw_skus_20110908  add old_pf_id int(10) unsigned after old_pf_code, add new_pf_id int(10) unsigned after new_pf_code, add index (old_pf_id), add index (new_pf_id);

ALTER table LONGBOW_data.change_group_jcw_skus_20110908  add product_id int(10) unsigned after sku,add brand_id int(10) unsigned after sku_brand, add index (product_id), add index (brand_id);

UPDATE LONGBOW_data.change_group_jcw_skus_20110908 a INNER JOIN LONGBOW_data.product_family pf ON a.old_pf_code = pf.pf_code SET a.old_pf_id = pf.pf_id;

UPDATE LONGBOW_data.change_group_jcw_skus_20110908 a INNER JOIN LONGBOW_data.product_family pf ON a.new_pf_code = pf.pf_code SET a.new_pf_id = pf.pf_id;

UPDATE LONGBOW_data.change_group_jcw_skus_20110908 SET new_pf_code = REPLACE(new_pf_code,'\r','');

-- Update brand based on brand name
UPDATE LONGBOW_data.change_group_jcw_skus_20110908 a INNER JOIN LONGBOW_data.brands br ON a.sku_brand = br.brand_name SET a.brand_id = br.brand_id;

-- Update product_id based on sku and brand_id
UPDATE 
	LONGBOW_data.change_group_jcw_skus_20110908 a 
	INNER JOIN LONGBOW_data.products p ON (a.sku = p.sku AND a.brand_id = p.brand_id)
SET 
	a.product_id = p.product_id;	

-- UPDATE new_pf_id into product_family_products table based on product_id, old_pf_id and channel_id match

SELECT a.new_pf_id,a.old_pf_id,a.product_id from LONGBOW_data.change_group_jcw_skus_20110908 a where old_pf_id <= 0;

SELECT 
	a.new_pf_id,a.old_pf_id,a.product_id,pfp.product_id, 
	CONCAT('DELETE FROM LONGBOW_data.product_family_products WHERE pf_id = \'', a.old_pf_id,'\' AND product_id = \'',a.product_id,'\' AND channel_id = \'3\'') as delete_query
from 
	LONGBOW_data.change_group_jcw_skus_20110908 a inner join LONGBOW_data.product_family_products pfp ON a.old_pf_id = pfp.pf_id AND a.product_id = pfp.product_id AND pfp.channel_id = 3;

mysqldump -ulongbow -pXD56JK45 LONGBOW_data disassociate_skus_20110922 > /tmp/disassociate_skus_20110922.sql;

SELECT 
	CONCAT('INSERT IGNORE INTO LONGBOW_data.product_family_products (pf_id,product_id,channel_id,created_datetime,create_user_id) VALUES (\'', a.old_pf_id,'\' AND product_id = \'',a.product_id,'\' AND channel_id = \'3\'') as delete_query 
FROM 
	LONGBOW_data.change_group_jcw_skus_20110908 a;
--------------------------------------------------------------------------------	
INSERT IGNORE INTO LONGBOW_data.product_family_products (pf_id,product_id,channel_id,created_datetime,create_user_id) SELECT new_pf_id,product_id,3,now(),839 FROM LONGBOW_data.change_group_jcw_skus_20110908;

SELECT count(1) from product_family_products; -- 3535038 - 655 = 3534383
mysql -ulongbow -pXD56JK45 LONGBOW_data < /tmp/update_jcw_sku_group.sql;
--------------------------------------------------------------------------------

DELETE FROM LONGBOW_data.product_family_products WHERE pf_id = '7042' AND product_id = '4001955' AND channel_id = '3' LIMIT 1;
DROP TABLE IF EXISTS LONGBOW_data.change_group_jcw_skus_20110908;

----------------------------------------

mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data product_family > /tmp/product_family_20110913.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data partnames > /tmp/partnames_20110913.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data wag_part_subcategory > /tmp/wag_part_subcategory_20110913.sql;

mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data disassociate_skus_20110922 > /tmp/disassociate_skus_20110922.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data product_family_products > /tmp/product_family_products_20110922.sql;

alter table group_partname_change_20110913 change group_part_name group_part_name varchar(128), change pf_code pf_code varchar(50), add new_part_id int(10) unsigned, add old_part_id int(10) unsigned,add pf_id int(10) unsigned, add index(group_part_name), add index(pf_code), add index(new_part_id), add index (pf_id);

UPDATE group_partname_change_20110913 a INNER JOIN partnames pn ON a.group_part_name = pn.part_name SET a.new_part_id = pn.part_id;

UPDATE group_partname_change_20110913 a INNER JOIN product_family pf ON a.pf_code = pf.pf_code SET a.pf_id = pf.pf_id, a.old_part_id = pf.part_id;

------------------------------------------
------------ START
------------------------------------------

DROP TABLE IF EXISTS LONGBOW_temp.groups_sku_totalcount_20110916;
-- 23653
CREATE TABLE LONGBOW_temp.groups_sku_totalcount_20110916
SELECT 
	pf.pf_code,
	pf.part_id,
	pf.brand_id,
	COUNT(distinct p.product_id) as total_sku_cnt
FROM 
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
WHERE
	pf.pf_status_id = 1
GROUP BY
	pf.pf_code;

ALTER TABLE LONGBOW_temp.groups_sku_totalcount_20110916 CHANGE pf_code pf_code varchar(50), CHANGE total_sku_cnt total_sku_cnt int(10) unsigned, ADD INDEX (pf_code), ADD INDEX (total_sku_cnt), ADD INDEX (part_id), ADD INDEX (brand_id);

---	obsolete, excluded, or delete?  We need to mark those retired

DROP TABLE IF EXISTS LONGBOW_temp.groups_sku_retire_20110916;
-- 4927
CREATE TABLE LONGBOW_temp.groups_sku_retire_20110916
SELECT 
	pf.pf_code,
	pf.part_id,
	pf.brand_id,
	COUNT(distinct p.product_id) as total_sku_cnt
FROM 
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
WHERE
	pf.pf_status_id = 1 AND
	p.sku_status_id IN (3,18,25)
GROUP BY
	pf.pf_code;

ALTER TABLE LONGBOW_temp.groups_sku_retire_20110916 CHANGE pf_code pf_code varchar(50), CHANGE total_sku_cnt total_sku_cnt int(10) unsigned, ADD INDEX (pf_code), ADD INDEX (total_sku_cnt), ADD INDEX (part_id), ADD INDEX (brand_id);
	
---	draft, initialized, processing, pm review or pm research

DROP TABLE IF EXISTS LONGBOW_temp.groups_sku_inactive_20110916;
-- 10149
CREATE TABLE LONGBOW_temp.groups_sku_inactive_20110916
SELECT 
	pf.pf_code,
	pf.part_id,
	pf.brand_id,
	COUNT(distinct p.product_id) as total_sku_cnt
FROM 
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products p ON pfp.product_id = p.product_id
WHERE
	pf.pf_status_id = 1 AND
	p.sku_status_id IN (28,19,20,26,29)
GROUP BY
	pf.pf_code;

ALTER TABLE LONGBOW_temp.groups_sku_inactive_20110916 CHANGE pf_code pf_code varchar(50), CHANGE total_sku_cnt total_sku_cnt int(10) unsigned, ADD INDEX (pf_code), ADD INDEX (total_sku_cnt), ADD INDEX (part_id), ADD INDEX (brand_id);

---	Find list of Groups which can be retired

DROP TABLE IF EXISTS LONGBOW_temp.groups_retire_20110916;

CREATE TABLE LONGBOW_temp.groups_retire_20110916
SELECT
	a.pf_code,
	a.total_sku_cnt,
	a.part_id,
	a.brand_id
FROM
	LONGBOW_temp.groups_sku_totalcount_20110916 a
	INNER JOIN LONGBOW_temp.groups_sku_retire_20110916 b ON a.pf_code = b.pf_code
WHERE
	a.total_sku_cnt = b.total_sku_cnt;

ALTER TABLE LONGBOW_temp.groups_retire_20110916 ADD INDEX (part_id), ADD INDEX (brand_id);
	
---	Find list of Groups which can be Inactive

DROP TABLE IF EXISTS LONGBOW_temp.groups_inactive_20110916;

CREATE TABLE LONGBOW_temp.groups_inactive_20110916
SELECT
	a.pf_code,
	a.total_sku_cnt,
	a.part_id,
	a.brand_id
FROM
	LONGBOW_temp.groups_sku_totalcount_20110916 a
	INNER JOIN LONGBOW_temp.groups_sku_inactive_20110916 b ON a.pf_code = b.pf_code
WHERE
	a.total_sku_cnt = b.total_sku_cnt;

ALTER TABLE LONGBOW_temp.groups_inactive_20110916 ADD INDEX (part_id), ADD INDEX (brand_id);

------------------------------------------------------------------------------------------------

CREATE TABLE LONGBOW_temp.products_jcw_20110916 SELECT * FROM LONGBOW_data.products_jcw;

SELECT count(1) FROM products_jcw;

DELETE FROM LONGBOW_data.products_jcw where jcw_product_id IN (1704287,1704285,1704286,623120,624469,621238,620919,898021,898020,898019,898018,898017,898016,132696,123452,242231,1693906,1693905,1693904,1693903,1693902,1693901,231789,1657476,1702375,1702363,1702361,1702359,1702357,1706951,898884,139895,895591,542397,584760,542398,542400,214161) LIMIT 38;

mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data tmp_all_duplicate_20110926 > /tmp/tmp_all_duplicate_20110926.sql;
mysqldump -ulongbow -pXD56JK45 LONGBOW_data product_family_property > /tmp/product_family_property_20110916.sql;

mysql -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data < /tmp/del_product_kill_list_20110916.sql;

CREATE TABLE LONGBOW_data.product_kill_list_20110916 SELECT * FROM LONGBOW_data.product_kill_list;

SELECT COUNT(1) FROM product_kill_list;

DROP TABLE IF EXISTS LONGBOW_data.groups_with_series_att_20110920;

CREATE TABLE groups_with_series_att_20110920
SELECT 
	pf.pf_id,
	pf.pf_code,
	pf.pf_name,
	pfa.pa_type_id,
	pfa.pa_value_id
FROM 
	product_family pf INNER JOIN 
	product_family_attributes pfa ON pf.pf_id = pfa.pf_id
WHERE 
	pfa.pa_type_id = 1303;

ALTER TABLE groups_with_series_att_20110920 ADD INDEX (pf_id), ADD INDEX (pf_code), ADD INDEX (pa_type_id), ADD INDEX (pa_value_id);

ALTER TABLE groups_with_series_att_20110920 ADD pa_type_name varchar(255) DEFAULT NULL, ADD pa_value_name varchar(255) DEFAULT NULL;

UPDATE
	groups_with_series_att_20110920 tmp
	INNER JOIN product_attribute_type_cpam patc USING(pa_type_id)
SET
	tmp.pa_type_name = patc.pa_type_name;
	
UPDATE
	groups_with_series_att_20110920 tmp
	INNER JOIN product_attribute_value_cpam patc USING(pa_value_id)
SET
	tmp.pa_value_name = patc.pa_value_name;

INSERT INTO disassociate_skus_20110922 ('pf_code','pf_id','pa_type_name','pa_type_id','pa_value_name','pa_value_id','sku','product_id')	
SELECT
	distinct
	pf.pf_code,
	pf.pf_id,
	patc.pa_type_name,
	patc.pa_type_id,
	pavc.pa_value_name,
	pavc.pa_value_id,
	pfa.sku,
	pfa.product_id
FROM
	product_family pf
	INNER JOIN product_family_products pfp ON pf.pf_id = pfp.pf_id
	INNER JOIN products pfa ON pfp.product_id = pfa.product_id
	INNER JOIN product_attributes_cpam pac ON pfa.product_id = pac.product_id	
	INNER JOIN product_attribute_type_cpam patc ON pac.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pac.pa_value_id = pavc.pa_value_id
WHERE
	patc.pa_type_id    = 1303 AND
	pavc.pa_value_name = 'AC Delco Premium Gas-Charged' AND
	pf.pf_code IN ('ACSH7097');


SELECT 
	pf.pf_id,
	pf.pf_code,
	pfa.pa_type_id,
	pfa.pa_value_id
FROM 
	product_family pf INNER JOIN 
	product_family_attributes pfa ON pf.pf_id = pfa.pf_id
WHERE 
	(publish_channel_id%2>0 OR 
	publish_channel_id%4>1) AND
	pfa.pa_type_id = '1303' LIMIT 10;
	
============================================================================

DROP TABLE IF EXISTS tmp_groups_SKUs_series_groupby_20110920;

CREATE TABLE tmp_groups_SKUs_series_groupby_20110920 SELECT a.pf_code,group_concat(a.pa_value_name) as cnt,count(a.pa_value_id) as count from tmp_groups_SKUs_series_20110920 a group by a.pf_code;

ALTER TABLE tmp_groups_SKUs_series_groupby_20110920 change pf_code pf_code varchar(50), add index (pf_code);

DROP TABLE IF EXISTS group_series_discrepancy_final_20110920;

CREATE TABLE group_series_discrepancy_final_20110920 SELECT a.pf_id,a.pf_code,a.pa_type_name,a.pa_value_name as group_series,b.cnt as SKU_series,b.count from groups_with_series_att_20110920 a left join tmp_groups_SKUs_series_groupby_20110920 b ON a.pf_code = b.pf_code;

SELECT * from group_series_discrepancy_final_20110920;
desc group_series_discrepancy_final_20110920;

ALTER TABLE group_series_discrepancy_final_20110920 add index (group_series), add index (SKU_series), add index (pf_code), add comments tinytext;

UPDATE group_series_discrepancy_final_20110920 a SET comments = 'No Action' WHERE a.comments IS NULL AND a.group_series = a.SKU_series;
UPDATE group_series_discrepancy_final_20110920 a SET comments = 'No Action' WHERE a.comments IS NULL AND a.group_series IS NULL AND a.SKU_series IS NULL;

UPDATE group_series_discrepancy_final_20110920 a SET comments = 'Need to update Group\'s Series' WHERE a.comments IS NULL AND a.group_series IS NULL AND (a.count = 1);
UPDATE group_series_discrepancy_final_20110920 a SET comments = 'Need to update Group\'s Series' WHERE a.comments IS NULL AND a.group_series IS NOT NULL AND a.SKU_series IS NOT NULL AND a.count = 1;

UPDATE LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
JOIN (
SELECT 
	CONCAT(MIN(price2),'-', MAX(price2)) AS price_usap,pf_id
FROM 
	LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
	INNER JOIN product_family_products USING(pf_id)
	INNER JOIN products p USING(product_id)
	INNER JOIN sku_status USING(sku_status_id)
WHERE 
	p.price2 > 0 AND(tmp.publish_channel_id%2 > 0) AND sku_status IN ('3. Processing', '4. Launched', '6. Clearance')
GROUP BY 
	tmp.pf_id) X ON X.pf_id= tmp.pf_id SET tmp.price_usap = X.price_usap


UPDATE LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
JOIN (
SELECT CONCAT(MIN(regular_price),'-', MAX(regular_price)) AS price_stylin,pf_id
FROM LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
INNER JOIN product_family_products pfp USING(pf_id)
INNER JOIN products p ON(p.product_id=pfp.product_id)
INNER JOIN product_pricing pp ON(pp.product_id=p.product_id)
INNER JOIN media_code USING(media_cd_id)
INNER JOIN sku_status USING(sku_status_id)
WHERE pp.regular_price > 0 AND (tmp.publish_channel_id%4 > 1) AND sku_status IN ('3. Processing', '4. Launched', '6. Clearance') AND media_cd ='ST1'
GROUP BY tmp.pf_id)X ON X.pf_id= tmp.pf_id SET tmp.price_stylin = X.price_stylin



UPDATE LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
JOIN (
SELECT CONCAT(MIN(regular_price),'-', MAX(regular_price)) AS price_jcw,pf_id
FROM LONGBOW_temp.temp_pf_price_102db17af951a1f312b7e984f1252b1c tmp
INNER JOIN product_family_products pfp USING(pf_id)
INNER JOIN products p ON(p.product_id=pfp.product_id)
INNER JOIN product_pricing pp ON(pp.product_id=p.product_id)
INNER JOIN media_code USING(media_cd_id)
INNER JOIN sku_status USING(sku_status_id)
WHERE pp.regular_price > 0 AND (tmp.publish_channel_id%8 > 3) AND sku_status IN ('3. Processing', '4. Launched', '6. Clearance') AND media_cd ='1JA'
GROUP BY tmp.pf_id)X ON X.pf_id= tmp.pf_id SET tmp.price_jcw = X.price_jcw




UPDATE LONGBOW_data.product_family_attributes SET pa_value_id = '' WHERE pf_id = '' AND pa_type_id = 1303 LIMIT 1;

UPDATE LONGBOW_data.product_family_attributes SET pa_value_id = '67608' WHERE pf_id = '4542' AND pa_type_id = 1303 LIMIT 1;

mysql -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data < /tmp/fix_groups_configuration.sql;

mysql> SELECT count(1) FROM LONGBOW_data.product_family_attributes;
+----------+
| count(1) |
+----------+
|    32675 |
+----------+

CREATE TABLE LONGBOW_temp.legacy_makes_20110916 SELECT * FROM LONGBOW_data.legacy_makes;
CREATE TABLE LONGBOW_temp.product_family_products_20111017 SELECT * FROM LONGBOW_data.product_family_products;
CREATE TABLE LONGBOW_temp.product_family_20111017 SELECT * FROM LONGBOW_data.product_family;

SELECT COUNT(1) FROM LONGBOW_data.product_family_products_20110916;

mysql -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data < /tmp/disassociate_products.sql;

SELECT
	pf.pf_code,
	pf.pf_name,
	pfs.pf_status,
	pf.part_id,
	pf.brand_id,
	pc.publish_channel_name
FROM
	product_family pf
	INNER JOIN product_family_status pfs USING(pf_status_id)
	INNER JOIN publish_channel pc USING(publish_channel_id)
	LEFT JOIN partnames pn USING(part_id)
WHERE
	pn.part_id IS NULL;
	
SELECT
	pf.pf_code,
	pf.pf_name,
	pfs.pf_status,
	pf.part_id,
	pf.brand_id,
	pc.publish_channel_name
FROM
	product_family pf
	INNER JOIN product_family_status pfs USING(pf_status_id)
	INNER JOIN publish_channel pc USING(publish_channel_id)
	LEFT JOIN brands br USING(brand_id)
WHERE
	br.brand_id IS NULL;
	
UPDATE legacy_makes set make_name = "American Motors" WHERE legacy_make_id = 4 LIMIT 1;

--------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_duplicate_20110926;

USE LONGBOW_data -A;
DESC LONGBOW_temp.tmp_synonym_part_name_9eedc3c6b643b184b091862a5f6c5cf7;
DROP TABLE IF EXISTS LONGBOW_temp.tmp_synonym_part_name_9eedc3c6b643b184b091862a5f6c5cf7;

CREATE TABLE tmp_duplicate_20110926 select sku_merchant, brand_id ,count(product_id) as cnt, GROUP_CONCAT(sku) from products WHERE sku_merchant != '' group by sku_merchant,brand_id HAVING cnt > 1;

ALTER TABLE tmp_duplicate_20110926 ADD INDEX (sku_merchant), ADD INDEX (brand_id); 

CREATE TABLE tmp_all_duplicate_20110926
SELECT
	tmp.sku_merchant,
	tmp.brand_id,
	p.sku,
	b.brand_name,
	pj.jcw_sku,
	ps.sty_sku,
	ss.sku_status,
	p.isactive,
	p.part_id,
	p.motorcycle_part_id
FROM
	tmp_duplicate_20110926 tmp
	INNER JOIN products p ON (tmp.sku_merchant = p.sku_merchant AND tmp.brand_id = p.brand_id)
	INNER JOIN brands b ON (p.brand_id = b.brand_id)
	INNER JOIN sku_status ss USING(sku_status_id)
	INNER JOIN products_jcw pj USING (jcw_product_id)
	INNER JOIN products_stylin ps USING (sty_product_id) LIMIT 30;
	
select pnotes_id, spnotes_id, sku_status_id, brand_id, part_id from products where sku = 'YA7593';


mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data qb_data_element > /tmp/qb_data_element_20110926.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data qb_report > /tmp/qb_report_20110926.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data qb_result_set > /tmp/qb_result_set_20110926.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data qb_role_map > /tmp/qb_role_map_20110926.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data qb_team_map > /tmp/qb_team_map_20110926.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data user_team_map > /tmp/user_team_map_20110926.sql;

mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data products > /tmp/products_20111214.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data product_family_products > /tmp/product_family_products_20111214.sql;
mysqldump -ulongbow -pXD56JK45 -h10.234.65.118 LONGBOW_data jcw_productfamily_ranking > /tmp/jcw_productfamily_ranking_20111228.sql;


SELECT
	a.*,
	b.product_id,
	b.regular_price
FROM
	media_code a
	INNER JOIN product_pricing b USING (media_cd_id)
WHERE
	media_cd IN ('QR','QS','QT','LM','QU','KAE','KAF','KAG','KAH','CDF','CDG','FCR','FCS','BCX','BCY','GBT','GBW','YM','DCL','DCM');
	
	
SELECT
	pj.jcw_sku,
	p.sku,
	pp.regular_price,
	pp.product_id,
	mc.media_cd,
	mc.start_date,
	mc.end_date
FROM
	products_jcw pj
	INNER JOIN products p USING(jcw_product_id)
	INNER JOIN product_pricing pp USING(product_id)
	INNER JOIN media_code mc USING (media_cd_id)
WHERE
	p.product_id = '2297366' LIMIT 10;

----------------------------	
SELECT
	distinct
	patc.pa_type_name,
	patc.pa_type_id,
	pavc.pa_value_name,
	pavc.pa_value_id,
	p.sku,
	p.product_id
FROM
	products p
	INNER JOIN product_attributes_cpam pac ON p.product_id = pac.product_id	
	INNER JOIN product_attribute_type_cpam patc ON pac.pa_type_id = patc.pa_type_id
	INNER JOIN product_attribute_value_cpam pavc ON pac.pa_value_id = pavc.pa_value_id
WHERE
	p.sku = 'GM24ER';
	
	
SELECT
	distinct
	patc.pa_type_name,
	patc.pa_type_id,
	pavc.pa_value_name,
	pavc.pa_value_id,
	p.sku,
	p.product_id
FROM
	products p
	LEFT JOIN product_attributes_cpam pac ON p.product_id = pac.product_id	
	LEFT JOIN product_attribute_type_cpam patc ON pac.pa_type_id = patc.pa_type_id
	LEFT JOIN product_attribute_value_cpam pavc ON pac.pa_value_id = pavc.pa_value_id
WHERE
	p.sku = 'WAGF120885' AND
	patc.pa_type_name = 'Material' AND
	pac.product_id IS NULL;
	
	
SELECT
	a.*,
	b.pf_name
FROM
	jcw_productfamily_ranking a 
	INNER JOIN product_family b USING(pf_code)
ORDER BY 
	rank,qty_sold desc;
	

select history_id,product_id,field_name,old_value,new_value,user_id,source,source_data,description from history_products inner join history_changelog using (history_id) where field_name='isactive' and product_id = '3249523' order by history_id desc limit 10;

SELECT CONCAT(table_schema, '.', table_name),
       CONCAT(ROUND(table_rows / 1000000, 2), 'M')                                    rows,
       CONCAT(ROUND(data_length / ( 1024 * 1024 * 1024 ), 2), 'G')                    DATA,
       CONCAT(ROUND(index_length / ( 1024 * 1024 * 1024 ), 2), 'G')                   idx,
       CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 * 1024 ), 2), 'G') total_size,
       ROUND(index_length / data_length, 2)                                           idxfrac
FROM   information_schema.TABLES
ORDER  BY data_length + index_length DESC
LIMIT  10;

SELECT * FROM ( 
	SELECT 'Product_ID','Brand','IsAvailable','USAP SKU','STT SKU','JCW SKU' UNION 
(SELECT 
	distinct 
	p.product_id,
	b.brand_name,
	p.isactive,
	p.sku,
	ps.sty_sku,
	pj.jcw_sku
FROM 
	products p
	LEFT JOIN brands b ON p.brand_id = b.brand_id
	LEFT JOIN products_jcw pj USING(jcw_product_id)
	LEFT JOIN products_stylin ps USING(sty_product_id)
	)) AS x4d492b540582d  
INTO OUTFILE '/tmp/check_inventory_20120314.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM ( 
	SELECT 'Product_ID','Brand','IsAvailable','USAP SKU','STT SKU','JCW SKU' UNION 
(SELECT 
	distinct 
	p.product_id,
	p.brand_name,
	p.new_isavailable,
	p.sku,
	p.sty_sku,
	p.jcw_sku
FROM 
	inventory_stock p
	)) AS x4d492b540582d  
INTO OUTFILE '/tmp/check_inventory_20120321.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM tmp_20130417_duplicate_linklist INTO OUTFILE '/tmp/duplicate_wagscat.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT
	p.product_id,
	pj.jcw_sku,
	p.sku,
	b.brand_name
FROM
	products p
	INNER JOIN brands b ON p.brand_id = b.brand_id
	INNER JOIN products_jcw pj USING (jcw_product_id)
WHERE
	pj.jcw_sku IN ('G85369A','T85365A','T85465A');
	
SELECT
	p.product_id,
	pj.jcw_sku,
	p.sku,
	b.brand_name,
	p.jcw_product_id
FROM
	products p
	LEFT JOIN brands b ON p.brand_id = b.brand_id
	LEFT JOIN products_jcw pj USING (jcw_product_id)
WHERE
	p.sku IN ('WAGXE4510DK');
	
	SELECT  CONCAT("('",p.product_id,"',@a,'jcw_sku','",pj.jcw_sku,"','','JCW SKU removal request by Denise from backend'),")  FROM products p LEFT JOIN brands b ON p.brand_id = b.brand_id LEFT JOIN products_jcw pj USING (jcw_product_id) WHERE p.sku IN ('W0133-1653150');

SELECT
	p.product_id,
	ps.sty_sku,
	p.sku,
	b.brand_name
FROM
	products p
	LEFT JOIN brands b ON p.brand_id = b.brand_id
	LEFT JOIN products_stylin ps USING (sty_product_id)
WHERE
	p.sku IN ('GM38ER');
	
SELECT  
	CONCAT("('",p.product_id,"',@a,'sty_sku','",ps.sty_sku,"','','JCW SKU removal request by Denise from backend'),")  
FROM 
	products p LEFT JOIN brands b ON p.brand_id = b.brand_id LEFT JOIN products_stylin ps USING (sty_product_id) WHERE p.sku IN ('61020.01','FRSTFTJ120901W002');

-----------

SELECT
	pf_id,
	pf_code,
	pf_status_id,
	CONCAT( 
		IF(isnull(s11.wag_scat_name),'',CONCAT(s11.wag_scat_name,'(',s11.wag_scat_id,')',' => ')),
		IF(isnull(s9.wag_scat_name),'',CONCAT(s9.wag_scat_name,'(',s9.wag_scat_id,')',' => ')),
		IF(isnull(s7.wag_scat_name),'',CONCAT(s7.wag_scat_name,'(',s7.wag_scat_id,')',' => ')),
		IF(isnull(s5.wag_scat_name),'',CONCAT(s5.wag_scat_name,'(',s5.wag_scat_id,')',' => ')),
		IF(isnull(s3.wag_scat_name),'',CONCAT(s3.wag_scat_name,'(',s3.wag_scat_id,')',' => ')),
		CONCAT(s1.wag_scat_name,'(',s1.wag_scat_id,')',' => ') ,
		CONCAT(s2.wag_scat_name,'(',s2.wag_scat_id,')') ) as navigation
 
 FROM 
 
	LONGBOW_data.wag_subcategory_linklist ll

	 JOIN LONGBOW_data.wag_subcategory s1 on ll.wag_parent_scat_id = s1.wag_scat_id
	 JOIN LONGBOW_data.wag_subcategory s2 on ll.wag_child_scat_id = s2.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_subcategory_linklist ll2 on ll.wag_parent_scat_id = ll2.wag_child_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s3 on ll2.wag_parent_scat_id = s3.wag_scat_id
	 LEFT JOIN LONGBOW_data. wag_subcategory s4 on ll2.wag_child_scat_id = s4.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_subcategory_linklist ll3 on ll2.wag_parent_scat_id = ll3.wag_child_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s5 on ll3.wag_parent_scat_id = s5.wag_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s6 on ll3.wag_child_scat_id = s6.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_subcategory_linklist ll4 on ll3.wag_parent_scat_id = ll4.wag_child_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s7 on ll4.wag_parent_scat_id = s7.wag_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s8 on ll4.wag_child_scat_id = s8.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_subcategory_linklist ll5 on ll4.wag_parent_scat_id = ll5.wag_child_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s9 on ll5.wag_parent_scat_id = s9.wag_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s10 on ll5.wag_child_scat_id = s10.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_subcategory_linklist ll6 on ll5.wag_parent_scat_id = ll6.wag_child_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s11 on ll6.wag_parent_scat_id = s11.wag_scat_id
	 LEFT JOIN LONGBOW_data.wag_subcategory s12 on ll6.wag_child_scat_id = s12.wag_scat_id

	 LEFT JOIN LONGBOW_data.wag_part_subcategory ps on ll.wag_child_scat_id = ps.wag_scat_id
	 LEFT JOIN LONGBOW_data.channels c ON ps.channel_id = c.channel_id

	 JOIN product_family pf using (pf_id)
 WHERE  
	pf_code='26249G' group by pf_code, navigation
 order by navigation;

------
 
SELECT 
	IFNULL(s5.wag_scat_name,'') as category,
	IF(isnull(s3.wag_scat_name),'',CONCAT(s3.wag_scat_name,'(',s3.wag_scat_id,')')) as category_subcategory_1,
	CONCAT(s1.wag_scat_name,'(',s1.wag_scat_id,')') as category_subcategory_2,
	CONCAT(s2.wag_scat_name,'(',s2.wag_scat_id,')') as subcategory_1,pf_code 
FROM 
	wag_subcategory_linklist ll
	JOIN wag_subcategory s1 on ll.wag_parent_scat_id = s1.wag_scat_id
	JOIN wag_subcategory s2 on ll.wag_child_scat_id = s2.wag_scat_id
	
	LEFT JOIN wag_subcategory_linklist ll2 on ll.wag_parent_scat_id = ll2.wag_child_scat_id
	LEFT JOIN wag_subcategory s3 on ll2.wag_parent_scat_id = s3.wag_scat_id
	LEFT JOIN wag_subcategory s4 on ll2.wag_child_scat_id = s4.wag_scat_id
	
	LEFT JOIN wag_subcategory_linklist ll3 on ll2.wag_parent_scat_id = ll3.wag_child_scat_id
	LEFT JOIN wag_subcategory s5 on ll3.wag_parent_scat_id = s5.wag_scat_id
	LEFT JOIN wag_subcategory s6 on ll3.wag_child_scat_id = s6.wag_scat_id
	
	JOIN wag_part_subcategory ps on ll.wag_child_scaT_id = ps.wag_scat_id
	JOIN product_family pf on ps.pf_id = pf.pf_id
WHERE 
	s2.wag_scat_name in ('Transmission')
ORDER BY 
	category,category_subcategory_1,category_subcategory_2,subcategory_1;
	
	
mysql> select
    -> count(pf_code) as count,
    -> group_concat(pf_code),
    -> group_concat(pf_id) ,
    -> group_concat(pf_status_id)
    -> from
    -> product_family pf left join product_family_attributes pfa using(pf_id) where publish_channel_id%8>3 AND pfa.pf_id IS NULL group by part_id,brand_id having count > 1 limit 10;
+-------+--------------------------+---------------------+----------------------------+
| count | group_concat(pf_code)    | group_concat(pf_id) | group_concat(pf_status_id) |
+-------+--------------------------+---------------------+----------------------------+
|     2 | 35889G,34632G            | 15068,15069         | 1,1                        |
|     2 | 39730G,40928G            | 9944,9945           | 1,1                        |
|     2 | 30920G,GATAC54614        | 17745,54441         | 1,1                        |
|     3 | 30922G,30923G,GATAC54615 | 17747,17748,54442   | 1,1,1                      |
|     2 | 32273G,DENAC50686        | 14801,50606         | 1,1                        |
|     2 | 21576G,28544G            | 13908,34375         | 1,1                        |
|     2 | 32274G,DENAC50687        | 14802,50607         | 1,1                        |
|     2 | 12885G,MODAC59470        | 22332,59196         | 3,1                        |
|     2 | 32314G,VALAC73375        | 32671,72766         | 1,1                        |
|     3 | 39726G,39723G,40927G     | 9946,9947,9948      | 1,1,1                      |
+-------+--------------------------+---------------------+----------------------------+
10 rows in set (0.11 sec)

---------


select 
	pf_code, pf_name, 
	asset_name, 
	asset_desc, 
	product_family_assets.sequence
from 
	product_family pf
	inner join product_family_assets using (pf_id)
	inner join assets using (asset_id)
	inner join asset_type using (asset_type_id)	
where 
	pf_code IN ('10079G','10123G','10125G','10126G','10128G','10131G','10138G','10141G','10144G','10145G','10148G','10149G','10152G','10161G','10164G','10165G','10167G','10171G','10172G','10173G','10175G','10177G','104','10497G','10658G','10687G','10701G','10705G','10706G','10708G','10725G','1072OLD','10738G','10739G','1080','10904OLD','10967G','10968G','10970G','10971G','10972G','10975G','11017G','11018G','11025G','11028G','11147G','11189G','112','11232G','11244G','11246G','11261G','11262G','11394G','114','11409G','11414G','11514G','11536G','11537G','11573G','11619G','11620G','11643G','11660G','11834G','12','1205OLD','12296G','12387G','12388G','1243','12452G','12453G','12457G','12458G','12480G','12725G','12727G','12734GOLD','12735G','12750G','12751G','12834G','1320','13265G','13306G','13356G','13415G','13424G','13471G','1349','13498G','13514G','13542G','1359','13833G','13834G') AND asset_name like 's7%' order by pf_code limit 100;

SELECT
	p.sku,
	p.product_id,
	a.asset_name,
	a.sequence,
	a.start_date,
	a.end_date
FROM
	products p
	INNER JOIN product_assets ps USING (product_id)
	INNER JOIN assets a USING (asset_id)
WHERE
	p.islive_usap = 1 AND
	a.asset_name like 's7%' AND
	a.asset_type_id = 1
LIMIT 50;
-------- SQLs for ACES ----
DROP TABLE IF EXISTS tmp_20120504_basevehicle;

CREATE TABLE tmp_20120504_basevehicle 
SELECT 
	distinct  
	V.BaseVehicleID, 
	V.VehicleID, 
	Y.YearID, 
	trim(MakeName), 
	trim(ModelName), 
	trim(SubmodelName) 
FROM 
	VCDB_Vehicle V 
	INNER JOIN VCDB_BaseVehicle BV ON V.BaseVehicleID = BV.BaseVehicleID 
	INNER JOIN VCDB_Year Y ON BV.YearID = Y.YearID 
	INNER JOIN VCDB_Make MK ON BV.MakeID = MK.MakeID 
	INNER JOIN VCDB_Model MO ON BV.ModelID = MO.ModelID 
	INNER JOIN VCDB_Submodel SM ON V.SubmodelID = SM.SubmodelID  
ORDER BY  
	Y.YearID,MakeName,ModelName,SubmodelName;

ALTER TABLE tmp_20120504_basevehicle ADD INDEX `idx_VehicleID` (VehicleID);

SELECT 
	distinct 
	a.*, 
	VC.VehicleConfigID,
	VC.EngineConfigID,
	EB.EngineBaseID,
	trim(EB.Cylinders), 
	trim(EB.Liter) 
FROM 
	tmp_20120504_basevehicle a 
	LEFT JOIN LONGBOW_aces.VCDB_VehicleConfig VC ON a.VehicleID = VC.VehicleID 
	LEFT JOIN LONGBOW_aces.VCDB_EngineConfig EC ON VC.EngineConfigID = EC.EngineConfigID 
	LEFT JOIN LONGBOW_aces.VCDB_EngineBase EB ON EC.EngineBaseID = EB.EngineBaseID LIMIT 10;
	
UPDATE
	tmp_unique_ymmscl tmp
	INNER JOIN years y ON tmp.YearID = y.vcdb_year
SET
	tmp.UsapYear = y.year;
	
UPDATE
	tmp_unique_ymmscl tmp
	INNER JOIN makes mk ON tmp.MakeID = mk.vcdb_make_id
SET
	tmp.UsapMake = mk.make_name,
	tmp.UsapMakeId = mk.make_id;
	
UPDATE
	tmp_unique_ymmscl tmp
	INNER JOIN models mo ON tmp.ModelID = mo.vcdb_model_id AND tmp.UsapMakeId = mo.make_id
SET
	tmp.UsapModel = mo.model_name;

UPDATE
	tmp_unique_ymmscl tmp
	INNER JOIN submodels smo ON tmp.SubmodelID = smo.vcdb_submodel_id
SET
	tmp.UsapSubmodel = smo.submodel_name;	
	
ALTER TABLE years ADD INDEX `idx_vcdb_year`(vcdb_year);
ALTER TABLE makes ADD INDEX `idx_vcdb_make_id`(vcdb_make_id);
ALTER TABLE models ADD INDEX `idx_vcdb_make_model_id`(vcdb_model_id,make_id);
ALTER TABLE submodels ADD INDEX `idx_vcdb_submodel_id`(vcdb_submodel_id);

find /data -name *.php -exec grep -l "DX_ASSET_TYPE_ID" {} \;
find /use -name *.pl -exec grep -l "vehicle_information" {} \;
find /var -name *.pl -exec grep -l "vehicle_information" {} \;

find /data/ /usr/ /var/ -name *.* -exec grep -l "ss_shippingcost" {} \;
# Find files in all directories
find / -type f -name drop_temp_tables.php
find /data/longbow/mount/imports -type f -name Dailyprice6shipupdate.txt
grep -r -i "Dailyprice6shipupdate.txt" --color /data/longbow/mount/imports

find /data/longbow/catalog/imports/applications/20131203/141251/* -type f -exec grep -l 'EBC' {} \;

-------------------------------------------------------------------------
- Command to find files modified in last 7 days in some directory - START
-------------------------------------------------------------------------
find /drhome/dpatel/echo_current/ -mtime -7 -ls
-------------------------------------------------------------------------
- Command to find files modified in last 7 days in some directory - END
-------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Recursive, case insensitive word search in all the files in directory - START
------------------------------------------------------------------------------
grep -r -i "mysql_\|call_user_method\|call_user_method_array\|define_syslog_variables\|dl(\|ereg\|ereg_replace\|eregi\|eregi_replace\|set_magic_quotes_runtime" --color /home/dharmeshp/php5.3/*

grep -r -i "session_register\|session_unregister\|session_is_registered\|set_socket_blocking\|split\|spliti\|sql_regcase\|is_dst parameter\|mktime" --color /home/dharmeshp/php5.3/*

grep -r -i "EBC" --color /data/longbow/catalog/imports/applications/20131203/221259/2819/*
grep -r -i "report_count_applications" --color /data/longbow/catalog/crond/missing_app.php

--> Example of excluding directory for search
grep -ir --exclude-dir=CVS "digitalriver.com" --color /bhhome/dpatel/echo_current/htdocs/clients/BlueHornet-CS/*
------------------------------------------------------------------------------
-- Recursive, case insensitive word search in all the files in directory - END
------------------------------------------------------------------------------

scp /data/scripts/UC_propagation_wag/hotcopy/LONGBOW_msv_snap.gz dpatel@10.127.81.198:/data/unified_snapshot
scp /data/scripts/UC_propagation_wag/hotcopy/LONGBOW_products_snap.gz dpatel@10.127.81.198:/data/unified_snapshot

tar -zxf LONGBOW_products_snap.gz
tar -zxf LONGBOW_msv_snap.gz
[ -d /data/mysql/LONGBOW_msv ] && sudo mv /data/mysql/LONGBOW_msv /data/mysql/LONGBOW_msv20130621 ; 
sudo mv /data/unified_snapshot/LONGBOW_msv_snap /data/mysql/LONGBOW_msv;


sudo mv /data/mysql/LONGBOW_products /data/mysql/LONGBOW_products20130621  ;
sudo mv /data/unified_snapshot/LONGBOW_products_merged_latest /data/mysql/LONGBOW_products;

cp -r /data/unified_snapshot/LONGBOW_products_snap /data/unified_snapshot/LONGBOW_products

------------
-- Command to display directory name only
-----------
du -chs `ll | grep ^d | awk '{print $9}'` - Gives disk usage

du -chs `ll | grep ^d | awk '{print $9}'`

----------------
-- Command to replace string in file
----------------
sed -i 's/dpatel/kmist/g' echo_domain.php

----------------
-- Command to print environment variable
----------------
printenv

----------------
-- Command to find how long process is running
----------------
http://unix.stackexchange.com/questions/7870/how-to-check-how-long-a-process-has-been-running

--------------------------------
-- Command to pull log records between two given datetimestamp
--------------------------------
awk '$0>=from&&$0<=to' from="[21-Jan-2016 14:14:59" to="[21-Jan-2016 14:45:59" phperror_log
awk '$0>=from&&$0<=to' from="Thu, 21 Jan 2016 14:14:59" to="Thu, 21 Jan 2016 14:45:59" link-tracking.log


---------
-- Apache server
---------
ps -ef | grep apache
/opt/apache/httpd-2.4.16-2015-08-15/conf/
cat httpd.conf
cat httpd-vhosts.conf

sftp -P 2222 bhdev@sftp.bluehornet.com:/MagentoCybage/ 
Password: Nuu,zuu0

scp /shared/static_htdocs/ivivva/00997/* dpatel@dc4bhjh01.bluehornet.digitalriver.com:/tmp
scp /tmp/00997/* dpatel@dc4bhappdev01.bluehornet.digitalriver.com:/bhhome/dpatel/echo_current/htdocs/static/ivivva/00997/

sftp -P 2222 AllenEdmonds_FTP@sftp.bluehornet.com:/Message_level_exports
tar cvzf Message_level_details_2016-01-01_2016-05-10.tar.gz Message_level_details_2016-01-01_2016-05-10.csv;

----------------
-- REplace first line in file
----------------
sed -i '1s/^/email\n/' old.txt > new.txt