
CREATE TABLE Genre (
    ID SERIAL PRIMARY KEY,
    Title VARCHAR(250) NOT NULL
);

CREATE TABLE Client (
    ID SERIAL PRIMARY KEY,
    Last_name VARCHAR(250) NOT NULL,
    First_name VARCHAR(250) NOT NULL,
    Patronymic VARCHAR(250),
    Phone VARCHAR(15) NOT NULL,  -- Изменено на VARCHAR для телефонных номеров
    "E-mail" VARCHAR(250) NOT NULL  -- Используем кавычки для имен с дефисом
);

CREATE TABLE Cassette (
    ID SERIAL PRIMARY KEY,
    Title VARCHAR(250) NOT NULL,
    Description VARCHAR(250) NOT NULL,
    Year INT,
    Genre INT NOT NULL,
    Age_limit VARCHAR(250) NOT NULL,
    FOREIGN KEY (Genre) REFERENCES Genre(ID)
);

CREATE TABLE Invoice (
    ID SERIAL PRIMARY KEY,
    Client INT NOT NULL,
    Cassette INT NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE,
    FOREIGN KEY (Client) REFERENCES Client(ID),
    FOREIGN KEY (Cassette) REFERENCES Cassette(ID)
);
