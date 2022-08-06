select *
from supermarket.`supermarket_sales - Sheet1`;

/*
Branch A is in Yangon, Branch B is in Naypyitaw and Branch C is in Mandalay.
Naypyitaw, Mandalay and Yangon are all located in Myanmar.

*/

-- Which gender frequent more the supermarket?
select gender, count(*)
from supermarket.`supermarket_sales - Sheet1`
group by gender;
-- All about the same

-- And in each branch?
select city, gender, count(*) as cnt_gender
from supermarket.`supermarket_sales - Sheet1`
group by city, gender
order by city;
/*
    Branch B in Naypyitaw has 328 costumers in which 178 (54,3%) are Female and 150 Male (45,7%).
    There are more almost 10% more Female costumers.
    Since its a interesting difference, let's dig in.
*/

-- Which product_line generate more revenue in Naypyitaw?
select product_line, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where city = 'Naypyitaw'
group by product_line
order by sum(total) desc;
-- Food and beverages is the product_line with most revenue and Home and lifestyle the least revenue.

-- Is there any difference in costumer gender and product_line?
select product_line, gender, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where city = 'Naypyitaw'
group by product_line, gender
order by product_line;

/*
    It seems that 'Food and beverages' and 'Sports and travel' are most consumed by Female.
    While 'Health and Beauty' consumed most by Males.
    How this compare to other branches/cities?
*/

select product_line, gender, city, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Food and beverages'
group by city, gender
order by city;

select product_line, gender, city, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by city, gender
order by city;

select product_line, gender, city, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Health and Beauty'
group by city, gender
order by city;

/*
    For 'Food and beverages' the trend is the same in Mandalay and Naypyitaw but inverse in Yangon.
    For 'Sports and travel' it seems that is a unique feature of Naypyitaw.
    For 'Health and Beauty' it seems that Naypyitaw is the inverse of Mandalay. In Yangon male and female consume about the same amount.

    So far, Naypyitaw is the city with more female costumers and they are consuming a lot of 'Sports and travel' products.

*/

-- Which product_line that generate more revenue in all branches?

select product_line, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
group by product_line
order by sum(total) desc;

-- Which gender spend most on each product line?
select product_line, gender, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
group by product_line, gender
order by product_line,gender;

/*
    It seems that 'Food and beverages' is the most profitable product line in general.
    So, nothing new being the best product_line in Naypyitaw. Home and lifestyle is also pretty low.
    Interestingly, 'Sports and travel' is the 2nd best product_line in general but the second worst in Naypyitaw.
    How 'Sports and travel' are performing in each branch?
*/

select product_line, city, sum(round(total)) as total
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by product_line, city;

/*
    Naypyitaw is doing really bad in 'Sports and travel'.

    Facts so far:
    - Naypyitaw is the city with 10% more female customers than male customers.
    - While Man consume more 'Sports and travel' products in other branches. In Naypyitaw, Females are consuming more 'Sports and travel' products.


    For some reason 'Sports and travel' are not performing well there.
    Maybe is happening not because of the high number of female costumers, but low number of male costumers?
    How number of costumers compare in each branch/city?
*/

select city, count(*) as cnt
from supermarket.`supermarket_sales - Sheet1`
group by city
order by city;


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
    quantitu sold is different?

    Gross Income is expected to be the same since the branch is performing bad with this product_line.

*/

-- Tax, Gross Margin Percent and Gross Income
select city, sum(quantity) as quantity, avg(tax) as tax, sum(round(gross_income)) as gross_income, avg(gross_margin_pct) as gross_percent
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by city;


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
select city, sum(round(unit_price)) as total
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by city;

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

select city, payment, count(payment) as cnt
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by city, payment
order by city;


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

select city, gender, payment, count(payment) as cnt
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel' and payment = 'Credit card'
group by city, gender
order by city, gender;

/*
    It seems that gender its not really a factor in this.
*/

select city, customer_type, payment, count(payment) as cnt
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel' and payment = 'Credit card'
group by city, customer_type
order by city, customer_type;

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

select city, customer_type, count(customer_type) as cnt
from supermarket.`supermarket_sales - Sheet1`
where product_line = 'Sports and travel'
group by city, customer_type
order by city, customer_type;

/*
    Another evidence. Every branch has similar number os members and normal customers, except for Naypyitaw that has a lot more members.

    Conclusions and Recommendations:
    - Marketing campaign for 'Sports and travel' products towards male customers in Naypyitaw. Its the only branch with this pattern.
    - Research why price of each product is lower in Naypyitaw. Are prices standard across branches? If so, it might be the kind of product in 'Sports and travel' that are being sold in this branch. Need more data. Also, Its this related to why Female customers are consuming more 'Sports and travel' products?
    - Members are responsible for low revenue in 'Sports and travel' products on this branch due to use of credit card as payment method. It might be interesting to brainstorm ways of increasing revenue.

*/

