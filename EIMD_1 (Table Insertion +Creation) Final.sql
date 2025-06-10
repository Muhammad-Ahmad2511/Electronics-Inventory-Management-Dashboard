create database Electronic_Iventory_Managrment_System 
use Electronic_Iventory_Managrment_System

Create TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(100) not null
)
-- PRODUCTS TABLE
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
	CategoryID INT foreign key References Categories(CategoryID),
    ProductName VARCHAR(100) not null,
    UnitPrice DECIMAL(10,2)not null,
    StockQuantity INT
);

-- SUPPLIERS TABLE
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100)not null,
    ContactEmail VARCHAR(100)not null
);

-- PRODUCTSUPPLIER TABLE
CREATE TABLE ProductSupplier (
    ProductID INT not null,
    SupplierID INT not null,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- CUSTOMER SEGMENTS TABLE
CREATE TABLE CustomerSegments (
    SegmentID INT PRIMARY KEY not null,
    SegmentName VARCHAR(50) not null,
    Description TEXT not null
);

-- CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) not null,
    Age INT not null,
    Gender VARCHAR(10) not null,
    City VARCHAR(50) not null,
    SegmentID INT not null,
    FOREIGN KEY (SegmentID) REFERENCES CustomerSegments(SegmentID)
);
--Region Table
CREATE TABLE Region (
    RId INT PRIMARY KEY,
	RName VARCHAR(10) NOT NULL
)
-- SALES TABLE
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT not null,
    CustomerID INT not null,
    QuantitySold INT not null,
    SaleDate DATE not null,
    DiscountPercent DECIMAL(5,2) not null,
    RId int not null,
    SalesChannel VARCHAR(20) not null,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (RId) REFERENCES Region(RId)
);


-- RETURNS TABLE
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY not null,
    SaleID INT not null,
    ReturnDate DATE not null,
    Reason VARCHAR(255) not null,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

