DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS Parameters;
DROP TABLE IF EXISTS Symbols;

CREATE TABLE Symbols (
Symbol_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Symbol VARCHAR(20) NOT NULL,
CONSTRAINT unique_content UNIQUE (Symbol)
);

CREATE TABLE Parameters (
Parameter_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
StartTime TIMESTAMP NOT NULL,
StartAmount DECIMAL(38,18) UNSIGNED NOT NULL,
MaxOrderAmount DECIMAL(38,18) UNSIGNED NOT NULL,
MaxRunningOrders INT NOT NULL,
TimeDifferenceBetweenOrders BIGINT UNSIGNED NOT NULL,
FeesPercentage DECIMAL(5,2) SIGNED NOT NULL,
DesiredGainPercentage DECIMAL(5,2) SIGNED NOT NULL,
StopLossTriggerPercentage DECIMAL(5,2) SIGNED NOT NULL,
CONSTRAINT unique_content UNIQUE (Parameter_ID)
);

CREATE TABLE Prices (
Price_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Symbol_ID INT NOT NULL,
PriceTime TIMESTAMP NOT NULL,
AvgOpenClosePrice DECIMAL(38,18) UNSIGNED NOT NULL,
LowPrice DECIMAL(38,18) UNSIGNED NOT NULL,
CONSTRAINT fk_pr_symbol_id FOREIGN KEY (Symbol_ID) REFERENCES Symbols(Symbol_ID),
CONSTRAINT unique_content UNIQUE (Symbol_ID, PriceTime)
);

CREATE TABLE Orders (
Order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Symbol_ID INT NOT NULL,
Parameter_ID INT NOT NULL,
OrderTime TIMESTAMP NOT NULL,
OrderPrice DECIMAL(38,18) UNSIGNED NOT NULL,
OrderAmount DECIMAL(38,18) UNSIGNED NOT NULL,
SettlementTime TIMESTAMP NULL,
SettlementPrice DECIMAL(38,18) UNSIGNED,
Profit DECIMAL(38,18) SIGNED,
CONSTRAINT fk_or_symbol_id FOREIGN KEY (Symbol_ID) REFERENCES Symbols(Symbol_ID),
CONSTRAINT fk_or_parameter_id FOREIGN KEY (Parameter_ID) REFERENCES Parameters(Parameter_ID),
CONSTRAINT unique_content UNIQUE (Symbol_ID, Parameter_ID, OrderTime)
);


INSERT INTO symbols (Symbol) VALUES ('QTUMUSDT');

INSERT INTO parameters (StartTime, StartAmount, MaxOrderAmount, MaxRunningOrders, TimeDifferenceBetweenOrders, FeesPercentage, DesiredGainPercentage, StopLossTriggerPercentage) VALUES ('2018-03-19 09:48:00', 1000, 100, 10, 7200000, 0.2, 2, 3);


