# 🏦 MyBank Database Management Project

A comprehensive SQL-based project simulating a banking database system for managing **customers**, **accounts**, **transactions**, **loans**, **credit cards**, **branches**, and **ATMs**.

## 📚 About the Project

This project demonstrates essential operations for a banking system using **MySQL**, including:

- Database and table creation
- Data manipulation (CRUD)
- Data aggregation and reporting
- Joining multiple tables
- Advanced SQL features like subqueries, string manipulation, and date functions

## 🛠️ Technologies Used

- **MySQL** (Tested on MySQL 8.x)
- MySQL Workbench (for query execution and database management)

## 📁 Project Structure

```

mybank-database/
├── mybank.sql          # SQL script to create and query the database
└── README.md           # Project overview and documentation

````

## 🧾 Features & SQL Operations

### 🔹 Table Operations

- Retrieve all records from: `customer`, `accounts`, `transactions`, `loans`, `creditcards`, `branches`, `atms`
- Clone table structure and data (`CustomersClone`)

### 🔹 Aggregations & Calculations

- Total customers, accounts, loans, credit limits
- Average age of customers
- Number of inactive ATMs by location
- Days remaining for loan repayment

### 🔹 Filtering & Conditions

- Active accounts and active loans
- Credit cards with exceeded balances
- Transactions for a specific date/month
- Accounts below a certain balance

### 🔹 Joins

- Customers with their accounts
- Transactions joined with account and customer info
- Top 10 customers with highest loans

### 🔹 String & Date Functions

- Extract first/last names from full name
- Show first 3 characters of customer names
- Current date and time
- Subqueries for second and fifth highest loans

### 🔹 Data Modification

- Deleting inactive accounts
- Creating customer clones
- Counting customers with multiple accounts

## 📦 How to Use

1. Clone the repository or download the `.sql` file:
   ```bash
   git clone https://github.com/your-username/mybank-database.git
````

2. Open MySQL Workbench or any MySQL client.

3. Execute the SQL script:

   ```sql
   source path/to/mybank.sql;
   ```

4. Explore the database with the included queries.

## 🚀 Future Enhancements

* Add stored procedures and triggers
* Implement user roles and permissions
* Include data for branches and ATM locations
* Create views for regular reports

## 🧑‍💻 Author

**Pallu** (Prachi Janglekar)
📫 [GitHub Profile](https://github.com/your-username)

---