-- WARRANTIES TABLE
CREATE TABLE Warranties (
    WarrantyID INT PRIMARY KEY ,
    ProductID INT not null,
    CustomerID INT not null,
    StartDate DATE not null,
    EndDate DATE not null,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- SALES FORECAST TABLE
CREATE TABLE SalesForecast (
    ForecastID INT PRIMARY KEY,
    ProductID INT not null,
    ForecastMonth VARCHAR(20) not null,
    ForecastedSales INT not null,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



-- -----------------------------
-- 1. Categories Table (15 rows)
-- -----------------------------
INSERT INTO Categories (CategoryID, CategoryName) VALUES 
  (1,  'Smartphones'),
  (2,  'Laptops'),
  (3,  'Tablets'),
  (4,  'Accessories'),
  (5,  'Wearables'),
  (6,  'Gaming'),
  (7,  'Networking'),
  (8,  'Storage Devices'),
  (9,  'Printers'),
  (10, 'Televisions'),
  (11, 'Monitors'),
  (12, 'Cameras'),
  (13, 'Audio Equipment'),
  (14, 'Drones'),
  (15, 'Home Automation');
  -- -----------------------------
-- 2. Products Table (60 rows)
-- -----------------------------
  INSERT INTO Products (ProductID, CategoryID, ProductName, UnitPrice, StockQuantity) VALUES 
  (101, 1,  'UltraPhone X',         699.99, 150),
  (102, 1,  'MegaPhone Pro',          799.99, 200),
  (103, 1,  'BudgetPhone A',          199.99, 300),
  (104, 2,  'Laptop Elite',           1199.99, 75),
  (105, 2,  'Notebook Air',           899.99, 120),
  (106, 2,  'Gaming Laptop Z',        1499.99, 50),
  (107, 3,  'Tab Master',             499.99, 130),
  (108, 3,  'SlimTab',                399.99, 160),
  (109, 4,  'Wireless Charger',       39.99,  500),
  (110, 4,  'Bluetooth Headphones',   59.99,  400),
  (111, 5,  'Smart Watch Alpha',      249.99, 180),
  (112, 5,  'Fitness Band Lite',      49.99,  350),
  (113, 6,  'Gaming Console 1',       399.99,  90),
  (114, 6,  'VR Headset Pro',         299.99,  60),
  (115, 7,  'WiFi Router Ultra',      129.99, 140),
  (116, 7,  'Mesh WiFi System',       299.99,  80),
  (117, 8,  'External SSD 1TB',       159.99, 220),
  (118, 8,  'Portable HDD 2TB',       89.99,  180),
  (119, 9,  'Laser Printer X',        199.99, 70),
  (120, 9,  'All-in-One Printer Z',   249.99, 65),
  (121, 10, 'Smart TV 55inch',        699.99, 45),
  (122, 10, 'LED TV 42inch',          399.99, 80),
  (123, 1,  'CompactPhone B',         299.99, 210),
  (124, 2,  'Ultrabook S',            999.99, 85),
  (125, 4,  'Noise Cancelling Earbuds',89.99,  320),
  (126, 5,  'Smart Watch Beta',       199.99, 190),
  (127, 6,  'Handheld Console',       149.99, 100),
  (128, 7,  'Switching Hub',          69.99,  150),
  (129, 8,  'Memory Card 128GB',      19.99,  600),
  (130, 10,'OLED TV 65inch',         1299.99, 30),
  (131, 11,'4K Monitor 27inch',       349.99, 95),
  (132, 11,'HD Monitor 24inch',       199.99, 120),
  (133, 12,'Digital Camera Pro',      549.99, 75),
  (134, 12,'Compact Camera LX',       299.99, 110),
  (135, 13,'Bluetooth Speaker',       99.99,  200),
  (136, 13,'Home Theater System',     499.99, 60),
  (137, 14,'Quadcopter Drone',        399.99, 80),
  (138, 14,'Mini Drone',              149.99, 150),
  (139, 15,'Smart Light System',      79.99,  300),
  (140, 15,'Smart Thermostat',        199.99, 85),
  (141, 1,  'Flagship Phone Y',        899.99, 130),
  (142, 2,  'Convertible Laptop Z',    1299.99, 70),
  (143, 3,  'Tablet Pro X',            599.99, 150),
  (144, 4,  'USB-C Hub',               49.99,  400),
  (145, 5,  'Fitness Smartwatch Z',    229.99, 170),
  (146, 6,  'Portable Gaming Console', 299.99, 90),
  (147, 7,  'Wireless Access Point',   89.99,  110),
  (148, 8,  'Internal SSD 500GB',      79.99,  230),
  (149, 9,  'Inkjet Printer Y',        149.99, 65),
  (150, 10,'Smart TV 75inch',         1499.99, 40),
  (151, 1, 'Phantom Phone X', 899.99, 80),
  (152, 2, 'Workstation Pro Laptop', 1899.99, 40),
  (153, 3, 'Kids Tablet', 149.99, 120),
  (154, 4, 'Premium Leather Case', 49.99, 200),
  (155, 5, 'Health Tracker Pro', 129.99, 150),
  (156, 6, 'Gaming Mouse Elite', 79.99, 180),
  (157, 7, '5G Router', 199.99, 90),
  (158, 8, 'NVMe SSD 2TB', 299.99, 70),
  (159, 9, 'Photo Printer', 349.99, 50),
  (160, 10, '8K Smart TV 75"', 2499.99, 25);

  -- -----------------------------
-- 3. Suppliers Table (30 rows)
-- -----------------------------
INSERT INTO Suppliers (SupplierID, SupplierName, ContactEmail) VALUES
  (201, 'TechSource Inc.',          'contact@techsource.com'),
  (202, 'GadgetWorld',              'info@gadgetworld.com'),
  (203, 'Device Depot',             'sales@devicedepot.com'),
  (204, 'ElectroHub',               'support@electrohub.com'),
  (205, 'NextGen Supplies',         'hello@nextgensupplies.com'),
  (206, 'Global Tech',              'sales@globaltech.com'),
  (207, 'Digital Solutions',        'contact@digitalsolutions.com'),
  (208, 'Modern Electronics',       'info@modernelectronics.com'),
  (209, 'Prime Components',         'prime@components.com'),
  (210, 'Innovative Parts',         'innovate@parts.com'),
  (211, 'Alpha Electronics',        'support@alphaelec.com'),
  (212, 'Beta Gadgets',             'info@betagadgets.com'),
  (213, 'Gamma Supply Co.',         'sales@gammasupply.com'),
  (214, 'Delta Devices',            'contact@deltadevices.com'),
  (215, 'Epsilon Components',       'support@epsiloncomp.com'),
  (216, 'Zeta Tech',                'sales@zetatech.com'),
  (217, 'Eta Innovations',          'hello@etainnovations.com'),
  (218, 'Theta Electronics',        'info@thetaelectro.com'),
  (219, 'Iota Solutions',           'support@iotasolutions.com'),
  (220, 'Kappa Industries',         'sales@kappaind.com'),
  (221, 'Premium Device Co.', 'sales@premiumdevice.com'),
  (222, 'Elite Components Ltd.', 'info@elitecomponents.com'),
  (223, 'KidTech Solutions', 'contact@kidtech.com'),
  (224, 'CaseMasters Inc.', 'support@casemasters.com'),
  (225, 'HealthTrack Systems', 'hello@healthtrack.com'),
  (226, 'GameGear International', 'sales@gamegear.com'),
  (227, 'Networking Experts', 'info@networkingexperts.com'),
  (228, 'Storage Solutions', 'contact@storagesolutions.com'),
  (229, 'Printing Technologies', 'support@printingtech.com'),
  (230, 'Display Specialists', 'sales@displayspecial.com');
  -- -----------------------------
-- 4. ProductSupplier Table (60 rows)
-- -----------------------------

INSERT INTO ProductSupplier (ProductID, SupplierID) VALUES 
  (101, 201), (102, 202), (103, 203), (104, 204), (105, 205),
  (106, 206), (107, 207), (108, 208), (109, 209), (110, 210),
  (111, 211), (112, 212), (113, 213), (114, 214), (115, 215),
  (116, 216), (117, 217), (118, 218), (119, 219), (120, 220),
  (121, 201), (122, 202), (123, 203), (124, 204), (125, 205),
  (126, 206), (127, 207), (128, 208), (129, 209), (130, 210),
  (131, 211), (132, 212), (133, 213), (134, 214), (135, 215),
  (136, 216), (137, 217), (138, 218), (139, 219), (140, 220),
  (141, 201), (142, 202), (143, 203), (144, 204), (145, 205),
  (146, 206), (147, 207), (148, 208), (149, 209), (150, 210),
  (151, 221), (152, 222), (153, 223), (154, 224), (155, 225),
  (156, 226), (157, 227), (158, 228), (159, 229), (160, 230);

  -- -----------------------------
-- 5. CustomerSegments Table (17 rows)
-- -----------------------------
INSERT INTO CustomerSegments (SegmentID, SegmentName, Description) VALUES
  (301, 'Retail',       'Individual customers and end-users.'),
  (302, 'Wholesale',    'Bulk buyers and trading companies.'),
  (303, 'Corporate',    'Large businesses and enterprises.'),
  (304, 'Government',   'Government and public sector organizations.'),
  (305, 'Educational',  'Schools, colleges, and educational institutions.'),
  (306, 'Small Business','Local businesses with fewer employees.'),
  (307, 'Online Subscribers', 'Customers subscribing to online services.'),
  (308, 'Premium Consumers', 'High-income individual customers'),
  (309, 'Family Buyers', 'Parents purchasing for children'),
  (310, 'Professional Gamers', 'Competitive gaming enthusiasts'),
  (311, 'Remote Workers', 'Professionals working from home'),
  (312, 'Content Creators', 'YouTubers, streamers, and influencers'),
  (313, 'IT Professionals', 'Corporate IT departments'),
  (314, 'Photographers', 'Professional and amateur photographers'),
  (315, 'Home Theater Enthusiasts', 'Audiophiles and cinephiles'),
  (316, 'Students', 'College and university students'),
  (317, 'Senior Citizens', 'Elderly technology users');

  -- -----------------------------
-- 6. Customers Table (60 rows)
-- -----------------------------
INSERT INTO Customers (CustomerID, FullName, Age, Gender, City, SegmentID) VALUES
  (401, 'Alice Johnson',      34, 'Female', 'New York',         301),
  (402, 'Bob Smith',          45, 'Male',   'Los Angeles',      303),
  (403, 'Carol Davis',        29, 'Female', 'Chicago',          301),
  (404, 'David Brown',        52, 'Male',   'Houston',          302),
  (405, 'Eva Wilson',         41, 'Female', 'Phoenix',          303),
  (406, 'Frank Miller',       38, 'Male',   'Philadelphia',     302),
  (407, 'Grace Lee',          27, 'Female', 'San Antonio',      305),
  (408, 'Henry Martin',       33, 'Male',   'San Diego',        301),
  (409, 'Ivy Anderson',       37, 'Female', 'Dallas',           304),
  (410, 'Jack Thomas',        50, 'Male',   'San Jose',         303),
  (411, 'Kathy White',        30, 'Female', 'Austin',           301),
  (412, 'Leon Green',         42, 'Male',   'Jacksonville',     302),
  (413, 'Mona Scott',         35, 'Female', 'Fort Worth',       305),
  (414, 'Nathan Young',       48, 'Male',   'Columbus',         304),
  (415, 'Olivia King',        26, 'Female', 'San Francisco',    301),
  (416, 'Peter Baker',        39, 'Male',   'Charlotte',        303),
  (417, 'Queenie Hall',       31, 'Female', 'Indianapolis',     305),
  (418, 'Robert Adams',       55, 'Male',   'Seattle',          304),
  (419, 'Sophia Nelson',      28, 'Female', 'Denver',           301),
  (420, 'Tom Carter',         47, 'Male',   'Washington',       302),
  (421, 'Ursula Grant',       36, 'Female', 'Boston',           306),
  (422, 'Victor Reed',        44, 'Male',   'Detroit',          306),
  (423, 'Wendy Perry',        32, 'Female', 'Nashville',        307),
  (424, 'Xander Cruz',        40, 'Male',   'Memphis',          307),
  (425, 'Yolanda James',      33, 'Female', 'Baltimore',        305),
  (426, 'Zane Foster',        39, 'Male',   'Oklahoma City',    303),
  (427, 'Abigail Price',      29, 'Female', 'Portland',         301),
  (428, 'Brian Cooper',       46, 'Male',   'Las Vegas',        302),
  (429, 'Catherine Bell',     38, 'Female', 'Milwaukee',        304),
  (430, 'Derek Stone',        41, 'Male',   'Albuquerque',      306),
  (431, 'Elena Morris',       35, 'Female', 'Tucson',           305),
  (432, 'Felix Diaz',         42, 'Male',   'Fresno',           303),
  (433, 'Gina Rivera',        27, 'Female', 'Sacramento',       301),
  (434, 'Hector Ruiz',        50, 'Male',   'Long Beach',       302),
  (435, 'Isla Washington',    30, 'Female', 'Kansas City',      304),
  (436, 'Jonah Bellamy',      37, 'Male',   'Mesa',             306),
  (437, 'Kiara Hughes',       28, 'Female', 'Atlanta',          305),
  (438, 'Liam Jordan',        41, 'Male',   'Omaha',            303),
  (439, 'Maya Stevens',       34, 'Female', 'Colorado Springs', 301),
  (440, 'Noah Bowen',         47, 'Male',   'Raleigh',          306),
  (441, 'Olive Barrett',      32, 'Female', 'Miami',            307),
  (442, 'Pauline Chambers',   39, 'Female', 'Virginia Beach',   305),
  (443, 'Quentin Webb',       44, 'Male',   'Oakland',          304),
  (444, 'Riley Powell',       36, 'Male',   'Minneapolis',      302),
  (445, 'Sara Dean',          29, 'Female', 'Tulsa',            301),
  (446, 'Travis Arnold',      40, 'Male',   'Arlington',        303),
  (447, 'Uma Ellis',          33, 'Female', 'New Orleans',      305),
  (448, 'Violet Palmer',      38, 'Female', 'Cleveland',        306),
  (449, 'Walter Knight',      45, 'Male',   'Bakersfield',      304),
  (450, 'Xenia Marshall',     31, 'Female', 'Aurora',           307),
   (451, 'Zachary Quinn', 28, 'Male', 'Portland', 308),
  (452, 'Natalie Vega', 32, 'Female', 'Austin', 309),
  (453, 'Marcus Holloway', 24, 'Male', 'San Diego', 310),
  (454, 'Sophie Zhang', 29, 'Female', 'Seattle', 311),
  (455, 'Elijah Rhodes', 35, 'Male', 'Denver', 312),
  (456, 'Isabella Mercer', 42, 'Female', 'Chicago', 313),
  (457, 'Lucas Graves', 38, 'Male', 'Boston', 314),
  (458, 'Hannah Foley', 45, 'Female', 'Atlanta', 315),
  (459, 'Owen Chen', 20, 'Male', 'Philadelphia', 316),
  (460, 'Emma Dawson', 68, 'Female', 'Phoenix', 317);

  -- -----------------------------
-- 7. Sales Table (90 rows)
-- -----------------------------

INSERT INTO Sales (SaleID, ProductID, CustomerID, QuantitySold, SaleDate, DiscountPercent, RId, SalesChannel) VALUES
  (501, 101, 401, 2, '2025-01-05', 0.00, 7, 'Online'),
  (502, 102, 402, 1, '2025-01-06', 5.00, 9, 'Retail'),
  (503, 103, 403, 3, '2025-01-07', 0.00, 2, 'Online'),
  (504, 104, 404, 1, '2025-01-08', 10.00, 2, 'Retail'),
  (505, 105, 405, 2, '2025-01-09', 0.00, 8, 'Online'),
  (506, 106, 406, 1, '2025-01-10', 15.00, 1, 'Retail'),
  (507, 107, 407, 2, '2025-01-11', 0.00, 7, 'Online'),
  (508, 108, 408, 1, '2025-01-12', 5.00, 7, 'Retail'),
  (509, 109, 409, 5, '2025-01-13', 0.00, 3, 'Online'),
  (510, 110, 410, 2, '2025-01-14', 0.00, 1, 'Retail'),
  (511, 111, 411, 1, '2025-01-15', 0.00, 5, 'Online'),
  (512, 112, 412, 4, '2025-01-16', 5.00, 5, 'Retail'),
  (513, 113, 413, 1, '2025-01-17', 0.00, 7, 'Online'),
  (514, 114, 414, 2, '2025-01-18', 10.00, 9, 'Retail'),
  (515, 115, 415, 1, '2025-01-19', 0.00, 4, 'Online'),
  (516, 116, 416, 3, '2025-01-20', 5.00, 8, 'Retail'),
  (517, 117, 417, 2, '2025-01-21', 0.00, 3, 'Online'),
  (518, 118, 418, 1, '2025-01-22', 0.00, 6, 'Retail'),
  (519, 119, 419, 1, '2025-01-23', 0.00, 9, 'Online'),
  (520, 120, 420, 2, '2025-01-24', 0.00, 2, 'Retail'),
  (521, 121, 421, 1, '2025-01-25', 5.00, 4, 'Online'),
  (522, 122, 422, 3, '2025-01-26', 0.00, 8, 'Retail'),
  (523, 123, 423, 2, '2025-01-27', 0.00, 5, 'Online'),
  (524, 124, 424, 1, '2025-01-28', 10.00, 6, 'Retail'),
  (525, 125, 425, 1, '2025-01-29', 0.00, 1, 'Online'),
  (526, 126, 426, 2, '2025-01-30', 5.00, 9, 'Retail'),
  (527, 127, 427, 1, '2025-01-31', 0.00, 7, 'Online'),
  (528, 128, 428, 3, '2025-02-01', 0.00, 8, 'Retail'),
  (529, 129, 429, 4, '2025-02-02', 15.00, 2, 'Online'),
  (530, 130, 430, 1, '2025-02-03', 0.00, 3, 'Retail'),
  (531, 131, 431, 2, '2025-02-04', 5.00, 6, 'Online'),
  (532, 132, 432, 1, '2025-02-05', 0.00, 4, 'Retail'),
  (533, 133, 433, 2, '2025-02-06', 10.00, 5, 'Online'),
  (534, 134, 434, 1, '2025-02-07', 0.00, 1, 'Retail'),
  (535, 135, 435, 3, '2025-02-08', 5.00, 6, 'Online'),
  (536, 136, 436, 1, '2025-02-09', 0.00, 9, 'Retail'),
  (537, 137, 437, 2, '2025-02-10', 0.00, 2, 'Online'),
  (538, 138, 438, 1, '2025-02-11', 5.00, 8, 'Retail'),
  (539, 139, 439, 2, '2025-02-12', 0.00, 4, 'Online'),
  (540, 140, 440, 3, '2025-02-13', 10.00, 7, 'Retail'),
  (541, 141, 441, 1, '2025-02-14', 0.00, 3, 'Online'),
  (542, 142, 442, 2, '2025-02-15', 5.00, 2, 'Retail'),
  (543, 143, 443, 1, '2025-02-16', 0.00, 6, 'Online'),
  (544, 144, 444, 2, '2025-02-17', 10.00, 7, 'Retail'),
  (545, 145, 445, 1, '2025-02-18', 0.00, 5, 'Online'),
  (546, 146, 446, 3, '2025-02-19', 5.00, 8, 'Retail'),
  (547, 147, 447, 2, '2025-02-20', 0.00, 1, 'Online'),
  (548, 148, 448, 1, '2025-02-21', 0.00, 9, 'Retail'),
  (549, 149, 449, 2, '2025-02-22', 5.00, 2, 'Online'),
  (550, 150, 450, 1, '2025-02-23', 0.00, 4, 'Retail'),
  (551, 101, 401, 3, '2025-02-24', 5.00, 1, 'Online'),
  (552, 102, 402, 1, '2025-02-25', 0.00, 7, 'Retail'),
  (553, 103, 403, 2, '2025-02-26', 10.00, 8, 'Online'),
  (554, 104, 404, 1, '2025-02-27', 0.00, 3, 'Retail'),
  (555, 105, 405, 2, '2025-02-28', 5.00, 6, 'Online'),
  (556, 106, 406, 1, '2025-03-01', 0.00, 2, 'Retail'),
  (557, 107, 407, 3, '2025-03-02', 10.00, 9, 'Online'),
  (558, 108, 408, 2, '2025-03-03', 0.00, 1, 'Retail'),
  (559, 109, 409, 1, '2025-03-04', 5.00, 4, 'Online'),
  (560, 110, 410, 2, '2025-03-05', 0.00, 3, 'Retail'),
  (561, 111, 411, 1, '2025-03-06', 5.00, 7, 'Online'),
  (562, 112, 412, 2, '2025-03-07', 0.00, 2, 'Retail'),
  (563, 113, 413, 1, '2025-03-08', 0.00, 8, 'Online'),
  (564, 114, 414, 2, '2025-03-09', 5.00, 6, 'Retail'),
  (565, 115, 415, 3, '2025-03-10', 10.00, 5, 'Online'),
  (566, 116, 416, 1, '2025-03-11', 0.00, 9, 'Retail'),
  (567, 117, 417, 2, '2025-03-12', 5.00, 1, 'Online'),
  (568, 118, 418, 1, '2025-03-13', 0.00, 7, 'Retail'),
  (569, 119, 419, 3, '2025-03-14', 0.00, 2, 'Online'),
  (570, 120, 420, 2, '2025-03-15', 5.00, 8, 'Retail'),
  (571, 121, 421, 1, '2025-03-16', 0.00, 4, 'Online'),
  (572, 122, 422, 2, '2025-03-17', 5.00, 9, 'Retail'),
  (573, 123, 423, 1, '2025-03-18', 0.00, 6, 'Online'),
  (574, 124, 424, 2, '2025-03-19', 10.00, 3, 'Retail'),
  (575, 125, 425, 2, '2025-03-20', 0.00, 5, 'Online'),
  (576, 126, 426, 1, '2025-03-21', 5.00, 9, 'Retail'),
  (577, 127, 427, 3, '2025-03-22', 0.00, 1, 'Online'),
  (578, 128, 428, 2, '2025-03-23', 5.00, 1, 'Retail'),
  (579, 129, 429, 1, '2025-03-24', 0.00, 8, 'Online'),
  (580, 130, 430, 2, '2025-03-25', 5.00, 2, 'Retail'),
  (581, 151, 451, 1, '2025-04-05', 5.00, 7, 'Online'),
  (582, 152, 452, 1, '2025-04-06', 0.00, 5, 'Retail'),
  (583, 153, 453, 2, '2025-04-07', 10.00, 6, 'Online'),
  (584, 154, 454, 3, '2025-04-08', 0.00, 4, 'Retail'),
  (585, 155, 455, 1, '2025-04-09', 5.00, 4, 'Online'),
  (586, 156, 456, 2, '2025-04-10', 0.00, 3, 'Retail'),
  (587, 157, 457, 1, '2025-04-11', 0.00, 8, 'Online'),
  (588, 158, 458, 1, '2025-04-12', 10.00, 1, 'Retail'),
  (589, 159, 459, 1, '2025-04-13', 5.00, 6, 'Online'),
  (590, 160, 460, 1, '2025-04-14', 0.00, 5, 'Retail');


-- -----------------------------
-- 8. Returns Table (30 rows)
-- -----------------------------

INSERT INTO Returns (ReturnID, SaleID, ReturnDate, Reason) VALUES
  (601, 503, '2025-01-10', 'Defective product'),
  (602, 506, '2025-01-12', 'Not as described'),
  (603, 512, '2025-01-18', 'Wrong item shipped'),
  (604, 519, '2025-01-25', 'Damaged on arrival'),
  (605, 524, '2025-01-30', 'Customer changed mind'),
  (606, 532, '2025-02-06', 'Late delivery'),
  (607, 540, '2025-02-14', 'Damaged packaging'),
  (608, 550, '2025-02-23', 'Wrong color delivered'),
  (609, 558, '2025-03-03', 'Missing accessories'),
  (610, 565, '2025-03-10', 'Incorrect model'),
  (611, 572, '2025-03-17', 'Product not working'),
  (612, 577, '2025-03-22', 'Defective screen'),
  (613, 501, '2025-03-26', 'Software issues'),
  (614, 554, '2025-02-27', 'Faulty battery'),
  (615, 563, '2025-03-08', 'Damaged in transit'),
  (616, 570, '2025-03-15', 'Missing parts'),
  (617, 556, '2025-03-01', 'Customer cancellation'),
  (618, 568, '2025-03-13', 'Overheating issues'),
  (619, 575, '2025-03-20', 'Product recall'),
  (620, 580, '2025-03-25', 'Wrong shipment'),
  (631, 581, '2025-04-15', 'Too expensive for needs'),
  (632, 583, '2025-04-16', 'Child didn''t like the color'),
  (633, 545, '2025-04-17', 'Inaccurate health readings'),
  (634, 547, '2025-04-18', 'Incompatible with ISP'),
  (635, 549, '2025-04-19', 'Print quality issues'),
  (636, 542, '2025-04-20', 'Overheating problems'),
  (637, 544, '2025-04-21', 'Wrong color case delivered'),
  (638, 546, '2025-04-22', 'Mouse too small for hands'),
  (639, 548, '2025-04-23', 'SSD slower than advertised'),
  (640, 540, '2025-04-24', 'TV too large for space');
  
-- -----------------------------
-- 9. Warranties Table (40 rows)
-- -----------------------------
INSERT INTO Warranties (WarrantyID, ProductID, CustomerID, StartDate, EndDate) VALUES 
  (701,  101, 401, '2025-01-05', '2026-01-05'),
  (702,  104, 404, '2025-01-08', '2026-01-08'),
  (703,  107, 407, '2025-01-11', '2026-01-11'),
  (704,  110, 410, '2025-01-14', '2026-01-14'),
  (705,  113, 413, '2025-01-17', '2026-01-17'),
  (706,  116, 416, '2025-01-20', '2026-01-20'),
  (707,  119, 419, '2025-01-23', '2026-01-23'),
  (708,  122, 422, '2025-01-26', '2026-01-26'),
  (709,  125, 425, '2025-01-29', '2026-01-29'),
  (710,  128, 428, '2025-02-01', '2026-02-01'),
  (711,  131, 431, '2025-02-04', '2026-02-04'),
  (712,  134, 434, '2025-02-07', '2026-02-07'),
  (713,  137, 437, '2025-02-10', '2026-02-10'),
  (714,  140, 440, '2025-02-13', '2026-02-13'),
  (715,  143, 443, '2025-02-16', '2026-02-16'),
  (716,  146, 446, '2025-02-19', '2026-02-19'),
  (717,  149, 449, '2025-02-22', '2026-02-22'),
  (718,  102, 402, '2025-02-25', '2026-02-25'),
  (719,  105, 405, '2025-02-28', '2026-02-28'),
  (720,  108, 408, '2025-03-03', '2026-03-03'),
  (721,  111, 411, '2025-03-06', '2026-03-06'),
  (722,  114, 414, '2025-03-09', '2026-03-09'),
  (723,  117, 417, '2025-03-12', '2026-03-12'),
  (724,  120, 420, '2025-03-15', '2026-03-15'),
  (725,  123, 423, '2025-03-18', '2026-03-18'),
  (726,  126, 426, '2025-03-21', '2026-03-21'),
  (727,  129, 429, '2025-03-24', '2026-03-24'),
  (728,  132, 432, '2025-03-27', '2026-03-27'),
  (729,  135, 435, '2025-03-30', '2026-03-30'),
  (730,  138, 438, '2025-04-02', '2026-04-02'),
   (741, 151, 451, '2025-04-05', '2026-04-05'),
  (742, 152, 452, '2025-04-06', '2027-04-06'),
  (743, 153, 453, '2025-04-07', '2026-04-07'),
  (744, 154, 454, '2025-04-08', '2026-04-08'),
  (745, 155, 455, '2025-04-09', '2026-04-09'),
  (746, 156, 456, '2025-04-10', '2026-04-10'),
  (747, 157, 457, '2025-04-11', '2027-04-11'),
  (748, 158, 458, '2025-04-12', '2026-04-12'),
  (749, 159, 459, '2025-04-13', '2026-04-13'),
  (750, 160, 460, '2025-04-14', '2027-04-14');

-- -----------------------------
-- 10. SalesForecast Table (110 rows)
-- -----------------------------
INSERT INTO SalesForecast (ForecastID, ProductID, ForecastMonth, ForecastedSales) VALUES
  (801,  101, 'April',    55),
  (802,  102, 'April',    45),
  (803,  103, 'April',    75),
  (804,  104, 'April',    35),
  (805,  105, 'April',    50),
  (806,  106, 'April',    30),
  (807,  107, 'April',    60),
  (808,  108, 'April',    65),
  (809,  109, 'April',    85),
  (810,  110, 'April',    80),
  (811,  111, 'April',    40),
  (812,  112, 'April',    95),
  (813,  113, 'April',    45),
  (814,  114, 'April',    35),
  (815,  115, 'April',    55),
  (816,  116, 'April',    50),
  (817,  117, 'April',    70),
  (818,  118, 'April',    60),
  (819,  119, 'April',    40),
  (820,  120, 'April',    45),
  (821,  121, 'April',    35),
  (822,  122, 'April',    55),
  (823,  123, 'April',    65),
  (824,  124, 'April',    25),
  (825,  125, 'April',    80),
  (826,  126, 'April',    60),
  (827,  127, 'April',    40),
  (828,  128, 'April',    45),
  (829,  129, 'April',    95),
  (830,  130, 'April',    20),
  (831,  131, 'April',    50),
  (832,  132, 'April',    45),
  (833,  133, 'April',    70),
  (834,  134, 'April',    55),
  (835,  135, 'April',    85),
  (836,  136, 'April',    65),
  (837,  137, 'April',    75),
  (838,  138, 'April',    45),
  (839,  139, 'April',    90),
  (840,  140, 'April',    30),
  (841,  141, 'April',    50),
  (842,  142, 'April',    60),
  (843,  143, 'April',    40),
  (844,  144, 'April',    55),
  (845,  145, 'April',    65),
  (846,  146, 'April',    35),
  (847,  147, 'April',    50),
  (848,  148, 'April',    45),
  (849,  149, 'April',    80),
  (850,  150, 'April',    25),
  (851,  101, 'May',      60),
  (852,  102, 'May',      50),
  (853,  103, 'May',      80),
  (854,  104, 'May',      40),
  (855,  105, 'May',      55),
  (856,  106, 'May',      35),
  (857,  107, 'May',      65),
  (858,  108, 'May',      70),
  (859,  109, 'May',      90),
  (860,  110, 'May',      85),
  (861,  111, 'May',      45),
  (862,  112, 'May',      100),
  (863,  113, 'May',      50),
  (864,  114, 'May',      40),
  (865,  115, 'May',      60),
  (866,  116, 'May',      55),
  (867,  117, 'May',      75),
  (868,  118, 'May',      65),
  (869,  119, 'May',      45),
  (870,  120, 'May',      50),
  (871,  121, 'May',      40),
  (872,  122, 'May',      60),
  (873,  123, 'May',      70),
  (874,  124, 'May',      30),
  (875,  125, 'May',      85),
  (876,  126, 'May',      65),
  (877,  127, 'May',      45),
  (878,  128, 'May',      50),
  (879,  129, 'May',      100),
  (880,  130, 'May',      25),
  (881,  131, 'May',      55),
  (882,  132, 'May',      50),
  (883,  133, 'May',      75),
  (884,  134, 'May',      60),
  (885,  135, 'May',      90),
  (886,  136, 'May',      70),
  (887,  137, 'May',      80),
  (888,  138, 'May',      50),
  (889,  139, 'May',      95),
  (890,  140, 'May',      35),
  (891,  141, 'May',      55),
  (892,  142, 'May',      65),
  (893,  143, 'May',      45),
  (894,  144, 'May',      60),
  (895,  145, 'May',      70),
  (896,  146, 'May',      40),
  (897,  147, 'May',      55),
  (898,  148, 'May',      50),
  (899,  149, 'May',      85),
  (900,  150, 'May',      30),
  (901, 151, 'June',      65),
  (902, 152, 'June',      30),
  (903, 153, 'June',      90),
  (904, 154, 'June',      110),
  (905, 155, 'June',      75),
  (906, 156, 'June',      85),
  (907, 157, 'June',      50),
  (908, 158, 'June',      40),
  (909, 159, 'June',     35),
  (910, 160, 'June',     20);

 CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    SeasonName VARCHAR(50) NOT NULL
);

-- -----------------------------
-- 11. Seasons Table (4 rows)
-- -----------------------------
INSERT INTO Seasons (SeasonID, SeasonName)
VALUES 
(1, 'Winter'),
(2, 'Spring'),
(3, 'Summer'),
(4, 'Autumn');

-- -----------------------------
-- 12. Region Table (9 rows)
-- -----------------------------

insert into region
values
  (1, 'West'),
  (2, 'East'),
  (3, 'North'),
  (4, 'South'),
  (5, 'Central'),
  (6, 'Northeast'),
  (7, 'Southeast'),
  (8, 'Northwest'),
  (9, 'Southwest');

  select * from Seasons
  select * from Categories
  select * from Products
  select * from Customers
  select * from  Suppliers
  select * from Sales
  select * from SalesForecast
  select * from Warranties
  select * from Returns
  select * from ProductSupplier
  select * from CustomerSegments
  select * from Region
 


 --Display total sales, number of transactions, and average order value 
 --for electronic products

--Q1

select count(distinct SaleID) as TotalTransactions,
sum(QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) AS TotalSales,
sum(QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) / count(distinct SaleID) AS AvgOrderValue
from Sales s
join Products p on s.ProductID = p.ProductID;



--Visualize current stock levels for each electronic product, highlighting
--low-stock items for timely restocking

--Q2

select  p.ProductName,p.StockQuantity,c.CategoryName,
    case 
        when p.StockQuantity < 50 THEN 'Low Stock'
        when p.StockQuantity BETWEEN 50 AND 100 THEN 'Medium Stock'
        else 'High Stock'
    end AS StockStatus
from Products p
join Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.StockQuantity ASC;



--Analyze sales distribution across categories such as smartphones,
--laptops, headphones, and smartwatches

--Q3

select c.CategoryName,
sum(s.QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) as TotalSalesValue
from Sales s
join Products p on s.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName
order by TotalSalesValue desc;



--Identify best-selling electronic products within a specified period, with
--filters for category, region, and time. 

--Q4

select top 10 p.ProductName,
c.CategoryName,
sum(s.QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) as TotalSalesValue
from Sales s
join Products p on s.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by p.ProductName, c.CategoryName
order by TotalSalesValue desc;



--Analyze customer age, gender to tailor marketing
--strategies for electronic products.

--Q5

select Gender,Age,
count(*) as CustomerCount
from Customers
group by Gender, Age
order by Age, Gender;



--Track sales performance across different regions or cities to optimize
--inventory allocation and promotional campaigns

--Q6

select r.RName,
sum(s.QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) as TotalSalesValue
from Sales s
join Products p ON s.ProductID = p.ProductID
join Region r on r.RId=s.RId
group by r.RName
order by TotalSalesValue desc;



--Analyze monthly sales trends  with the ability
--to drill down into daily, weekly, or monthly data

--Q7

select FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
sum(QuantitySold * Products.UnitPrice * (1 - DiscountPercent / 100)) AS MonthlySales
from Sales
join Products ON Sales.ProductID = Products.ProductID
group by FORMAT(SaleDate, 'yyyy-MM')
Order by SaleMonth;



--Analyze supplier contributions by products supplied, sales volume,
--revenue generated, and quality metrics (returns and warranty claims).
--Identifies top-performing suppliers and potential quality issues.

--Q8

select s.SupplierName,sum(sa.QuantitySold) AS UnitsSold,
    count(distinct ps.ProductID) AS ProductsSupplied,
    sum(sa.QuantitySold * p.UnitPrice) AS RevenueGenerated,
    count(distinct r.ReturnID) AS ReturnsCount,
    count(distinct w.WarrantyID) AS WarrantyClaims,
    (count(distinct r.ReturnID) * 100.0 / sum(sa.QuantitySold)) AS ReturnRate
from Suppliers s
join ProductSupplier ps ON s.SupplierID = ps.SupplierID
join Products p ON ps.ProductID = p.ProductID
join Sales sa ON p.ProductID = sa.ProductID
left join Returns r ON sa.SaleID = r.SaleID
left join Warranties w ON p.ProductID = w.ProductID AND sa.CustomerID = w.CustomerID
group by s.SupplierName
order by RevenueGenerated DESC;



--Use historical sales data to create forecasts for upcoming months or
--quarters, aiding in inventory planning

--Q9
select ForecastMonth, sum(ForecastedSales) AS TotalForecast
from SalesForecast
group by ForecastMonth;



--Segment customers based on purchasing behavior related to
--electronics, enabling targeted marketing campaigns

--Q10

select cs.SegmentName,count(distinct c.CustomerID) AS CustomerCount,
sum(s.QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent/100))) AS TotalSalesValue
from Customers c
join CustomerSegments cs ON c.SegmentID = cs.SegmentID
join Sales s ON c.CustomerID = s.CustomerID
join Products p ON s.ProductID = p.ProductID
group by cs.SegmentName



