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
select gender, count(*)
from supermarket.`supermarket_sales - Sheet1`
group by gender;
```
