DROP TABLE IF EXISTS "Country";
CREATE TABLE "Country" ("CountryID" INTEGER PRIMARY KEY  NOT NULL , "Country" TEXT);
INSERT INTO "Country" VALUES(1,'USA');
INSERT INTO "Country" VALUES(2,'Taiwan');
INSERT INTO "Country" VALUES(3,'China');
INSERT INTO "Country" VALUES(4,'Singapore');
DROP TABLE IF EXISTS "Manufacturer";
CREATE TABLE "Manufacturer" ("ManufacturerID" INTEGER PRIMARY KEY  NOT NULL , "Name" TEXT);
INSERT INTO "Manufacturer" VALUES(1,'Sprint Industries');
INSERT INTO "Manufacturer" VALUES(2,'Irdustrial Designs');
INSERT INTO "Manufacturer" VALUES(3,'Design Intl.');
DROP TABLE IF EXISTS "Product";
CREATE TABLE "Product" ("ProductID" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "Name" TEXT, "Details" TEXT, "Price" DOUBLE, "QuantityOnHand" INTEGER, "ManufactureID" INTEGER, "CountryOfForiginid" INTEGER, "Image" TEXT);
INSERT INTO "Product" VALUES(1,'WidgeA','Details of Widget A',1.29,5,'
1
1',2,'Canvas_2');
INSERT INTO "Product" VALUES(2,'WidgeB','Details of Widget B',4.29,15,1,2,'Canvas_2');
INSERT INTO "Product" VALUES(4,'WidgeA','Details of Widget A',1.29,1,1,2,'Canvas_2');
INSERT INTO "Product" VALUES(5,'WidgeX','Details of Widget X',0.29,25,1,3,'Canvas_3');
INSERT INTO "Product" VALUES(6,'WidgeY','Details of Widget Y',15.29,12,1,4,'Canvas_4');
INSERT INTO "Product" VALUES(7,'WidgeZ','Details of Widget Z',10.29,16,1,5,'Canvas_5');
INSERT INTO "Product" VALUES(8,'WidgeE','Details of Widget E',13.29,16,1,6,'Canvas_6');
