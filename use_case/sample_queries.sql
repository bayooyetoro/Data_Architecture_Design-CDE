
/****** TOP SALES BY BRANCH AND DATE ******/
SELECT d.year, d.month, b.branch_name, SUM(f.net_sales) AS total_sales
FROM Order_Line_Item_Fact f
JOIN Date_Dimension d ON f.date_id = d.date_id
JOIN Branch_Dimension b ON f.branch_id = b.branch_id
GROUP BY d.year, d.month, b.branch_name;


/*** TOP SELLING MENU ITEM ***/
SELECT m.menu_item_name, SUM(f.quantity_sold) AS total_quantity
FROM Order_Line_Item_Fact f
JOIN Menu_Item_Dimension m ON f.menu_item_id = m.menu_item_id
GROUP BY m.menu_item_name
ORDER BY total_quantity DESC;


/**** REVENUE BY PAYMENT METHOD ****/
SELECT p.payment_method_name, SUM(f.net_sales) AS total_revenue
FROM Order_Line_Item_Fact f
JOIN Payment_Method_Dimension p ON f.payment_method_id = p.payment_method_id
GROUP BY p.payment_method_name;