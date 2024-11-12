**MySQL Database System Design for a Stock Exchange Market **

**Introduction**

A stock exchange market is a complex and fast-paced environment where stocks are traded, and
prices fluctuate rapidly. To effectively manage the vast amount of data generated by such a
market, a robust and well-designed database system is essential. This database serves as the
backbone of the stock exchange market, facilitating the storage, organization, and retrieval of
critical information. The database is designed to capture and manage various entities that play
significant roles in the stock exchange market. These entities include stocks, prices, clients,
transactions, price History, Client Portfolio and account. Each entity has specific attributes that
provide valuable insights and support the seamless operation of the market. The stocks table
stores information about the available stocks. It maintains unique identifiers and corresponding
names for each stock, enabling accurate identification and categorization. The prices table tracks
the historical prices of each stock, allowing for analysis of price trends and patterns over time. It
maintains a record of the stock's identifier, the price at a given point in time, and the
corresponding date and time. To preserve a historical record of stock prices, the PriceHistory
table stores past price information of stocks. Clients, as essential participants in the stock
exchange market, are stored in the clients table. Each client has a unique identifier and a name,
enabling efficient identification and personalization of services. The client portfolio table
establishes the relationship between clients and stocks. It records the number of shares a client
holds for a particular stock, as well as the cost associated with those shares. This information
allows for accurate portfolio management and investment analysis.
The account table keeps track of each client's current balance to ensure accurate accounting and
financial management. It is connected to the clients table through a foreign key, which ensures
precise tracking of each client's balances. The Transactions table records all stock-related
transactions within the stock exchange. A comprehensive database system that effectively
maintains the data related to stock exchange market activities is created by these tables and the
properties that make up each of them. Market participants may successfully maintain their
portfolios, receive fast and reliable information. The database system helps the stock exchange
market run smoothly and successfully by giving a strong foundation for data storage, retrieval,
and analysis. We will examine the specifics of the database design in the sections that follow,
outlining the tables, columns, and connections that make up this powerful database system for
the stock exchange market.

DATABASE DESIGN

The database system for a stock exchange market that records the history of all the prices of each stock and can be updated for a stock exchange market with several clients.

**Name of the Database: stock_exchange_market**

**Table: stocks**

