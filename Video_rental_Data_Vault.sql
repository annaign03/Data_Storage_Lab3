
CREATE TABLE Hub_client (
    Client_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    Client_number INT NOT NULL
);

CREATE TABLE Hab_cassette (
    Cassette_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    Cassette_code INT NOT NULL
);

CREATE TABLE Link_invoice (
    Invoice_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    Cassette_hash_key INT NOT NULL,
    Client_hash_key INT NOT NULL,
    FOREIGN KEY (Cassette_hash_key) REFERENCES Hab_cassette (Cassette_hash_key),
    FOREIGN KEY (Client_hash_key) REFERENCES Hub_client (Client_hash_key)
);

CREATE TABLE Sat_client (
    Client_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    First_name VARCHAR(250) NOT NULL,
    Last_name VARCHAR(250) NOT NULL,
    Patronymic VARCHAR(250),
    Phone VARCHAR(15) NOT NULL,  -- Изменено на VARCHAR для поддержки различных форматов телефонных номеров
    "E-mail" VARCHAR(250) NOT NULL,
    Update_date DATE NOT NULL,
    FOREIGN KEY (Client_hash_key) REFERENCES Hub_client (Client_hash_key)
);

CREATE TABLE Sat_cassette (
    Cassette_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    Title VARCHAR(250) NOT NULL,
    Description VARCHAR(250) NOT NULL,
    Year INT,
    Genre INT NOT NULL,
    Age_limit VARCHAR(250) NOT NULL,
    Update_date DATE NOT NULL,
    FOREIGN KEY (Cassette_hash_key) REFERENCES Hab_cassette (Cassette_hash_key)
);

CREATE TABLE Sat_invoice (
    Invoice_hash_key INT NOT NULL PRIMARY KEY,
    Load_date DATE NOT NULL,
    Record_source VARCHAR(250) NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE,
    Update_date DATE NOT NULL,
    FOREIGN KEY (Invoice_hash_key) REFERENCES Link_invoice (Invoice_hash_key)
);
