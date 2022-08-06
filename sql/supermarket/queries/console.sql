select *
from supermarket.`supermarket_sales - Sheet1`;

/*
Branch A is in Yangon, Branch B is in Naypyitaw and Branch C is in Mandalay.
Naypyitaw, Mandalay and Yangon are all located in Myanmar.

*/

-- Which gender frequent more the supermarket?
SELECT gender, COUNT(*) AS count
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY gender;
-- All about the same

-- And in each branch?
SELECT city,
       gender,
       COUNT(gender)                                                                   AS cnt_gender,
       ROUND((COUNT(gender) * 100) / (SUM(COUNT(gender)) OVER (PARTITION BY city)), 1) AS pct
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY city, gender
ORDER BY city;
/*
    Branch B in Naypyitaw has 328 costumers in which 178 (54,3%) are Female and 150 Male (45,7%).
    There are almost 10% more Female costumers.
    Since its a interesting difference, let's dig in.
*/

-- Which product_line generate more revenue in Naypyitaw?
SELECT product_line, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE city = 'Naypyitaw'
GROUP BY product_line
ORDER BY SUM(total) DESC;
-- 'Food and beverages' is the product_line with most revenue and 'Home and lifestyle' the least revenue.

-- Is there any difference in costumer gender and product_line?
SELECT product_line, gender, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE city = 'Naypyitaw'
GROUP BY product_line, gender
ORDER BY product_line;

/*
    It seems that 'Food and beverages' and 'Sports and travel' are most consumed by Female.
    While 'Health and Beauty' consumed most by Males.
    How this compare to other branches/cities?
*/

SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Food and beverages'
GROUP BY city, gender
ORDER BY city;

SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city, gender
ORDER BY city;

SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Health and Beauty'
GROUP BY city, gender
ORDER BY city;

/*
    For 'Food and beverages' the trend is the same in Mandalay and Naypyitaw but inverse in Yangon.
    For 'Sports and travel' it seems that is a unique feature of Naypyitaw.
    For 'Health and Beauty' it seems that Naypyitaw is the inverse of Mandalay. In Yangon male and female consume about the same amount.

    So far, Naypyitaw is the city with more female costumers and they are consuming a lot of 'Sports and travel' products.

*/

-- Which product_line that generate more revenue in all branches?

SELECT product_line, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY product_line
ORDER BY SUM(total) DESC;

-- Which gender spend most on each product line?
SELECT product_line, gender, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY product_line, gender
ORDER BY product_line, gender;

/*
    It seems that 'Food and beverages' is the most profitable product line in general.
    So, nothing new being the best product_line in Naypyitaw. Home and lifestyle is also pretty low.
    Interestingly, 'Sports and travel' is the 2nd best product_line in general but the second worst in Naypyitaw.
    How 'Sports and travel' are performing in each branch?
*/

SELECT product_line, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY product_line, city;

/*
    Naypyitaw is doing really bad in 'Sports and travel'.

    Facts so far:
    - Naypyitaw is the city with 10% more female customers than male customers.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.


    For some reason 'Sports and travel' are not performing well there.
    Maybe is happening not because of the high number of female costumers, but low number of male costumers?
    How number of costumers compare in each branch/city?
*/

SELECT city, COUNT(*) AS cnt
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY city
ORDER BY city;


/*
    They are about the same. It seems that number of costumers are not a relevant factor for this difference.
    Then, why 'Sports and travel' products are performing poorly in this branch?

    This is interesting to investigate.
    Let's broaden our vision and take a look at other factors that might be contributing for this.
*/

select *
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel';

/*
    Besides number of costumers and gender, we have other factors that we can dig in.
    They are:
    customer_type, is there any particular thing about this branch?
    unit_price, are the branches selling the same product?
    tax, different legislation?
    payment could be influencing?
    gross_margin_pct, branches have the same margin percentage?
    quantity sold is different?

    Gross Income is expected to be the same since the branch is performing bad with this product_line.

*/

