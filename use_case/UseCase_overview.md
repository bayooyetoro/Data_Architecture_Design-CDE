# Fufu Republic Dimensional Model Design

## 1. Business Process: Order Processing

The **Order Processing** business process tracks customer orders across branches. It captures details such as the items ordered, payment methods, and customer behavior. This data helps answer critical business questions related to sales, popular items, and customer spending habits.

## 2. Business Questions

Key questions that the dimensional model helps answer:
- **Sales Analysis**: What are the total sales by branch, menu item, and payment method?
- **Customer Analysis**: Who are the top spending customers, and what items do they frequently buy?
- **Product Popularity**: Which menu items are the best-sellers, and in which branches?
- **Payment Methods**: What is the distribution of payment methods (cash, card, online)?
- **Temporal Analysis**: What are the sales trends by day, week, or month?

## 3. Grain

The **grain** of this fact table is an **individual line item of an order**. Each record represents an item ordered, providing a highly detailed view of sales transactions.

### Model Overview
![ModelDesign](use_case/model.png)

## 4. Dimensions

The model includes the following **dimensions**:

### 4.1 Date Dimension
Captures the time of the order.

- Attributes:
  - `date_id`: Primary key
  - `day`
  - `week`
  - `month`
  - `year`
  - `day_of_week`

### 4.2 Branch Dimension
Details about the restaurant branches.

- Attributes:
  - `branch_id`: Primary key
  - `branch_name`
  - `location`

### 4.3 Customer Dimension
Contains customer details for analyzing customer behavior.

- Attributes:
  - `customer_id`: Primary key
  - `customer_name`
  - `email`
  - `phone`
  - `address`

### 4.4 Menu Item Dimension
Information about the menu items being ordered.

- Attributes:
  - `menu_item_id`: Primary key
  - `menu_item_name`
  - `description`
  - `price`

### 4.5 Payment Method Dimension
Captures how the order was paid for.

- Attributes:
  - `payment_method_id`: Primary key
  - `payment_method_name`: (cash, card, online)

### 4.6 Promotion Dimension
Tracks any promotions applied to the order.

- Attributes:
  - `promotion_id`: Primary key
  - `promotion_name`
  - `discount_percentage`

## 5. Fact Table: Order Line Item Fact

The **fact table** records every ordered item with the following metrics:

- **Grain**: Each row represents an individual item in an order.
- **Foreign Keys**:
  - `date_id` (links to Date Dimension)
  - `branch_id` (links to Branch Dimension)
  - `customer_id` (links to Customer Dimension)
  - `menu_item_id` (links to Menu Item Dimension)
  - `payment_method_id` (links to Payment Method Dimension)
  - `promotion_id` (links to Promotion Dimension)
  
### 5.1 Measures (Facts)
- `quantity_sold`: Number of items ordered.
- `total_price`: Price for this item in the order.
- `discount_amount`: Discount applied from promotions (if any).
- `net_sales`: Final amount after discount.

### 5.2 Example of Fact Table

| date_id | branch_id | customer_id | menu_item_id | payment_method_id | promotion_id | quantity_sold | total_price | discount_amount | net_sales |
|---------|-----------|-------------|--------------|-------------------|--------------|---------------|-------------|-----------------|-----------|
| 20240101| 1         | 101         | 3            | 2                 | NULL         | 2             | 5000.00     | 0               | 5000.00
