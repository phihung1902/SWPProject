create database swp391_prj

use swp391_prj
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType VARCHAR(20) NOT NULL, -- thủ thư or người đọc
	FullName VARCHAR(255) NOT NULL,
	Email VARCHAR(255),
	Phone VARCHAR(20),
	Address VARCHAR(255),
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20),
    Category VARCHAR(50),
    Location VARCHAR(255), -- Location in the library
    AvailableCopies INT,
);

CREATE TABLE BookAuthors (
	BookID INT,
	AuthorID INT, 
	PRIMARY KEY (BookID, AuthorID),
	CONSTRAINT fk_book_author_book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_book_author_author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL
);
CREATE TABLE BorrowHistory (
    BorrowID INT PRIMARY KEY,
    UserID INT,
    BorrowDate DATE,
    ReturnDate DATE,
	LateFee DECIMAL(10, 2),
    CONSTRAINT fk_user_borrow FOREIGN KEY (UserID) REFERENCES Users(UserID),   
);

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE
);

CREATE TABLE BookComments (
    CommentID INT PRIMARY KEY,
    BookID INT,
    UserID INT,
    CommentText TEXT,
    CommentDate DATETIME,
    CONSTRAINT fk_user_comment FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_book_comment FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE eBookUsage (
    eBookID INT PRIMARY KEY,
    UserID INT,
    UsageDate DATE,
    CONSTRAINT fk_user_ebook FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE LibraryLocations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(255) NOT NULL
);

CREATE TABLE BookLocation (
    BookID INT,
    LocationID INT,
    PRIMARY KEY (BookID, LocationID),
    CONSTRAINT fk_book_location FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_location FOREIGN KEY (LocationID) REFERENCES LibraryLocations(LocationID)
);

CREATE TABLE FavoriteBooks (
    UserID INT,
    BookID INT,
    PRIMARY KEY (UserID, BookID),
    CONSTRAINT fk_user_favorite FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_book_favorite FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
CREATE TABLE BorrowedTicket (
    BorrowedBookID INT PRIMARY KEY,
    BorrowID INT,
    BookID INT,
    CONSTRAINT fk_borrowed_books_borrow FOREIGN KEY (BorrowID) REFERENCES BorrowHistory(BorrowID),
    CONSTRAINT fk_borrowed_books_book FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