-- Tax, Gross Margin Percent and Gross Income
SELECT city,
       SUM(quantity)            AS quantity,
       AVG(tax)                 AS tax,
       SUM(ROUND(gross_income)) AS gross_income,
       AVG(gross_margin_pct)    AS gross_percent
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city;


/*
    So, Gross Margin Percent is relative similar between branches.
    Naypyitaw branch is selling less quantity of 'Sports and travel' products.
    Naypyitaw branch is paying more taxes although the tax is 5% at all branches.
    But still, 1% difference in taxes does not explain 20% difference in gross income.
    And how this branch is paying more taxes while selling less products?


    Facts so far:
    - Naypyitaw is the city with 10% more female costumers than male costumer.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.
    - Naypyitaw branch is selling less quantity of 'Sports and travel' products.
    - Tax amount paid in Naypyitaw are higher than in other branches.

*/


-- Unit Price
SELECT city, SUM(ROUND(unit_price)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city;

/*
    That's interesting. There is a difference between 24% and 33% in unit price.

    Facts so far:
    - Naypyitaw is the city with 10% more female customers than male customers.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.
    - Naypyitaw branch is selling less quantity of 'Sports and travel' products.
    - Tax amount paid in Naypyitaw are higher than in other branches.
    - Price of each product in Naypyitaw is 24% to 33% lower.

    It's a bit contradicting that Naypyitaw has lower price for each product and lower quantity but is paying higher tax amount.
    Is it due to payment type difference?
*/

SELECT city, payment, COUNT(payment) AS cnt
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city, payment
ORDER BY city;


/*
    Naypyitaw costumers are using more credit card than other payment methods.

    Facts so far:
    - Naypyitaw is the city with 10% more female customers than male customers.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.
    - Naypyitaw branch is selling less quantity of 'Sports and travel' products.
    - Tax amount paid in Naypyitaw are higher than in other branches.
    - Price of each product in Naypyitaw is 24% to 33% lower.
    - Credit Card is the most used payment method in Naypyitaw. Other branches have Cash and Ewallet as most used payment method.

    This last piece of evidence probably explains the contradiction between lower price for each product and higher tax amount.
    Does female costumers consume using more credit card?
*/

SELECT city, gender, payment, COUNT(payment) AS cnt
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
  AND payment = 'Credit card'
GROUP BY city, gender
ORDER BY city, gender;

/*
    It seems that gender its not really a factor in this.
*/

SELECT city, customer_type, payment, COUNT(payment) AS cnt
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
  AND payment = 'Credit card'
GROUP BY city, customer_type
ORDER BY city, customer_type;

/*
    We found another piece of evidence.
    Members pay using Credit Card.

    Facts so far:
    - Naypyitaw is the city with 10% more female customers than male customers.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.
    - Naypyitaw branch is selling less quantity of 'Sports and travel' products.
    - Tax amount paid in Naypyitaw are higher than in other branches.
    - Price of each product in Naypyitaw is 24% to 33% lower.
    - Credit Card is the most used payment method in Naypyitaw. Other branches have Cash and Ewallet as most used payment method.
    - Members pay using more Credit Card in all branches.

    Does this branch have more members?

*/

SELECT city, customer_type, COUNT(customer_type) AS cnt
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city, customer_type
ORDER BY city, customer_type;

/*
    Another evidence. Every branch has similar number os members and normal customers, except for Naypyitaw that has a lot more members.

    Conclusions and Recommendations:
    - Marketing campaign for 'Sports and travel' products towards male customers in Naypyitaw. Its the only branch with this pattern.
    - Research why price of each product is lower in Naypyitaw. Are prices standard across branches? If so, it might be the kind of product in 'Sports and travel' that are being sold in this branch. Need more data. Also, Its this related to why Female customers are consuming more 'Sports and travel' products?
    - Members are responsible for low revenue in 'Sports and travel' products on this branch due to use of credit card as payment method. It might be interesting to brainstorm ways of increasing revenue.

*/

