SET CMDSEP ;

DROP VIEW "FDQA_V_Test";

DROP TABLE "Order Details";

CREATE MULTISET TABLE "Order Details" (
       OrderID              INTEGER NOT NULL,
       ProductID            INTEGER NOT NULL,
       UnitPrice            DECIMAL(19,4) NOT NULL DEFAULT 0,
       Quantity             SMALLINT NOT NULL DEFAULT 1,
       Discount             REAL NOT NULL DEFAULT 0,
       CONSTRAINT "PK_OrderDetails" PRIMARY KEY (OrderID, ProductID)
);

DROP TABLE "Products";

CREATE MULTISET TABLE "Products" (
       ProductID            INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       ProductName          VARCHAR(40) CHARACTER SET UNICODE NOT NULL,
       SupplierID           INTEGER,
       CategoryID           INTEGER,
       QuantityPerUnit      VARCHAR(20) CHARACTER SET UNICODE,
       UnitPrice            DECIMAL(15,5) DEFAULT 0,
       UnitsInStock         SMALLINT DEFAULT 0,
       UnitsOnOrder         SMALLINT DEFAULT 0,
       ReorderLevel         SMALLINT DEFAULT 0,
       Discontinued         DECIMAL(1,0) NOT NULL DEFAULT 0,
       CONSTRAINT "PK_Products" PRIMARY KEY (ProductID)
);

DROP TABLE "Categories";

CREATE MULTISET TABLE "Categories" (
       CategoryID           INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       CategoryName         VARCHAR(15) CHARACTER SET UNICODE NOT NULL,
       Description          CLOB CHARACTER SET UNICODE,
       Picture              BLOB,
       CONSTRAINT "PK_Categories" PRIMARY KEY (CategoryID)
);

DROP TABLE "Suppliers";

CREATE MULTISET TABLE "Suppliers" (
       SupplierID           INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       CompanyName          VARCHAR(40) CHARACTER SET UNICODE NOT NULL,
       ContactName          VARCHAR(30) CHARACTER SET UNICODE,
       ContactTitle         VARCHAR(30) CHARACTER SET UNICODE,
       Address              VARCHAR(60) CHARACTER SET UNICODE,
       City                 VARCHAR(15) CHARACTER SET UNICODE,
       Region               VARCHAR(15) CHARACTER SET UNICODE,
       PostalCode           VARCHAR(10) CHARACTER SET UNICODE,
       Country              VARCHAR(15) CHARACTER SET UNICODE,
       Phone                VARCHAR(24) CHARACTER SET UNICODE,
       Fax                  VARCHAR(24) CHARACTER SET UNICODE,
       HomePage             VARCHAR(30000) CHARACTER SET UNICODE,
       CONSTRAINT "PK_Suppliers" PRIMARY KEY (SupplierID)
);

DROP TABLE "EmployeeTerritories";

CREATE MULTISET TABLE "EmployeeTerritories" (
       EmployeeID           INTEGER NOT NULL,
       TerritoryID          VARCHAR(20) CHARACTER SET UNICODE NOT NULL,
       CONSTRAINT "PK_EmplTerrit" PRIMARY KEY (EmployeeID, TerritoryID)
);

DROP TABLE "Territories";

CREATE MULTISET TABLE "Territories" (
       TerritoryID          VARCHAR(20) CHARACTER SET UNICODE NOT NULL,
       TerritoryDescription CHAR(50) CHARACTER SET UNICODE NOT NULL,
       RegionID             INTEGER NOT NULL,
       CONSTRAINT "PK_Territories" PRIMARY KEY (TerritoryID)
);

DROP TABLE "Region";

CREATE MULTISET TABLE "Region" (
       RegionID             INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       RegionDescription    VARCHAR(50) CHARACTER SET UNICODE NOT NULL,
       CONSTRAINT "PK_Region" PRIMARY KEY (RegionID)
);

DROP TABLE "Orders";

