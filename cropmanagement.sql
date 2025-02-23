-- 1. Farmers Table (Stores farmer information)
CREATE TABLE Farmers (
    farmer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Crops Table (Stores crop information)
CREATE TABLE Crops (
    crop_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT,
    crop_name VARCHAR(100) NOT NULL,
    variety VARCHAR(100) NOT NULL,
    planting_date DATE NOT NULL,
    harvest_date DATE,
    yield DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id)
);

-- 3. SoilData Table (Stores soil data for crops)
CREATE TABLE SoilData (
    soil_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    nitrogen_level DECIMAL(5, 2) NOT NULL,
    phosphorus_level DECIMAL(5, 2) NOT NULL,
    potassium_level DECIMAL(5, 2) NOT NULL,
    pH_level DECIMAL(3, 2) NOT NULL,
    moisture_content DECIMAL(5, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id)
);

-- 4. WeatherData Table (Stores weather data for crops)
CREATE TABLE WeatherData (
    weather_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    temperature DECIMAL(5, 2) NOT NULL,
    humidity DECIMAL(5, 2) NOT NULL,
    rainfall DECIMAL(5, 2) NOT NULL,
    wind_speed DECIMAL(5, 2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id)
);

-- 5. PestsAndDiseases Table (Stores pest and disease data for crops)
CREATE TABLE PestsAndDiseases (
    pest_disease_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    pest_disease_name VARCHAR(100) NOT NULL,
    severity VARCHAR(50) NOT NULL,
    treatment TEXT,
    recorded_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id)
);

-- 6. MarketPrices Table (Stores market prices for crops)
CREATE TABLE MarketPrices (
    price_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_id INT,
    market_name VARCHAR(100) NOT NULL,
    price_per_kg DECIMAL(10, 2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id)
);

-- 7. BulkDataInsertion Table (Stores bulk data insertion logs)
CREATE TABLE BulkDataInsertion (
    insertion_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(100) NOT NULL,
    records_inserted INT NOT NULL,
    insertion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample records into Farmers table
INSERT INTO Farmers (name, email, phone, address) VALUES
('John Doe', 'john@example.com', '1234567890', '123 Farm Lane, Springfield'),
('Jane Smith', 'jane@example.com', '0987654321', '456 Country Road, Shelbyville'),
('Alice Johnson', 'alice@example.com', '5555555555', '789 Rural Route, Ogdenville'),
('Bob Brown', 'bob@example.com', '4444444444', '101 Farm Road, Capital City'),
('Charlie Davis', 'charlie@example.com', '3333333333', '202 Country Lane, North Haverbrook');

-- Insert sample records into Crops table
INSERT INTO Crops (farmer_id, crop_name, variety, planting_date, harvest_date, yield) VALUES
(1, 'Wheat', 'Hard Red', '2023-03-01', '2023-08-01', 5000.00),
(2, 'Corn', 'Sweet Corn', '2023-04-15', '2023-09-15', 3000.00),
(3, 'Soybeans', 'Glycine Max', '2023-05-01', '2023-10-01', 4000.00),
(4, 'Rice', 'Jasmine', '2023-06-01', '2023-11-01', 6000.00),
(5, 'Barley', 'Two-Row', '2023-07-01', '2023-12-01', 3500.00);

-- Insert sample records into SoilData table
INSERT INTO SoilData (crop_id, nitrogen_level, phosphorus_level, potassium_level, pH_level, moisture_content) VALUES
(1, 2.5, 1.5, 2.0, 6.5, 20.0),
(2, 3.0, 2.0, 2.5, 6.8, 25.0),
(3, 2.8, 1.8, 2.2, 6.7, 22.0),
(4, 3.2, 2.2, 2.8, 6.9, 24.0),
(5, 2.6, 1.6, 2.1, 6.6, 21.0);

-- Insert sample records into WeatherData table
INSERT INTO WeatherData (crop_id, temperature, humidity, rainfall, wind_speed, recorded_at) VALUES
(1, 25.0, 60.0, 10.0, 5.0, '2023-03-01 08:00:00'),
(2, 28.0, 65.0, 12.0, 6.0, '2023-04-15 08:00:00'),
(3, 30.0, 70.0, 15.0, 7.0, '2023-05-01 08:00:00'),
(4, 27.0, 55.0, 8.0, 4.0, '2023-06-01 08:00:00'),
(5, 26.0, 50.0, 9.0, 3.0, '2023-07-01 08:00:00');

-- Insert sample records into PestsAndDiseases table
INSERT INTO PestsAndDiseases (crop_id, pest_disease_name, severity, treatment, recorded_at) VALUES
(1, 'Aphids', 'Moderate', 'Use insecticidal soap', '2023-04-01 08:00:00'),
(2, 'Corn Borer', 'Severe', 'Apply Bacillus thuringiensis', '2023-05-15 08:00:00'),
(3, 'Soybean Rust', 'Mild', 'Use fungicide', '2023-06-01 08:00:00'),
(4, 'Rice Blast', 'Moderate', 'Apply appropriate fungicide', '2023-07-01 08:00:00'),
(5, 'Barley Yellow Dwarf', 'Severe', 'Use resistant varieties', '2023-08-01 08:00:00');

-- Insert sample records into MarketPrices table
INSERT INTO MarketPrices (crop_id, market_name, price_per_kg, recorded_at) VALUES
(1, 'Springfield Market', 1.50, '2023-08-01 08:00:00'),
(2, 'Shelbyville Market', 1.80, '2023-09-15 08:00:00'),
(3, 'Ogdenville Market', 1.60, '2023-10-01 08:00:00'),
(4, 'Capital City Market', 2.00, '2023-11-01 08:00:00'),
(5, 'North Haverbrook Market', 1.70, '2023-12-01 08:00:00');

-- Insert sample records into BulkDataInsertion table
INSERT INTO BulkDataInsertion (table_name, records_inserted) VALUES
('Farmers', 5),
('Crops', 5),
('SoilData', 5),
('WeatherData', 5),
('PestsAndDiseases', 5),
('MarketPrices', 5);