--Provide an analysis of how discounts impact order volume by
--displaying the discount percentage alongside the count of orders for
--each discount level

--Q11

select  DiscountPercent,count(*) AS OrderCount
from Sales
group by DiscountPercent
order by DiscountPercent;



--Analyzing sales patterns based on different seasons

--	Q12
select se.SeasonName,count(distinct s.SaleID) AS TotalTransactions,
sum(s.QuantitySold * (p.UnitPrice * (1 - s.DiscountPercent / 100))) AS TotalSales  
from Sales s
join Products p ON s.ProductID = p.ProductID
join Seasons se ON 
        (month(s.SaleDate) IN (12, 1, 2) AND se.SeasonName = 'Winter') or
        (month(s.SaleDate) IN (3, 4, 5) AND se.SeasonName = 'Spring') or
        (month(s.SaleDate) IN (6, 7, 8) AND se.SeasonName = 'Summer') or
        (month(s.SaleDate) IN (9, 10, 11) AND se.SeasonName = 'Autumn')
group by se.SeasonName



--Compare sales performance between online and in-store channels for
--electronic products 

--Q13

select SalesChannel,
sum(QuantitySold * (p.UnitPrice * (1 - DiscountPercent/100))) as TotalSalesValue
from Sales s
join Products p on s.ProductID = p.ProductID
group by SalesChannel;



--Rank product categories by total units sold to identify market demand
--trends. Directs inventory procurement and category-level sales
--strategies.

--Q14

select c.CategoryName,sum(s.QuantitySold) as TotalUnitsSold
from Categories c
join Products p on c.CategoryID = p.CategoryID
join Sales s on p.ProductID = s.ProductID
group by c.CategoryName
order by  TotalUnitsSold desc;



--Monitor warranty claims and product returns to assess product
--performance and customer satisfaction.

--Q15

select c.CategoryName,count(distinct r.ReturnID) AS ReturnCount,
count(distinct w.WarrantyID) AS WarrantyCount,
count(distinct r.ReturnID) * 100.0 / count(distinct s.SaleID) AS ReturnRate
from Products p
join Categories c ON p.CategoryID = c.CategoryID
left join Sales s ON p.ProductID = s.ProductID
left join Returns r ON s.SaleID = r.SaleID
left join Warranties w ON p.ProductID = w.ProductID
group by c.CategoryName
order by ReturnRate DESC;

