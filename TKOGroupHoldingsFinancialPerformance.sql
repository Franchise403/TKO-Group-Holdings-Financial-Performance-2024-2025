--Create Database--
CREATE DATABASE TKOPerformanceDW;
--Import CSV files: TKOPerformance, UFCPerformance, WWEPerformance--


--Create DimQuarter with Quarter as Primary Key--
CREATE TABLE Dim_Quarter (
Quarter VARCHAR(10) NOT NULL PRIMARY KEY,
QuarterNumber INT NOT NULL,
QuarterStartDate DATE NOT NULL,
QuarterEndDate DATE NOT NULL,
Year INT NOT NULL
);
--Insert Data into DimQuarter--
INSERT INTO Dim_Quarter (
Quarter,
QuarterNumber,
QuarterStartDate,
QuarterEndDate,
Year
)
SELECT DISTINCT
Quarter,
QuarterNumber,
QuarterStartDate,
QuarterEndDate,
YEAR(QuarterStartDate) AS Year
FROM dbo.TKOPerformance;
--Confirm Table Creation--
SELECT * FROM dbo.Dim_Quarter;


--Create Fact_TKOPerformance with Quarter as Primary Key--
CREATE TABLE Fact_TKOPerformance (
Quarter VARCHAR(10) NOT NULL,
TKO_TotalRevenue_M DECIMAL(18,2),
TKO_AdjustedEBITDA_M DECIMAL(18,2),
TKO_OperatingExpenses_M DECIMAL(18,2),
TKO_OperatingIncome_M DECIMAL(18,2),
TKO_NetIncome_M DECIMAL(18,2),
TKO_MediaRightsRevenue_M DECIMAL(18,2),
TKO_SponsorshipRevenue_M DECIMAL(18,2),
TKO_LiveEventRevenue_M DECIMAL(18,2),
TKO_ConsumerProductsRevenue_M DECIMAL(18,2),
UFC_TotalRevenue_M DECIMAL(18,2),
WWE_TotalRevenue_M DECIMAL(18,2),
IMG_TotalRevenue_M DECIMAL(18,2),
Other_TotalRevenue_M DECIMAL(18,2),
CONSTRAINT PK_Fact_TKOFinancials 
PRIMARY KEY (Quarter),
CONSTRAINT FK_Fact_TKOFinancials_Quarter
FOREIGN KEY (Quarter)
REFERENCES Dim_Quarter(Quarter)
);
--Insert data into Fact_TKOPerformance--
INSERT INTO Fact_TKOPerformance (
Quarter,
TKO_TotalRevenue_M,
TKO_AdjustedEBITDA_M,
TKO_OperatingExpenses_M,
TKO_OperatingIncome_M,
TKO_NetIncome_M,
TKO_MediaRightsRevenue_M,
TKO_SponsorshipRevenue_M,
TKO_LiveEventRevenue_M,
TKO_ConsumerProductsRevenue_M,
UFC_TotalRevenue_M,
WWE_TotalRevenue_M,
IMG_TotalRevenue_M,
Other_TotalRevenue_M
)
SELECT
Quarter,
TKO_TotalRevenue_M,
TKO_AdjustedEBITDA_M,
TKO_OperatingExpenses_M,
TKO_OperatingIncome_M,
TKO_NetIncome_M,
TKO_MediaRightsRevenue_M,
TKO_SponsorshipRevenue_M,
TKO_LiveEventRevenue_M,
TKO_ConsumerProductsRevenue_M,
UFC_TotalRevenue_M,
WWE_TotalRevenue_M,
IMG_TotalRevenue_M,
Other_TotalRevenue_M
FROM dbo.TKOPerformance;
--Confirm Table Creation--
SELECT * FROM Fact_TKOPerformance;


