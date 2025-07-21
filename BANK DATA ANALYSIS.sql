create database mybank;
use mybank;

-- Retrieve all table data
select * from customer;
select * from accounts;
select * from transactions;
select * from loans;
select * from creditcards;
select * from branches;
select * from atms;

-- calculate total number of customers
select count(*) as TotalCustomers from customer;

-- calculate total number of accounts
select count(*) as TotalAccounts from accounts;

-- calculate total loan amount
select sum(Amount) as TotalLoanAmount from Loans;

-- calculate total credit limit across all credit cards
select sum(creditlimit) as TotalCreditLimit from creditcards;

-- Find all active accounts
select * from accounts where status='Active';

-- Final all c=accounts made on 15th Jan 2023
select * from transactions where transactiondate > '2023-01-15';

-- Final loans with interest rates above 5.0
select * from loans where InterestRate>5.0;

-- Final credit cards with balances exceeding the credit limit
select * from creditcards where balance > creditlimit;

-- JOIN QUERIES
-- Retrive customer details along with their accounts
select c.customerid,c.name,c.age,a.accountnumber,a.accounttype,a.balance
from customer c
join accounts a on c.customerid=a.customerid;

-- retrive transaction details along with associated account and customer information
select t.transactionid,t.transactiondate,t.amount,t.type,t.description,
a.accountnumber,a.accounttype,c.name as customername
from transactions t
join accounts a on t.accountnumber=a.accountnumber
join customer c on a.customerid=c.customerid;

-- Top 10 Customers with highest loan amount
select c.name,l.amount as loanamount
from customer c
join loans l on c.customerid=l.customerid
order by l.amount desc
limit 10;

-- delect inactive accounts
set sql_safe_updates=0;
delete from accounts
where status='Inactive';

-- find customers with multiple accounts
select c.customerid,c.name,count(a.accountnumber) as numaccounts
from customer c
join accounts a on c.customerid=a.customerid
group by c.customerid,c.name
having count(a.accountnumber) > 1;

-- Print the first 3 characters of name from customers table
select substring(name,1,3) as FirstThreeCharactersOfName
from customer;

-- Print the name from customers table into two columns FirstName and LastName
select
substring_index(name,' ',1) as FirstName,
substring_index(name,' ',-1) as LastName
from customer;

-- SQL query to show only odd rows from cutsomers table
select * from customer
where mod(customerid,2) <> 0;

-- SQL query to list customerid where account is inactive
select customerid
from accounts
where status='Inactive';

-- SQL query to fetch the first row of the customers table
select * from customer
limit 1;

-- SQL query to show the current date and time
select now() as currentdatetime;

-- Sql query to create a new table which consits of data and structure copied from the customers
create table CustomersClone like Customer;
insert into CustomersClone select * from customer;

-- SQL query to calculate how many days are remaining for customers to pay off the loans
select 
customerid,Datediff(Enddate,curdate()) as daysremaining
from loans where enddate>curdate();

-- Query to find the latest transaction date for each other
select AccountNumber,MAX(TransactionDate) as LatestTransactionDate
from transactions
group by AccountNumber;

-- Find the average age of customers
select AVG(age) as AverageAge
from Customer;

-- Find accounts with less than minimum amount for accounts opened 1st Jan 2022
select AccountNumber,Balance
from Accounts
where balance < 25000
and opendate <='2022-01-01';

-- Find loans that are currently active
select * from loans
where enddate >= curdate()
and status='Active';

-- Find the total amount of transactions for each account for a specific month
select AccountNumber,sum(amount) as TotalAmount
from transactions
where month(TransactionDate)=6
and year(TransactionDate)=2023
group by AccountNumber;

-- Find the average credit card balance for each customer
select CustomerID,avg(Balance) as AverageCreditCardBalance
from CreditCards
group by CustomerID;

-- Find the number of Inactive ATMS per location
select location , count(*) as NumberOfActiveATMs
from atms
where status='Out Of Service'
group by location;

-- Categorize customers into three age groups
select name,age,
case 
when age < 30 then 'Below 30'
when age between 30 and 60 then '30 to 60'
else 'Above 60'
end as age_group
from customer;

-- SQL query to determine the 5th highest loan amount without using 'limit' keyword
select distinct amount
from loans L1
where 5 = (
           select count(distinct amount)
           from loans L2
           where L2.Amount>=L1.Amount
           );
           
-- Sql query to show the second highest loan from the loans table using sub-query
select max(amount) as SecondHighestLoan
from loans
where amount <(select max(Amount)
from loans);
