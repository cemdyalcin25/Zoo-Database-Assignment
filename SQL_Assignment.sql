-- Step 1: Create a new database
CREATE DATABASE MoviesDB;
GO

-- Step 2: Use the new database
USE MoviesDB;
GO

-- Step 3: Create the Directors table
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    DirectorName VARCHAR(100),
    MovieName VARCHAR(100)
);

-- Step 4: Create the Actors table
CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    ActorName VARCHAR(100),
    MovieName VARCHAR(100),
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);

-- Step 5: Insert sample data into Directors
INSERT INTO Directors VALUES (1, 'Victor Fleming', 'Gone with the Wind');
INSERT INTO Directors VALUES (2, 'Christopher Nolan', 'Inception');
INSERT INTO Directors VALUES (3, 'Steven Spielberg', 'Jurassic Park');
INSERT INTO Directors VALUES (4, 'James Cameron', 'Titanic');
INSERT INTO Directors VALUES (5, 'Quentin Tarantino', 'Pulp Fiction');

-- Step 6: Insert sample data into Actors
INSERT INTO Actors VALUES (101, 'Clark Gable', 'Gone with the Wind', 1);
INSERT INTO Actors VALUES (102, 'Leonardo DiCaprio', 'Inception', 2);
INSERT INTO Actors VALUES (103, 'Sam Neill', 'Jurassic Park', 3);
INSERT INTO Actors VALUES (104, 'Kate Winslet', 'Titanic', 4);
INSERT INTO Actors VALUES (105, 'John Travolta', 'Pulp Fiction', 5);

-- Step 7: Query joining both tables
SELECT 
    Actors.ActorName,
    Actors.MovieName,
    Directors.DirectorName
FROM 
    Actors
JOIN 
    Directors ON Actors.DirectorID = Directors.DirectorID
WHERE 
    Actors.MovieName IN ('Gone with the Wind', 'Inception');