--Create Fact_UFCPerformance with Quarter as Primary Key--
CREATE TABLE Fact_UFCPerformance (
Quarter VARCHAR(10) NOT NULL,
UFC_TotalRevenue_M DECIMAL(18,2),
UFC_MediaRightsRevenue_M DECIMAL(18,2),
UFC_LiveEventRevenue_M DECIMAL(18,2),
UFC_SponsorshipRevenue_M DECIMAL(18,2),
UFC_ConsumerProductsRevenue_M DECIMAL(18,2),
UFC_AnnouncedAttendanceTotal INT NOT NULL,
UFC_AnnouncedAttendancePLE INT NOT NULL,
UFC_AnnouncedAttendanceBroadcast INT NOT NULL,
UFC_TicketedEventsTotal INT NOT NULL,
UFC_TicketedEventsPLE INT NOT NULL,
UFC_TicketedEventsBroadcast INT NOT NULL,
CONSTRAINT PK_Fact_UFCPerformance
PRIMARY KEY (Quarter),
CONSTRAINT FK_Fact_UFCPerformance_Quarter
FOREIGN KEY (Quarter)
REFERENCES Dim_Quarter(Quarter)
);
--Insert data into Fact_UFCPerformance--
INSERT INTO Fact_UFCPerformance (
Quarter,
UFC_TotalRevenue_M,
UFC_MediaRightsRevenue_M,
UFC_LiveEventRevenue_M,
UFC_SponsorshipRevenue_M,
UFC_ConsumerProductsRevenue_M,
UFC_AnnouncedAttendanceTotal,
UFC_AnnouncedAttendancePLE,
UFC_AnnouncedAttendanceBroadcast,
UFC_TicketedEventsTotal,
UFC_TicketedEventsPLE,
UFC_TicketedEventsBroadcast
)
SELECT
Quarter,
UFC_TotalRevenue_M,
UFC_MediaRightsRevenue_M,
UFC_LiveEventRevenue_M,
UFC_SponsorshipRevenue_M,
UFC_ConsumerProductsRevenue_M,
UFC_AnnouncedAttendanceTotal,
UFC_AnnouncedAttendancePLE,
UFC_AnnouncedAttendanceBroadcast,
UFC_TicketedEventsTotal,
UFC_TicketedEventsPLE,
UFC_TicketedEventsBroadcast
FROM dbo.UFCPerformance;
--Confirm Table Creation--
SELECT * FROM Fact_UFCPerformance;


--Create Fact_WWEPerformance with Quarter as Primary Key--
CREATE TABLE Fact_WWEPerformance (
Quarter VARCHAR(10) NOT NULL,
WWE_TotalRevenue_M DECIMAL(18,2),
WWE_MediaRightsRevenue_M DECIMAL(18,2),
WWE_LiveEventRevenue_M DECIMAL(18,2),
WWE_SponsorshipRevenue_M DECIMAL(18,2),
WWE_ConsumerProductsRevenue_M DECIMAL(18,2),
WWE_EstimatedTicketsDistributedTotal INT NOT NULL,
WWE_EstimatedTicketsDistributedPLE INT NOT NULL,
WWE_EstimatedTicketsDistributedRAW INT NOT NULL,
WWE_EstimatedTicketsDistributedSmackDown INT NOT NULL,
WWE_EstimatedTicketsDistributedLiveEvent INT NOT NULL,
WWE_EstimatedTicketsDistributedNXT INT NOT NULL,
WWE_TicketedEventsTotal INT NOT NULL,
WWE_TicketedEventsPLE INT NOT NULL,
WWE_TicketedEventsRAW INT NOT NULL,
WWE_TicketedEventsSmackDown INT NOT NULL,
WWE_TicketedEventsLiveEvent INT NOT NULL,
WWE_TicketedEventsNXT INT NOT NULL,
CONSTRAINT PK_Fact_WWEPerformance
PRIMARY KEY (Quarter),
CONSTRAINT FK_Fact_WWEPerformance_Quarter
FOREIGN KEY (Quarter)
REFERENCES Dim_Quarter(Quarter)
);
--Insert data into Fact_WWEPerformance--
INSERT INTO Fact_WWEPerformance (
Quarter,
WWE_TotalRevenue_M,
WWE_MediaRightsRevenue_M,
WWE_LiveEventRevenue_M,
WWE_SponsorshipRevenue_M,
WWE_ConsumerProductsRevenue_M,
WWE_EstimatedTicketsDistributedTotal,
WWE_EstimatedTicketsDistributedPLE,
WWE_EstimatedTicketsDistributedRAW,
WWE_EstimatedTicketsDistributedSmackDown,
WWE_EstimatedTicketsDistributedLiveEvent,
WWE_EstimatedTicketsDistributedNXT,
WWE_TicketedEventsTotal,
WWE_TicketedEventsPLE,
WWE_TicketedEventsRAW,
WWE_TicketedEventsSmackDown,
WWE_TicketedEventsLiveEvent,
WWE_TicketedEventsNXT
)
SELECT
Quarter,
WWE_TotalRevenue_M,
WWE_MediaRightsRevenue_M,
WWE_LiveEventRevenue_M,
WWE_SponsorshipRevenue_M,
WWE_ConsumerProductsRevenue_M,
WWE_EstimatedTicketsDistributedTotal,
WWE_EstimatedTicketsDistributedPLE,
WWE_EstimatedTicketsDistributedRAW,
WWE_EstimatedTicketsDistributedSmackDown,
WWE_EstimatedTicketsDistributedLiveEvent,
WWE_EstimatedTicketsDistributedNXT,
WWE_TicketedEventsTotal,
WWE_TicketedEventsPLE,
WWE_TicketedEventsRAW,
WWE_TicketedEventsSmackDown,
WWE_TicketedEventsLiveEvent,
WWE_TicketedEventsNXT
FROM dbo.WWEPerformance
--Confirm Table Creation--
SELECT * FROM Fact_WWEPerformance;