Column Data Type Constraints
id INTEGER Primary Key
name VARCHAR (255) NOT NULL
Table: prices
Column Data Type Constraints
Price_id INTEGER Primary Key
stock_id INTEGER Foreign Key ([stocks.id](http://stocks.id/))
price DECIMAL NOT NULL
Date TIMESTAMP NOT NULL

**Table: clients**

Column Data Type Constraints
Client_id INTEGER Primary Key
Client_name VARCHAR(255) NOT NULL
Email VAECHAR(255)

**Table: accounts**

Column Data Type Constraints
account_Id INTEGER Primary Key
client_id INTEGER Foreign Key ([clients.id](http://clients.id/))
balance DECIMEL NOT NULL

**Table: Transactions**

Column Data Type Constraints
transaction_id INTEGER Primary Key
account_id INTEGER Foreign Key ([account.id](http://account.id/))
stock_id INTEGER Foreign Key ([stocks.id](http://stocks.id/))
quantity INTEGER NOT NULL
transaction_type DECIMAL NOT NULL
transaction_date VARCHAR(255) NOT NULL

**Table: PriceHistory**

Column Data Type Constraints
history_id INTEGER Primary Key
stock_id INTEGER Foreign Key ([stocks.id](http://stocks.id/))
Price DECIMAL NOT NULL
Date TIMESSAMP NOT NULL

**Table: ClientPortfolio**

Column Data Type Constraints
portfolio_id INTEGER Primary Key
client_id INTEGER Foreign Key ([clients.id](http://clients.id/))
stock_id INTEGER Foreign Key ([stocks.id](http://stocks.id/))
quantity INTEGER NOT NULL

**Stocks Table:**
The "Stocks" table, which acts as a repository for data regarding specific stocks, is in the center
of the schema. Each stock is given a distinct stock_id, enabling easy separation and
identification. The table also contains properties like stock_name, symbol, and sector in addition
to the stock_id. These characteristics offer crucial information about each stock, enabling
thorough research and categorization.

**Prices Table:**
The "Prices" table gathers essential pricing information for tracking the past prices of equities. A
distinct price_id is given to each price entry, making it simple to retrieve and refer to data. As a
foreign key, the stock_id property creates a connection to the Stocks table. The database also
contains properties like price and date, enabling accurate historical price tracking and analysis.
Investors can use this knowledge to make wise selections based on historical trends and
performance, which is vital information.

**Clients Table:**
Clients or investors are an essential component of the ecosystem at every stock exchange.
Important client data, such as client_id, client_name, and email, are recorded in the "Clients"
table. The primary key, client_id, ensures uniqueness and effective indexing. The stock market
may efficiently manage and identify its clientele by keeping client information in this table,
enabling smooth communication and individualized services.

**Accounts Table:**
The "Accounts" table keeps track of client account information to manage the financial aspects.
Each account is given a distinct account_id, making it simple to identify and manage. As a
foreign key, the client_id property creates a connection to the Clients table. The balance
property, which depicts the account's financial situation, is also included in the table. The
database enables precise monitoring of funds and acts as a framework for effective financial
transactions by connecting account balances with specific clients.

**Transactions Table:**
The "Transactions" table records all stock-related transactions within the stock exchange. Each
transaction is assigned a unique transaction_id, enabling straightforward retrieval and auditing.
The account_id and stock_id attributes establish relationships with the Accounts and Stocks
tables, respectively, ensuring data integrity. Additional attributes, such as quantity,
transaction_type, and transaction_date, provide granular details regarding the transaction,
facilitating comprehensive analysis and reporting.

**PriceHistory Table:**
To preserve a historical record of stock prices, the "PriceHistory" table stores past price
information. The table includes a unique history_id for each entry, facilitating easy referencing
and data retrieval. The stock_id attribute establishes a relationship with the Stocks table,
ensuring data consistency. The price and date attributes enable precise historical price analysis,
allowing for comparative evaluations and trend identification.

**ClientPortfolio Table:**
The "ClientPortfolio" table tracks the stocks owned by each client. Each portfolio entry is
assigned a unique portfolio_id, simplifying data management and retrieval. The client_id and
stock_id attributes establish relationships with the Clients and Stocks tables, respectively,
ensuring data integrity. The quantity attribute represents the number of stocks held by the client,
enabling real-time portfolio management and performance tracking.

**TRIGER TO STORE THE PREVIOUS PRICE IN THE HISTORY**
A trigger can be used to automatically store the previous price of a stock in the pricehistory table
whenever an update is made to the price column in the stocks table. Every time the price of a
stock is changed in the stocks table, this trigger will add a new row to the priceHistory table. The
stock ID, the previous price, the day and hour, and the new row will all be included.

**Functionality:**
The track_price_change trigger's primary job is to identify changes in stock prices and record the
prior values in the price history. The trigger is activated whenever the Prices table is updated. It
contrasts the previous price, which was accessed via the OLD keyword, with the current price.
The trigger then stores the earlier price in the price history database if the two values differ,
signifying a price change.

**Price History Storage:**
By adding a new entry to the "PriceHistory" table, the trigger makes it possible to store prior
prices. The columns in this table include stock_id, price, and date. The stock for which the price
has changed is identified by the stock_id. The trigger locates the pertinent stock by using the
NEW.stock_id value. The price column is updated with the previous price, which was obtained
from OLD.price. The date column also includes the timestamp of the previous price, which was
retrieved from OLD.date. This data is used to fill out the PriceHistory table, which keeps a
complete record of price changes.

**STORED PROCEDURE**
A key element of our stock exchange database that helps customers buy stocks is the BuyStock
stored procedure. It features a number of crucial features, such as texting and balance checks The role of the given stored procedure is detailed below

**Balance Check:**
The first step of the BuyStock process is to confirm the client's account balance to ensure a
smooth stock trading experience. The Accounts table's current account balance is retrieved, and
it is then put up against the entire price of the stock transaction in a comparison. The process
takes the proper action, such as returning an error message or rejecting the transaction, if the
balance is inadequate. By performing a balance check, you may protect yourself from any
financial hazards and stop customers from making purchases they can't afford.

**Transaction Record:**
The BuyStock function then moves on to construct a transaction record in the Transactions table
after the balance check is successfully completed. The account ID, stock ID, number of stocks
purchased, transaction type (specified as "Buy"), and transaction timestamp are all captured in
this record. The process guarantees openness, auditability, and correct reporting of all stock
trading activity by keeping a thorough transaction log.

**Portfolio Update:**
The ClientPortfolio table is updated by the BuyStock procedure in addition to the transaction
record. The equities that each client owns are listed in this table. A new entry, showing the
client's ownership of the purchased stocks, is added to the ClientPortfolio database whenever a
stock buy takes place. Clients may now monitor their stock holdings and make well-informed
investment choices thanks to this update.

**Balance Update and Messaging:**
The BuyStock operation additionally updates the client's account balance in the Accounts
database in order to keep account balances appropriately. To represent the effect of the
transaction on the client's financial situation, the total cost of the stock purchase is subtracted
from the current balance. Additionally, the process has the capacity to create and distribute
messaging notifications to customers, informing them of the confirmation of their purchases and
other crucial transactional information.

R**DBMS OF THE DATABASE**
Relational database management systems (RDBMS) are an appropriate DBMS for the described
database scenario. Because they offer a systematic method of data management and storage in
tables with established associations, RDBMS are ideally suited for this situation. The scenario's
entity relationships are clearly defined, and SQL queries on the data are simple. This database
system can be implemented using MySQL, a well-liked RDBMS. Relational databases employ a
relational data model to organize information, while RDBMS is database software that enables
users to manage the database.
