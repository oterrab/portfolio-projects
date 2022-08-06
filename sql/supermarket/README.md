# 🍉 Supermarket Sales

[Dataset](https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales)

## 📌 Context on this Job Interview

The growth of supermarkets in most populated cities are increasing and market competitions are also high. The dataset is one of the historical sales of supermarket company which has recorded in 3 different branches for 3 months data. 

  - Branch A is in Yangon. 
  - Branch B is in Naypyitaw.
  - Branch C is in Mandalay.

Naypyitaw, Mandalay and Yangon are all located in Myanmar.


### Which gender frequent more the supermarket?

```sql
SELECT gender, COUNT(*) AS count
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY gender;
```
<br/>
<p align='center'><img width="261" alt="Screen Shot 2022-08-06 at 11 50 05" src="https://user-images.githubusercontent.com/59098085/183254107-2daf80b4-9afc-46cd-ba04-44bb3933029b.png"></p>

<br/>
<p align='center'><strong>All about the same</strong></p>
<br/>

### And in each branch?

```sql
SELECT city,
       gender,
       COUNT(gender)                                                                   AS cnt_gender,
       ROUND((COUNT(gender) * 100) / (SUM(COUNT(gender)) OVER (PARTITION BY city)), 1) AS pct
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY city, gender
ORDER BY city;
```

<br/>
<p align='center'><img width="505" alt="Screen Shot 2022-08-06 at 12 07 24" src="https://user-images.githubusercontent.com/59098085/183254813-db9ae47d-b50b-4930-b424-555b598e5cd8.png"></p>

<br/>
<p align='center'><strong>Branch B in Naypyitaw has 328 costumers in which 178 (54,3%) are Female and 150 Male (45,7%).<br/>
    There are almost 10% more Female costumers.<br/>
    Since its a interesting difference, let's dig in.</strong></p>
<br/>

### Which product_line generate more revenue in Naypyitaw?

```sql
SELECT product_line, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE city = 'Naypyitaw'
GROUP BY product_line
ORDER BY SUM(total) DESC;
```

<br/>
<p align='center'><img width="370" alt="Screen Shot 2022-08-06 at 12 09 46" src="https://user-images.githubusercontent.com/59098085/183254897-88e5a314-21d4-46dc-a0bd-0e8fa5776bce.png"></p>

<br/>
<p align='center'><strong><sup>'Food and beverages'</sup> is the product_line with most total revenue and <sup>'Home and lifestyle'</sup> is the product_line with least total revenue.</strong></p>
<br/>

### Is there any difference in costumer gender and product_line in Naypyitaw?

```sql
SELECT product_line, gender, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE city = 'Naypyitaw'
GROUP BY product_line, gender
ORDER BY product_line;
```

<br/>
<p align='center'><img width="495" alt="Screen Shot 2022-08-06 at 12 11 35" src="https://user-images.githubusercontent.com/59098085/183254957-54bb4088-8225-437a-ab92-6e3049bc8017.png"></p>

<br/>
<p align='center'><strong>It seems that <sup>'Food and beverages'</sup> and <sup>'Sports and travel'</sup> are most consumed by Female.<br/>
    While <sup>'Health and Beauty'</sup> consumed most by Males.</strong></p>
<br/>

### How this compare to other branches/cities?

<p align='center'><strong>'Food and beverages'</strong></p>

```sql
SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Food and beverages'
GROUP BY city, gender
ORDER BY city;
```

<br/>
<p align='center'><img width="365" alt="Screen Shot 2022-08-06 at 12 26 37" src="https://user-images.githubusercontent.com/59098085/183255477-e468f0b3-1ee6-404e-a58e-68a79b16460d.png"></p>

<br/>
<p align='center'><strong>'Sports and travel'</strong></p>

```sql
SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY city, gender
ORDER BY city;
```

<br/>
<p align='center'><img width="364" alt="Screen Shot 2022-08-06 at 12 29 05" src="https://user-images.githubusercontent.com/59098085/183255547-796e3141-1483-4600-bc7e-d498d78af4c6.png"></p>

<br/>
<p align='center'><strong>'Health and Beauty'</strong></p>

```sql
SELECT gender, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Health and Beauty'
GROUP BY city, gender
ORDER BY city;
```

<br/>
<p align='center'><img width="363" alt="Screen Shot 2022-08-06 at 12 30 10" src="https://user-images.githubusercontent.com/59098085/183255576-209db414-ecc3-437d-bce5-c4de2991f894.png"></p>

<br/>

<br/>
<p align='center'><strong>For <sup>'Food and beverages'</sup> the trend is the same in Mandalay and Naypyitaw but inverse in Yangon.<br/>
    For <sup>'Sports and travel'</sup> it seems that being the most product line consumed by Female is a unique feature of Naypyitaw.<br/>
    For <sup>'Health and Beauty'</sup> it seems that Naypyitaw is the inverse of Mandalay. While in Yangon male and female consume about the same amount.<br/>
<br/>
    So far, Naypyitaw is the city with more female costumers and they are consuming a lot of <sup>'Sports and travel'</sup> products.<br/>
<br/></p>
<br/>


### Which product_line that generate more revenue in all branches?

```sql
SELECT product_line, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY product_line
ORDER BY SUM(total) DESC;
```

<br/>
<p align='center'><img width="368" alt="Screen Shot 2022-08-06 at 12 35 53" src="https://user-images.githubusercontent.com/59098085/183255801-609fcec9-25e1-480b-85ef-15c206141317.png"></p>

<br/>

### Which gender spend most on each product line?

```sql
SELECT product_line, gender, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
GROUP BY product_line, gender
ORDER BY product_line, gender;
```

<br/>
<p align='center'><img width="497" alt="Screen Shot 2022-08-06 at 12 37 05" src="https://user-images.githubusercontent.com/59098085/183255842-70761d48-8d93-43ec-ac5e-225b201c00e6.png"></p>
<br/>

<br/>
<p align='center'><strong>It seems that <sup>'Health and Beauty'</sup> is the most profitable product line in general.<br/>
    So, nothing new being the best product_line in Naypyitaw. Home and lifestyle is also pretty low.<br/>
    Interestingly, <sup>'Sports and travel'</sup> is the 2nd best product_line in general but the second worst in Naypyitaw.</p>
<br/>

### How <sup>'Sports and travel'</sup> are performing in each branch?

```sql
SELECT product_line, city, SUM(ROUND(total)) AS total
FROM supermarket.`supermarket_sales - Sheet1`
WHERE product_line = 'Sports and travel'
GROUP BY product_line, city;
```

<br/>
<p align='center'><img width="470" alt="Screen Shot 2022-08-06 at 12 41 45" src="https://user-images.githubusercontent.com/59098085/183256003-1cb1b2ba-ec69-4a4f-a55f-1fb9690fac5c.png"></p>
<br/>

