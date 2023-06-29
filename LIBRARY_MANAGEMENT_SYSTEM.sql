CREATE DATABASE LibrarySystemDB;
USE LibrarySystemDB;
CREATE TABLE Books(
ISBN INT(15) PRIMARY KEY,
Book_Title VARCHAR(100),
Category VARCHAR(100),
Rental_Price INT(4),
STATUS VARCHAR(3),
Author VARCHAR(50), 
Publisher VARCHAR(100)); 

INSERT INTO Books VALUES(51,"Half Girlfriend","Romance",150,"No","Chetan Bhagat","Rupa & Co"),(
52,"One Indian Girl","Fiction",150,"Yes","Chetan Bhagat","Rupa & Co"),(
61,"The Fault In Our Stars","Realistic Fiction",150,"No","John Green","Penguin Books"),(
63,"Once In A Lifetime","Romance",250,"Yes","Cathy Kelly","Simon & Schuster"),(
71,"The Adventures Of Sherlock Holmes","Detective Fiction",350,"Yes","Arthur Conan Doyle","George Newnes"),(
75,"Rich Dad Poor Dad","Personal Finance",300,"Yes","Robert kiyosaki","Plata Publishing");
SELECT * FROM Books;
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30), 
Position VARCHAR(30),
Salary DECIMAL(8,2));
INSERT INTO Employee VALUES(
1100,"David Abraham","Accountant",25000),(
1101,"James Mathew","Receptionist",15000),(
1102,"Maria Thomas","Librarian",30000),(
1103,"Dibin Jose","Manager",35000),(
1104,"Sara Khan","Assistant",20000),(
1105,"Suma Mahesh","Technician",20000);
CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(30),
Contact_no INT(12));
INSERT INTO Branch VALUES(
1,1100,"ABC A LANE",111111110),(
2,1101,"ABC B LANE",222222221),(
3,1102,"ABC C LANE",333333332),(
4,1103,"ABC D LANE",444444443),(
5,1104,"ABC E LANE",555555554),(
6,1105,"ABC F LANE",666666665);
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY, 
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE);
INSERT INTO Customer VALUES(
220,"Jannah","Jannah's Cradle","2021-06-05"),(
221,"Martha","Martha's Kingdom","2022-07-06"),(
222,"Sunny","Sunny's","2023-08-07"),(
223,"Sam","Sam Cottage","2021-06-10"),(
224,"Sundar","Sundar Bhavan","2022-03-20"),(
225,"Luke","Luke's Place","2023-02-22");

CREATE TABLE Issue_Status(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
INSERT INTO Issue_Status VALUES(
1,220,"Half Girlfriend","2021-06-05",51),(
2,221,"The Blue","2023-05-02",52),(
3,222,"Like It Happened Yesterday","2023-11-09",61),(
4,223,"Crime and Punishment","2021-06-19",63),(
5,224,"Harry Potter","2022-04-25",71),(
6,225,"The Fault In Our Stars","2023-11-17",75);

CREATE TABLE Return_Status(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(50), 
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
INSERT INTO Return_Status VALUES(
501,221,"The catcher in The Rye","2022-11-20",51),(
502,223,"To Kill A Mocking Bird ","2023-12-15",52),(
503,235,"Pride And Prejudice","2023-01-01",61),(
504,225,"Rich Dad Poor Dad","2023-04-22",63),(
505,238,"The Great Gasby","2023-04-10",71),(
506,239,"The Alchemist","2023-01-18",75);
SELECT * FROM Books;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Customer;
SELECT * FROM Issue_Status;
SELECT * FROM Return_Status;

#QUESTION 1
SELECT 
     Book_Title,
     Category,
     Rental_Price 
FROM
     Books
WHERE
     STATUS="Yes";
     
#QUESTION 2
SELECT
    Emp_name,
    Salary
FROM
    Employee
ORDER BY 
    SALARY DESC;
    
#QUESTION 3
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN Issue_Status i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

#QUESTION 4
SELECT category,COUNT(*) FROM Books GROUP BY Category;

#QUESTION 5
SELECT Emp_name,Position,Salary FROM Employee WHERE Salary>20000;

#QUESTION 6
SELECT Customer_name
FROM Customer c
LEFT JOIN Issue_Status i ON c.Customer_Id = i.Issued_cust
WHERE i.Issued_cust IS NULL AND c.Reg_date < '2022-01-01';

#QUESTION 7
SELECT b.Branch_no, COUNT(*) AS Total_Count
FROM Branch b
JOIN Employee e ON b.Manager_Id = e.Emp_Id
GROUP BY b.Branch_no;

#QUESTION 8
SELECT c.Customer_name
FROM Customer c
JOIN Issue_Status i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

#QUESTION 9
SELECT Book_title FROM Books WHERE Category="history";

#QUESTION 10
SELECT b.Branch_no, COUNT(*) AS Employee_Count
FROM Branch b
JOIN Employee e ON b.Manager_Id = e.Emp_Id
GROUP BY b.Branch_no
HAVING COUNT(*) > 5;

