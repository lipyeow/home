load data
infile 'prod.csv' "str '\n'"
replace into table product
fields terminated by ',' optionally enclosed by '"'
(maker char(8),
 model char(8),
 type char(8))
