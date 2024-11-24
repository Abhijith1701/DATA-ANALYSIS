CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(101, 1, '123 Main St, Downtown', '9876543210'),
(102, 2, '456 Elm St, Uptown', '9876543220'),
(103, 3, '789 Oak St, Suburbia', '9876543230'),
(104, 4, '101 Pine St, City Center', '9876543240'),
(105, 5, '202 Birch St, Lakeside', '9876543250'),
(106, 6, '303 Cedar St, Hilltop', '9876543260'),
(107, 7, '404 Maple St, East End', '9876543270'),
(108, 8, '505 Walnut St, West End', '9876543280'),
(109, 9, '606 Cherry St, Downtown North', '9876543290'),
(110, 10, '707 Ash St, Uptown South', '9876543300');

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'Alice Smith', 'Manager', 75000.00, 101),
(2, 'Bob Johnson', 'Librarian', 45000.00, 102),
(3, 'Charlie Brown', 'Assistant Librarian', 35000.00, 103),
(4, 'David Williams', 'Manager', 80000.00, 104),
(5, 'Eve Davis', 'Assistant Librarian', 32000.00, 105),
(6, 'Fay Jackson', 'Librarian', 46000.00, 106),
(7, 'George Harris', 'Manager', 82000.00, 107),
(8, 'Hannah Scott', 'Librarian', 44000.00, 108),
(9, 'Ian Mitchell', 'Assistant Librarian', 33000.00, 109),
(10, 'Jane Parker', 'Manager', 78000.00, 110);

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-0131103627', 'The C Programming Language', 'Computer Science', 30.00, 'yes', 'Brian Kernighan', 'Prentice Hall'),
('978-0201633610', 'Design Patterns', 'Software Engineering', 40.00, 'no', 'Erich Gamma', 'Addison-Wesley'),
('978-1449331818', 'Learning Python', 'Programming', 25.00, 'yes', 'Mark Lutz', 'O\'Reilly Media'),
('978-0132350884', 'Clean Code', 'Software Engineering', 35.00, 'yes', 'Robert C. Martin', 'Prentice Hall'),
('978-0321356680', 'Refactoring', 'Software Engineering', 50.00, 'no', 'Martin Fowler', 'Addison-Wesley'),
('978-0134757599', 'The Pragmatic Programmer', 'Software Engineering', 45.00, 'yes', 'Andrew Hunt', 'Addison-Wesley'),
('978-0321563842', 'Head First Java', 'Programming', 30.00, 'yes', 'Kathy Sierra', 'O\'Reilly Media'),
('978-0137142523', 'Effective Java', 'Programming', 55.00, 'no', 'Joshua Bloch', 'Addison-Wesley'),
('978-0134841129', 'Java: The Complete Reference', 'Programming', 60.00, 'yes', 'Herbert Schildt', 'McGraw-Hill'),
('978-1118032099', 'Clean Architecture', 'Software Engineering', 40.00, 'yes', 'Robert C. Martin', 'Prentice Hall');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Doe', '10 Park Avenue', '2020-05-15'),
(2, 'Jane Smith', '25 River Road', '2021-07-20'),
(3, 'Samuel Johnson', '15 Beach St', '2022-03-10'),
(4, 'Emily Clark', '50 Sunset Blvd', '2021-01-05'),
(5, 'Michael Brown', '100 City Center', '2023-06-01'),
(6, 'Laura Wilson', '12 Greenfield Rd', '2020-12-11'),
(7, 'Matthew Lee', '8 Ocean Drive', '2021-09-22'),
(8, 'Sophia White', '45 Maple St', '2022-02-14'),
(9, 'Daniel Miller', '33 High St', '2021-03-30'),
(10, 'Olivia Harris', '78 Pine St', '2023-01-01');

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    ISBN_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book)
VALUES
(1, 1, 'The C Programming Language', '2023-01-10', '978-0131103627'),
(2, 2, 'Design Patterns', '2023-04-15', '978-0201633610'),
(3, 3, 'Learning Python', '2023-07-05', '978-1449331818'),
(4, 4, 'Clean Code', '2023-02-20', '978-0132350884'),
(5, 5, 'Refactoring', '2023-06-05', '978-0321356680'),
(6, 6, 'The Pragmatic Programmer', '2023-03-01', '978-0134757599'),
(7, 7, 'Head First Java', '2023-05-10', '978-0321563842'),
(8, 8, 'Effective Java', '2023-05-20', '978-0137142523'),
(9, 9, 'Java: The Complete Reference', '2023-06-15', '978-0134841129'),
(10, 10, 'Clean Architecture', '2023-07-01', '978-1118032099');

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    ISBN_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
    );
    
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES
(1, 1, 'The C Programming Language', '2023-02-10', '978-0131103627'),
(2, 2, 'Design Patterns', '2023-05-15', '978-0201633610'),
(3, 3, 'Learning Python', '2023-07-15', '978-1449331818'),
(4, 4, 'Clean Code', '2023-03-10', '978-0132350884'),
(5, 5, 'Refactoring', '2023-06-10', '978-0321356680'),
(6, 6, 'The Pragmatic Programmer', '2023-04-15', '978-0134757599'),
(7, 7, 'Head First Java', '2023-06-01', '978-0321563842'),
(8, 8, 'Effective Java', '2023-06-25', '978-0137142523'),
(9, 9, 'Java: The Complete Reference', '2023-07-05', '978-0134841129'),
(10, 10, 'Clean Architecture', '2023-07-10', '978-1118032099');

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.ISBN_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT C.Customer_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';

SELECT DISTINCT C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.ISBN_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE B.Rental_Price > 25;