CREATE MULTISET TABLE "Orders" (
       OrderID              INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       CustomerID           CHAR(5) CHARACTER SET UNICODE,
       EmployeeID           INTEGER,
       OrderDate            DATE,
       RequiredDate         DATE,
       ShippedDate          DATE,
       ShipVia              INTEGER,
       Freight              DECIMAL(15,5) DEFAULT 0,
       ShipName             VARCHAR(40) CHARACTER SET UNICODE,
       ShipAddress          VARCHAR(60) CHARACTER SET UNICODE,
       ShipCity             VARCHAR(15) CHARACTER SET UNICODE,
       ShipRegion           VARCHAR(15) CHARACTER SET UNICODE,
       ShipPostalCode       VARCHAR(10) CHARACTER SET UNICODE,
       ShipCountry          VARCHAR(15) CHARACTER SET UNICODE,
       CONSTRAINT "PK_Orders" PRIMARY KEY (OrderID)
);

DROP TABLE "Employees";

CREATE MULTISET TABLE "Employees" (
       EmployeeID           INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       LastName             VARCHAR(20) CHARACTER SET UNICODE NOT NULL,
       FirstName            VARCHAR(10) CHARACTER SET UNICODE NOT NULL,
       "Title"              VARCHAR(30) CHARACTER SET UNICODE,
       TitleOfCourtesy      VARCHAR(25) CHARACTER SET UNICODE,
       BirthDate            DATE,
       HireDate             DATE,
       Address              VARCHAR(60) CHARACTER SET UNICODE,
       City                 VARCHAR(15) CHARACTER SET UNICODE,
       Region               VARCHAR(15) CHARACTER SET UNICODE,
       PostalCode           VARCHAR(10) CHARACTER SET UNICODE,
       Country              VARCHAR(15) CHARACTER SET UNICODE,
       HomePhone            VARCHAR(24) CHARACTER SET UNICODE,
       Extension            VARCHAR(4) CHARACTER SET UNICODE,
       Photo                BLOB,
       Notes                CLOB CHARACTER SET UNICODE,
       ReportsTo            INTEGER,
       PhotoPath            VARCHAR(255) CHARACTER SET UNICODE,
       CONSTRAINT "PK_Employees" PRIMARY KEY (EmployeeID)
);

DROP TABLE "Shippers";

CREATE MULTISET TABLE "Shippers" (
       ShipperID            INTEGER NOT NULL GENERATED BY DEFAULT
                            AS IDENTITY (START WITH 1 INCREMENT BY 1 NO CYCLE ),
       CompanyName          VARCHAR(40) CHARACTER SET UNICODE NOT NULL,
       Phone                VARCHAR(24) CHARACTER SET UNICODE,
       CONSTRAINT "PK_Shippers" PRIMARY KEY (ShipperID)
);

DROP TABLE "CustomerCustomerDemo";

CREATE MULTISET TABLE "CustomerCustomerDemo" (
       CustomerID           CHAR(5) CHARACTER SET UNICODE NOT NULL,
       CustomerTypeID       CHAR(10) CHARACTER SET UNICODE NOT NULL,
       CONSTRAINT "PK_CustCustDemo" PRIMARY KEY (CustomerID, CustomerTypeID)
);

DROP TABLE "CustomerDemographics";

CREATE MULTISET TABLE "CustomerDemographics" (
       CustomerTypeID       CHAR(10) CHARACTER SET UNICODE NOT NULL,
       CustomerDesc         CLOB CHARACTER SET UNICODE,
       CONSTRAINT "PK_CustDemogr" PRIMARY KEY (CustomerTypeID)
);

DROP TABLE "Customers";

CREATE MULTISET TABLE "Customers" (
       CustomerID           CHAR(5) CHARACTER SET UNICODE NOT NULL,
       CompanyName          VARCHAR(40) CHARACTER SET UNICODE NOT NULL,
       ContactName          VARCHAR(30) CHARACTER SET UNICODE,
       ContactTitle         VARCHAR(30) CHARACTER SET UNICODE,
       Address              VARCHAR(60) CHARACTER SET UNICODE,
       City                 VARCHAR(15) CHARACTER SET UNICODE,
       Region               VARCHAR(15) CHARACTER SET UNICODE,
       PostalCode           VARCHAR(10) CHARACTER SET UNICODE,
       Country              VARCHAR(15) CHARACTER SET UNICODE,
       Phone                VARCHAR(24) CHARACTER SET UNICODE,
       Fax                  VARCHAR(24) CHARACTER SET UNICODE,
       CONSTRAINT "PK_Customers" PRIMARY KEY (CustomerID)
);    
