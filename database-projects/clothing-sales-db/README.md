# Clothing Sales Database

A SQL Server database for a clothing wholesaler: products with colour, size and category, suppliers, warehouses, purchasing, inventory, sales, delivery, staff and users. [`clothing-sales.sql`](clothing-sales.sql) creates the 10 tables, loads sample data and adds the views, stored procedures and triggers below.


## Database Structure

### Main Tables

| Table | Description |
|-------|-------------|
| `ck_info` | Warehouse information (ID, Name, Backup) |
| `g_info` | Supplier information (ID, Name, Address, Contact Info, Bank Info) |
| `goods` | Product information (ID, Name, Colour, Category, Price, Manufacturer) |
| `jh_info` | Purchase information (Purchase ID, Date, Supplier, Warehouse, Product, Quantity, Total) |
| `kc_info` | Inventory information (Entry ID, Warehouse, Product, Quantity, Total, Backup) |
| `kh_info` | Customer information (ID, Name, Contact Info, Bank Account) |
| `outs` | Delivery information (Delivery ID, Customer, Warehouse, Product, Quantity, Total) |
| `sell` | Sales information (Sales ID, Customer, Warehouse, Product, Quantity, Total, Payment Status) |
| `user` | User information (Username, Password, Permission) |
| `ywy_info` | Employee information (ID, Name, Gender, Contact Info) |


### Sample Data
**Warehouse examples:**
```
0001 - Warehouse One
0002 - Warehouse Two
```

**Product examples:**
```
1001 - Hoodie (Grey, S, Purchase Price: 20, Wholesale Price: 50, Retail Price: 80)
1002 - Trench Coat (Black, L, Purchase Price: 30, Wholesale Price: 50, Retail Price: 90)
```

**Supplier examples:**
```
00001 - East, Zhejiang Jiaxing
00002 - South, Zhejiang Haining
```




## Features

### Views
- `view_g_info`: Supplier & inventory product association  
- `view_kc_info`: Inventory with backup records  
- `view_ck_info`: Products with unit price > 30 and warehouse info  
- `view_kh_info`: Customer & sales product association (unit price > 30)  
- `view_out`: Warehouse & delivery association  

### Stored Procedures
- `up_g_info`: Query supplier info by supplier ID  
- `up_goods`: Query product info by product ID  
- `up_goods1`: Query detailed product info; if not exist, show message  

### Triggers
- `jh_info_delete`: `AFTER DELETE` on purchase records, prints a confirmation  
- `g_info_insert`: Print welcome message when inserting a new supplier  
- `goods_update`: Show old and new purchase price when updating product  
- `ck_info_instead`: `INSTEAD OF UPDATE, DELETE` on warehouses, so warehouse records cannot be changed or removed  

### Constraints
- `ck_sell`: Sales table unit price between 30 and 200  
- `good_info`: Product purchase price must be greater than 0  

### Multi-table Queries Examples
- Join `goods` and `sell` to show product sales info  
- Join `kh_info` and `sell` to show customer sales info  
- Query employees with names starting with "Me"  

## Stack

SQL Server, T-SQL
