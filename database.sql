create table Branch 
( 
Branch_ID varchar(4) PRIMARY KEY NOT NULL, 
Address_Line_1 varchar(30) NOT NULL, 
Address_Line_2 varchar(20) NOT NULL, 
Postcode varchar(8) NOT NULL, 
Contact_Number varchar(12) NOT NULL, 
Email_Address varchar (60) NOT NULL 
);

create table employee 
( 
Employee_ID varchar(5) PRIMARY KEY NOT NULL, 
Branch_ID varchar(4)NOT NULL, 
Employee_Name varchar (25) NOT NULL, 
Date_Of_Birth Date, 
Email_Address varchar(60) NOT NULL, 
Salary number, 
National_Insurance_Number char(13) NOT NULL, 
Start_Date Date, 
Contact_Number varchar(12) NOT NULL, 
Home_Number varchar(12) NOT NULL, 
Staff_Bonus number, 
Job_Title varchar(12) NOT NULL, 
constraint fk_Branch_ID foreign key (Branch_ID) 
references Branch (Branch_ID) 
);
create table Buyer 
( 
Buyer_ID varchar(5) PRIMARY KEY NOT NULL, 
Employee_ID varchar(5), 
Full_Name varchar(40) not null, 
Budget number, 
Contact_Number varchar(12) not null, 
Mobile_Number varchar(12) not null, 
Email_Address varchar(60) not null, 
Rooms_Wanted number,
FOREIGN KEY (Employee_ID) references employee(Employee_ID) 
);
create table Property_Seller  
(  
Seller_ID varchar(5) PRIMARY KEY NOT NULL,  
Employee_ID varchar(5)not null,  
Owner_Name varchar (40) not null,  
Owner_Email varchar(60) not null,  
Contact_Number varchar(12) not null,  
Amount_Owed number, 
FOREIGN KEY (employee_ID) references employee(Employee_ID)  
);
create table Property
(
House_ID varchar(5) PRIMARY KEY NOT NULL,
Branch_ID varchar(5) NOT NULL,
Seller_ID varchar(5) NOT NULL UNIQUE,
Address_Line_1 varchar(40) not null,
Address_Line_2 varchar(30),
Address_Line_3 varchar (30),
Postcode varchar (8) not null,
Asking_Price number Not null,
No_Of_Rooms number not null,
Sale_Status varchar (10),
Fixtures_And_Fittings varchar (200),
FOREIGN KEY (Branch_ID) references branch(Branch_ID),
FOREIGN KEY (Seller_ID) references property_Seller(Seller_ID)
);
create table Property_Advert
(
House_ID varchar(5) not null,
Advert_Price number not null,
Advert_Company varchar(20),
Days_Advertised number  not null,
FOREIGN KEY (House_ID) references Property(House_ID)
);
create table Survey
(
House_ID varchar(5) not null,
Buyer_ID varchar(5) not null,
Survey_Date Date,
Survey_Cost number,
Surveyor_Name varchar(40),
Contact_Number varchar(12),
Email_Address varchar(60),
FOREIGN KEY (House_ID) references Property(House_ID),
FOREIGN KEY (Buyer_ID) references Buyer(Buyer_ID)
);
create table Appointment
(
House_ID varchar(5) not null,
Buyer_ID varchar(5) not null,
Appointment_Date Date,
FOREIGN KEY (Buyer_ID) references buyer(Buyer_ID),
FOREIGN KEY (House_ID) references property(House_ID)
);

CREATE TABLE Sold_Property
(
Branch_ID varchar(4),
Address_Line_1 varchar(40) not null,
Address_Line_2 varchar(30),
Address_Line_3 varchar (30),
Postcode varchar (8) not null,
Seller_Name varchar(40),
Buyer_Name varchar(40),
Contract_Price number,
Date_Of_Sale Date,
FOREIGN KEY (Branch_ID) references Branch(Branch_ID)
);

create table Offer
(
House_ID varchar(5) unique not null,
Offer_Amount number not null,
FOREIGN KEY (House_ID) references Property (House_ID)
);

INSERT INTO Branch  VALUES (1007,'152-284 Egestas. Av.','Yeongcheon','X95 2YL','02568 087311','massa@Phasellus.com');
INSERT INTO Branch  VALUES (3341,'Ap #182-5544 Sem, Rd.','Ransart','WL41 1OB','00744 138096','Nullam@apurus.co.uk');
INSERT INTO Branch  VALUES (5675,'682-3513 Lacinia Ave','Kotli','PH32 0RF','00837 592165','Nullam.velit.dui@Etiamlaoreet.com');
INSERT INTO Branch  VALUES (8009,'P.O. Box 704, 6739 Eu Av.','Annapolis Royal','B67 7ZY','03290 097839','erat@vitaeodio.com');

INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('99907','8009','Victor Freeman','27-Oct-72','blandit@blanditNamnulla.co.uk',32365,'01057 694761','02-Jul-20','01161 437651','01095 922937',2659,'et');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('79630','5675','Bianca Mcpherson','29-Dec-90','velit.Cras.lorem@dolorsit.org',85849,'01437 413647','13-May-08','01592 334909','01971 689877',1087,'purus,');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('17826','5675','Leigh Durham','18-Apr-82','odio@idlibero.ca',57890,'01382 487904','27-Oct-20','01197 185977','01699 919137',6232,'sit');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('61472','1007','Eric Middleton','04-Aug-91','cursus.non.egestas@eu.net',79311,'01651 193546','03-Sep-16','01303 458547','01894 977623',4038,'egestas,');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('23029','3341','Derek Potter','31-Dec-79','justo.faucibus@nuncInat.co.uk',92824,'01880 177936','03-Feb-04','01656 449320','01309 526685',5790,'neque');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('85401','3341','Hashim Hart','03-Nov-83','Duis.elementum.dui@Donec.org',73942,'01857 662677','11-Apr-20','01339 452613','01161 289531',2452,'malesuada');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('88605','1007','Catherine Haynes','02-Oct-80','sit.amet@nec.co.uk',42107,'01047 745859','18-Oct-15','01330 533227','01903 420821',1775,'ac');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('60195','1007','Sopoline Vazquez','20-Sep-43','nisl.sem@tempus.net',23581,'01211 479315','14-Jan-12','01238 510967','01391 413334',3439,'diam');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('31446','5675','Maxine Baxter','06-Feb-52','ac.metus.vitae@accumsaninterdumlibero.ca',40117,'01016 893761','19-Mar-13','01883 235069','01163 019453',7018,'blandit');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('37745','1007','Micah Sanchez','16-Dec-98','Nunc.commodo.auctor@vitaevelit.edu',36366,'01845 521254','18-Jan-05','01107 912782','01765 963314',7455,'enim');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('78372','3341','May Pickett','10-Aug-67','augue.Sed@nequevenenatislacus.co.uk',96761,'01070 354675','30-Aug-05','01999 785733','01570 685584',7812,'Nulla');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('21710','5675','Tiger Lang','22-Apr-54','urna.et@vitaeodiosagittis.co.uk',31161,'01647 903357','14-Apr-05','01746 861635','01540 394366',5932,'Aliquam');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('41521','3341','Whitney Ramirez','17-May-45','posuere@Duisdignissim.com',91698,'01700 265291','27-Dec-05','01199 958476','01790 952958',2276,'sed');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('38613','8009','Aline Knapp','27-Dec-46','consequat.auctor.nunc@lobortisquam.co.uk',97972,'01465 012117','16-Jul-05','01092 141735','01345 694217',2631,'placerat');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('74261','1007','Florence Castillo','23-Feb-57','et.tristique.pellentesque@Nullamfeugiatplacerat.edu',48859,'01138 473181','18-Dec-07','01855 013790','01308 296100',556,'tristique');
INSERT INTO Employee (Employee_ID,Branch_ID,Employee_Name,Date_Of_Birth,Email_Address,Salary,National_Insurance_Number,Start_Date,Contact_Number,Home_Number,Staff_Bonus,Job_Title) VALUES ('13236','3341','Ciaran Snow','17-Feb-53','at@dictum.edu',79142,'01098 873647','26-Sep-02','01159 849398','01085 695540',8443,'vestibulum.');

INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('35','17826','Ezekiel Parsons',570508,'01610 806673','01037 813239','id.ante@turpisegestas.edu',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('28','21710','Todd Bond',655165,'01106 944324','01166 396015','quis.arcu@tinciduntDonecvitae.net',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','17826','Lareina Little',863165,'01819 797504','01617 983001','ornare.placerat@lectus.com',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('46','31446','Piper Christian',159769,'01000 427673','01221 142536','laoreet@tacitisociosquad.co.uk',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('32','17826','Noel Clark',583922,'01944 636325','01345 489401','fringilla.ornare@Maurisnulla.ca',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('31','78372','Anjolie Daniels',556622,'01591 603512','01101 615948','quis.urna.Nunc@arcuAliquamultrices.co.uk',18);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('32','61472','Diana Tucker',572714,'01875 294259','01641 711676','Fusce@SedmolestieSed.com',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('11','85401','Genevieve Wyatt',610303,'01747 208960','01768 268240','adipiscing.ligula.Aenean@Proinsed.org',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','78372','Talon Conway',715753,'01295 967292','01140 582448','Nullam@nonummyultricies.net',16);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('10','21710','Fredericka Small',363445,'01436 009308','01904 486898','urna.justo@tempor.org',16);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('21','79630','Skyler Mcdaniel',905202,'01596 235536','01844 571868','Fusce@quam.co.uk',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('39','79630','Hiram Osborn',348713,'01136 962434','01351 079917','risus@sitamet.edu',19);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('32','23029','Keegan Floyd',105916,'01913 699067','01713 031701','eu@Inlorem.net',8);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('23','23029','Madaline Warner',468383,'01855 224751','01689 486020','mauris.erat@vehiculaetrutrum.com',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('37','85401','Drake Hooper',747734,'01869 291041','01172 544199','dolor.Donec@loremauctorquis.edu',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('35','17826','Reese Harper',430087,'01342 025667','01464 079513','arcu.iaculis.enim@eu.edu',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','74261','Cruz Alvarez',432831,'01477 248104','01084 862776','metus.Aenean@dignissimMaecenasornare.ca',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('47','60195','Lois Hartman',708164,'01590 734991','01022 938086','mus.Donec@turpisNulla.com',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','85401','Allen Nunez',438276,'01792 592064','01212 159315','tristique.ac@augueeutellus.org',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('28','61472','William Keller',421991,'01104 273188','01518 168064','Curae@Quisquelibero.co.uk',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('16','85401','Callum Randall',331441,'01650 481401','01920 657955','quis@euelitNulla.net',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','37745','Maia Logan',523412,'01261 276040','01171 017208','nisl.elementum@vel.co.uk',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('31','31446','Todd Short',344092,'01255 600825','01088 121770','sit.amet.consectetuer@aliquamarcu.co.uk',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('19','78372','Ruby Collier',847924,'01156 214407','01437 437994','libero@dolorDonecfringilla.com',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('32','78372','Yoshio Crawford',399883,'01802 666187','01926 677318','at.velit@Crasvulputate.co.uk',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('36','21710','Honorato Goodwin',176369,'01838 823315','01507 440539','est.tempor@Donec.org',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('39','60195','Anastasia Mathews',706582,'01316 732882','01718 028447','massa.non@musProinvel.edu',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('43','21710','Addison Rodriquez',622123,'01236 290766','01171 797119','Nullam.velit.dui@convalliserateget.ca',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','17826','Vanna Reynolds',274664,'01295 362184','01741 691259','orci.Donec@Donecnibh.net',19);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('25','37745','Jack Williams',866797,'01123 317572','01233 532860','Suspendisse.aliquet.molestie@volutpat.co.uk',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('46','37745','Shelby Russell',175013,'01170 433628','01001 601492','fermentum@lectus.org',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('17','17826','Drew Rodriguez',702038,'01129 299214','01340 603221','sed.sapien@Suspendissetristique.org',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('36','88605','Cole Figueroa',410863,'01848 233888','01834 806638','volutpat.nunc@Curabitursedtortor.co.uk',5);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','17826','Bree French',418190,'01345 345088','01308 809336','In@arcuSed.net',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('38','99907','Allegra Park',658023,'01381 196539','01089 440536','mi@elit.net',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('22','99907','Dennis Reeves',136730,'01326 487026','01455 034997','vel.venenatis.vel@ac.co.uk',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('17','79630','Colby Hart',437714,'01908 677636','01448 877614','Sed@odio.org',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','99907','Kiona Crawford',734899,'01346 508212','01772 564658','a.neque.Nullam@cursusluctus.edu',14);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('49','21710','Edan Perez',488461,'01546 424761','01539 089091','est@feugiat.com',19);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','21710','Uriel Russell',173673,'01748 142056','01124 677880','bibendum@Donecfringilla.ca',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('17','61472','Kalia Huff',562618,'01754 322988','01730 205363','tortor@Phasellusataugue.net',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('47','74261','Lana Kennedy',108035,'01839 962797','01984 185529','Lorem.ipsum@fermentumarcuVestibulum.org',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('29','60195','Mollie Dyer',718766,'01221 977844','01516 851129','varius.ultrices@noncursusnon.ca',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('39','37745','Quinlan Daniels',508259,'01241 871657','01320 454542','id.nunc.interdum@lectussit.com',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','78372','Kieran Larson',201713,'01869 816381','01318 286971','ac@ultrices.com',17);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('38','88605','Daniel Dodson',485706,'01463 889867','01019 759549','ultricies.dignissim@Aliquam.org',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('48','60195','Genevieve Durham',125624,'01690 525116','01779 875887','velit.eu@elitpellentesque.org',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','88605','Doris Atkinson',656364,'01522 000906','01157 541393','eu.odio@interdumligula.net',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','41521','Kelsey Hawkins',483768,'01743 678111','01855 506915','Proin.vel@etultrices.ca',5);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('25','88605','Griffith Miranda',378810,'01720 081100','01650 462086','et@vehicula.edu',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('10','38613','Chiquita Ayers',159748,'01083 164296','01710 144241','metus@erosnectellus.net',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('37','79630','Sarah Alvarado',248188,'01080 513758','01521 157302','ullamcorper.viverra@vulputate.edu',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('46','41521','Ray Bass',590706,'01211 702583','01793 477907','tristique.pellentesque.tellus@mollisduiin.org',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('35','78372','Rebekah Dunlap',761223,'01567 979500','01696 171621','sagittis.semper.Nam@Morbi.net',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('32','17826','Armando Dennis',632132,'01787 337005','01983 797871','In@metusIn.ca',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('36','99907','Kato Webb',874834,'01235 755194','01594 594534','Mauris.vestibulum@ipsumdolorsit.ca',14);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','21710','Vladimir Ellison',993700,'01912 243408','01714 816552','sem@commodoauctorvelit.com',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('17','99907','Cheryl Wiggins',350589,'01183 530110','01854 880599','enim.nisl@cursus.co.uk',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','61472','Mufutau Lane',497694,'01121 101570','01070 467087','Cras.eu@sed.ca',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','78372','Madison Roberson',545788,'01263 035633','01699 510668','porta.elit@risusDonec.co.uk',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','61472','Tyrone Rivera',739513,'01703 267607','01377 364611','magna@liberoduinec.net',8);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('50','17826','Jack Roman',981568,'01287 497142','01153 461797','mattis.ornare.lectus@DonecegestasDuis.ca',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('11','21710','Stacy Vinson',961240,'01371 055393','01673 235994','Nam.ligula.elit@Morbi.co.uk',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','61472','Yael Sandoval',758636,'01595 385218','01260 697993','lobortis.quam@id.co.uk',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('19','31446','Belle Gillespie',266591,'01477 300242','01011 858391','sed@ut.co.uk',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('30','61472','Fatima Velazquez',517493,'01816 128749','01694 807028','et.pede.Nunc@scelerisquesed.org',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('16','78372','Dawn Conrad',203874,'01167 242856','01334 337072','diam@CraspellentesqueSed.net',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','74261','Quinn Hood',287491,'01868 783555','01563 451303','montes.nascetur.ridiculus@Nuncquis.com',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('30','37745','Halee Pratt',679544,'01460 903588','01715 672639','taciti.sociosqu.ad@convallis.com',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('27','37745','Todd Morris',176684,'01232 480385','01177 403319','mollis@semmollisdui.co.uk',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('25','37745','Jenna Lester',255889,'01892 059290','01766 096754','luctus.ut@interdumenimnon.com',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('37','60195','Fitzgerald Flynn',321275,'01227 678081','01193 794522','mattis.semper.dui@facilisis.co.uk',17);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','85401','Emi Cabrera',455473,'01475 634720','01426 476399','Duis@nunc.co.uk',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('48','61472','Hyatt Norman',320775,'01800 478647','01124 532250','Suspendisse.sagittis@sollicitudinorcisem.org',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('47','85401','Jaime Mckenzie',678167,'01183 720225','01995 037989','eu@risusQuisquelibero.com',2);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('50','41521','Wade Nelson',693355,'01508 858312','01261 836322','ut.lacus@arcuSed.net',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('35','17826','Quincy Cortez',374622,'01494 358670','01217 321414','a@ullamcorper.com',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('47','88605','Tanisha Dawson',872322,'01300 006865','01233 646280','pretium.aliquet@dictumaugue.com',4);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('11','60195','Dane Walton',219268,'01954 941104','01678 179904','nibh.lacinia@lobortis.org',5);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','38613','Odysseus Vazquez',111663,'01789 537812','01830 584031','libero.nec@ultricessitamet.edu',16);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('39','61472','Fitzgerald Berry',460981,'01448 335548','01673 244184','sed@sitamet.ca',6);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('43','17826','Evangeline Singleton',765439,'01220 064273','01341 752462','luctus.ut@rhoncus.edu',7);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('12','60195','Cade Marks',186772,'01333 608998','01135 847019','pretium.aliquet@Proin.edu',8);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('13','60195','Blaze Pena',323766,'01858 357051','01617 933148','nec.cursus@acarcuNunc.co.uk',9);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('49','23029','Kai Baker',126851,'01377 524839','01043 469791','Phasellus.dapibus.quam@purusaccumsan.ca',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('35','41521','Tamara Lara',135082,'01496 931876','01876 310281','massa.Mauris@neque.edu',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('20','74261','Camden Rodgers',973282,'01969 831219','01028 745988','Quisque.porttitor.eros@porttitor.com',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('49','61472','Dominic Alford',376216,'01039 621826','01715 147724','montes.nascetur.ridiculus@afeugiat.co.uk',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('21','60195','Xaviera Alvarez',300990,'01349 255705','01739 212065','libero@Praesentinterdum.edu',14);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('33','85401','Abdul Gonzalez',443401,'01413 466149','01395 655990','nisi.Mauris@justosit.edu',15);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','78372','Bradley Harrell',414220,'01055 464627','01953 798953','non@posuereatvelit.co.uk',16);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('15','38613','Demetrius Cline',734883,'01836 396970','01699 169196','odio.tristique.pharetra@commodoauctor.net',17);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','17826','Lee Rodgers',259264,'01605 177307','01406 699694','montes@at.org',12);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('25','61472','Alexis Lott',422485,'01989 312675','01924 039629','Cras.eget@rutrum.edu',13);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('45','38613','Logan Wilder',581263,'01191 125784','01578 585707','arcu.iaculis@Quisque.org',10);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('21','41521','Alvin Pruitt',967808,'01545 212584','01162 671259','ut@eget.edu',3);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('41','78372','India Mendez',951242,'01916 779657','01374 877062','in@vitaealiquameros.net',11);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('16','61472','Chaim Foley',486445,'01528 632615','01368 394639','cursus.a.enim@facilisis.org',1);
INSERT INTO Buyer (Buyer_ID,Employee_ID,Full_Name,Budget,Contact_Number,Mobile_Number,Email_Address,Rooms_Wanted) VALUES ('25','31446','Coby Rosa',573232,'01434 706820','01533 391736','Fusce.dolor@liberoettristique.edu',1);

INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (736,'41521','Kiayada Sykes','montes.nascetur@auctornonfeugiat.ca','01500 017606',8592);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (229,'41521','Isaiah Nichols','lectus.justo.eu@tristiquepharetraQuisque.org','01746 796800',2107);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (403,'74261','Lenore Freeman','cursus.luctus@senectusetnetus.net','01120 306061',4100);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (236,'38613','Quin Bond','malesuada.vel@eleifendegestasSed.com','01463 889253',362);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (544,'60195','Brody Burt','a.odio.semper@purus.net','01776 302865',77);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (656,'88605','Ferris Harris','neque.tellus@tincidunt.net','01757 341854',2843);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (464,'17826','Jameson Stein','ultrices@ipsumleoelementum.co.uk','01545 708424',4897);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (626,'37745','August Wong','non.justo.Proin@Crasconvallisconvallis.net','01105 586309',9591);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (625,'23029','Vernon Barnett','libero.Donec@ligulaNullamenim.com','01675 710825',9924);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (413,'31446','Brett Acosta','elementum.at.egestas@arcuNuncmauris.ca','01677 386473',7244);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (302,'23029','Elton Peterson','aliquam@consequatpurusMaecenas.co.uk','01874 100706',8156);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (306,'74261','Brian Bartlett','elit.pretium.et@nulla.com','01076 489418',1530);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (608,'74261','Hop Burgess','ac.fermentum.vel@tinciduntDonecvitae.org','01001 291259',4864);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (242,'74261','Jolene Burton','ultricies@egestasAliquamfringilla.net','01283 141062',8742);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (114,'23029','Ralph Curtis','faucibus@venenatisvel.net','01701 035402',6095);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (639,'85401','Flavia Casey','aliquet.magna.a@egestasnuncsed.ca','01645 602981',7838);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (868,'31446','Anastasia Mendoza','sed.pede@tortor.ca','01978 704466',1338);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (529,'31446','Boris Duffy','dui@elit.org','01347 692213',6981);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (513,'21710','Jescie Murray','fames@semmagna.edu','01201 899278',3030);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (744,'60195','Cody Roy','a.sollicitudin.orci@rhoncusNullam.edu','01329 975519',4106);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (701,'23029','Clayton Walton','Cras@orciluctus.org','01504 139084',6532);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (209,'79630','Boris Fischer','dolor.sit.amet@ascelerisque.ca','01232 864376',4191);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (833,'41521','Liberty Branch','diam@musDonecdignissim.com','01786 434945',1108);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (275,'41521','Marvin Suarez','lobortis.quis.pede@odiotristiquepharetra.edu','01372 993259',83);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (343,'61472','Odette Bray','Aliquam.tincidunt@Phasellusfermentumconvallis.com','01053 988844',9388);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (371,'38613','Tallulah Orr','velit.eget.laoreet@acrisusMorbi.org','01278 943886',2030);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (372,'60195','Joelle Gardner','sit.amet@fringilla.net','01026 083426',5914);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (508,'41521','Tyrone Powell','Nunc@vitae.org','01209 653910',6736);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (432,'23029','Tyrone Gray','mauris.a.nunc@sitametdiam.co.uk','01599 412711',3370);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (227,'60195','Tamara Moss','eu.tellus@Suspendisse.net','01051 585399',705);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (368,'23029','Rylee Herrera','consectetuer.ipsum@sollicitudincommodoipsum.net','01029 419364',9273);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (142,'60195','Gregory Rich','et.malesuada.fames@arcu.org','01406 046697',4462);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (276,'60195','Adria Sharpe','tortor.Integer@sitametrisus.co.uk','01239 708977',6715);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (234,'99907','Angelica Hyde','vel@arcu.co.uk','01317 287871',1939);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (692,'23029','Yuli Wolfe','mauris@lectusrutrum.ca','01537 406273',4269);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (211,'79630','Dustin Logan','neque.sed@rutrummagnaCras.edu','01926 961125',3834);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (416,'37745','Warren Harper','Nunc@mollisPhaselluslibero.co.uk','01975 122708',735);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (138,'41521','Quinn Ayala','erat@mauris.co.uk','01634 580839',8771);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (853,'23029','Amos Mueller','et@luctusetultrices.co.uk','01466 282958',35);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (159,'60195','Cameron Pierce','montes.nascetur.ridiculus@erosturpisnon.edu','01834 112723',5977);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (339,'38613','Ignatius Mcdowell','a.ultricies.adipiscing@consequat.com','01250 010806',6203);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (370,'21710','Halee Pierce','rhoncus.Proin@nonarcu.net','01316 074492',2374);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (697,'85401','Berk Patel','Aenean.gravida.nunc@fringilla.edu','01208 644063',3007);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (822,'21710','Kiona Klein','malesuada.ut@lacuspede.com','01765 355929',2779);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (648,'99907','Carter Vance','vulputate.risus.a@nuncrisus.net','01991 132090',3891);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (327,'37745','Hammett Kelly','nonummy@egestashendreritneque.net','01835 237141',199);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (243,'21710','Cyrus Jennings','lacus@idmagna.co.uk','01553 350755',5407);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (548,'88605','Wilma Stevens','justo.Praesent.luctus@loremvitae.org','01185 099143',5171);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (739,'41521','Porter Page','nisi@Donecegestas.net','01816 043452',8300);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (388,'61472','Sonia Petty','ultrices.mauris@antedictum.ca','01239 707952',8832);
INSERT INTO Property_seller (Seller_ID,Employee_ID,Owner_Name,Owner_Email,Contact_Number,Amount_Owed) VALUES (353,'17826','Veronica Shaw','tristique@ullamcorperDuiscursus.edu','01302 674825',4368);

INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('M6B0T','5675','114','930-2739 Leo. Avenue','Valéncia','Comunitat Valenciana','PC99 6FA',344401,4,'Contract','mollis.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('C6O9L','5675','138','Ap #177-7846 Amet Rd.','Denbigh','DE','JR57 1YD',854874,6,'For Sale','Pellentesque habitant morbi');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('R4R2C','5675','142','5982 Maecenas St.','Cimahi','JB','VI38 9EW',737612,5,'Sold','sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('N0T8D','5675','159','7129 Facilisis Street','Hafizabad','PB','VW12 4UE',241450,2,'For Sale','malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('L2J6P','8009','209','P.O. Box 470, 8658 Sed St.','Zielona Góra','Lubuskie','RO91 5BT',583200,18,'Sold','rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('E4K3J','1007','211','951-8498 Auctor. St.','Valéncia','CV','FD49 4QS',933873,12,'For Sale','Cras lorem lorem, luctus ut, pellentesque eget,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('N7I6I','8009','227','654-1764 Ultricies Ave','Chapra','BR','VX72 8VJ',216392,5,'Contract','erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('J1S7T','3341','229','Ap #245-6610 Cras St.','Tallahassee','FL','WS39 0GB',544200,11,'For Sale','sit amet, consectetuer');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('G7D1D','5675','234','487-8266 Rutrum. Ave','Prince Albert','SK','JY57 5XF',348871,17,'For Sale','sed consequat auctor, nunc nulla vulputate dui, nec tempus');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('E7A1M','1007','236','P.O. Box 173, 2269 Duis Street','Courbevoie','Île-de-France','QT85 4QO',102531,1,'Sold','augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('L8L2X','1007','242','P.O. Box 155, 4332 Orci Rd.','Vaughan','Ontario','NJ07 2ZM',786849,20,'Contract','pede, malesuada vel, venenatis vel, faucibus id,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('J2D7Y','8009','243','Ap #294-5067 Cursus. Road','Irvine','Ayrshire','RK48 5NC',635528,19,'Sold','Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F7R0B','1007','275','Ap #977-3093 Risus Rd.','Ribeirão das Neves','MG','JO17 6SU',948708,2,'Contract','Ut semper pretium neque. Morbi quis urna. Nunc quis arcu');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('X8D1C','8009','276','304-1174 Cursus Road','Berlin','Berlin','YH79 4CO',910797,6,'For Sale','Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('N5M3Q','5675','302','854 Cum Street','Bottrop','Nordrhein-Westphalen','AP65 6PZ',875946,4,'Contract','a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F1L5W','5675','306','975-2198 Non, Ave','Caledon','Ontario','TI08 7FC',346393,15,'For Sale','sem. Pellentesque ut');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('C7U3B','1007','327','P.O. Box 471, 1747 Laoreet Avenue','Casanova Elvo','PIE','HR23 2GG',788633,14,'Sold','ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('P6S7R','8009','339','1309 Quam Rd.','Soledad','Atlántico','LD66 7QS',611218,11,'Contract','per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Y5H9E','5675','343','P.O. Box 271, 8810 Blandit St.','Berlin','BE','DY78 3RS',271863,11,'For Sale','massa non ante');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('K7V0W','3341','353','248-1587 Vel St.','Castelló','Comunitat Valenciana','QU41 6KC',158732,18,'Sold','ac turpis');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('J8P6A','5675','368','Ap #669-487 Eu, Rd.','Raipur','CT','HS39 3TH',860149,1,'Contract','mi tempor lorem, eget');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Q5P5F','5675','370','213-389 Sit Ave','Patalillo','San José','WQ11 9IN',426879,8,'Sold','Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('L2T3Z','1007','371','793-1596 Nam St.','Naushahro Firoze','PU','OW94 3UP',757321,13,'For Sale','Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Y6H2W','8009','372','Ap #770-382 Risus Avenue','Rochester','MN','LS43 2SQ',496487,2,'Contract','fermentum arcu.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Y1D9V','3341','388','6993 Quisque St.','Mexico City','Mexico City','NU44 9YT',204572,17,'Sold','faucibus ut, nulla. Cras eu tellus');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('O1P2N','3341','403','Ap #115-1679 Arcu Road','Suwon','Gye','IT13 5HS',435430,2,'Contract','sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('U3H8C','1007','413','550-391 Vivamus Ave','Champigny-sur-Marne','Île-de-France','VV25 7OW',268131,12,'For Sale','eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F9K0D','1007','416','Ap #621-8355 Etiam Avenue','Santa Coloma de Gramenet','CA','KM12 8ZC',319840,17,'For Sale','molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Y6R1L','3341','432','3429 Enim. St.','Norfolk','Virginia','JP47 6HF',520096,15,'Sold','Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('I5C0V','3341','464','1757 Lectus. Rd.','Wonju','Gangwon','NL81 5XI',190418,7,'For Sale','luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('U9Z1E','3341','508','169-3953 Pede. Street','Sart-Eustache','NA','TB83 2CN',810583,18,'Sold','arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('R9W3V','1007','513','4473 Dictum Ave','Kano','KN','KC16 3BU',665642,1,'Contract','lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('S3X1K','8009','522','4583 Malesuada Street','Arequipa','Arequipa','YL83 8LI',859859,2,'Contract','facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('H2D3A','1007','529','172-8103 Quis Avenue','Hamburg','HH','JO74 2UK',922336,2,'For Sale','gravida molestie arcu. Sed');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('C5T3B','3341','544','Ap #233-6614 Non Road','Matiari','PU','GO94 1AT',785599,2,'Contract','Cum');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Q0U6T','5675','548','P.O. Box 235, 1087 Egestas. Avenue','Chungju','North Chungcheong','NJ52 2WA',246384,16,'For Sale','nunc interdum feugiat.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F1B0W','8009','608','Ap #394-8200 Sed Ave','Belfast','U','YA35 6ZO',815919,7,'Sold','vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('S9D4U','3341','625','2404 Aliquet Rd.','Bama','Borno','LI58 5GS',872565,6,'Sold','Nam ligula elit,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('Y6U2X','3341','626','9298 Enim Ave','Novosibirsk','Novosibirsk Oblast','VD60 3EF',724594,14,'Sold','purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('R7V3Z','1007','639','Ap #573-3252 Ornare Street','Konin','WP','NV79 5TM',586419,17,'Sold','elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('C7B2Y','1007','648','912-5073 Enim. Avenue','Cajamarca','Cajamarca','AF08 3UB',550635,10,'For Sale','vitae');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('M7X4K','5675','656','Ap #267-4677 Nulla St.','Lens-Saint-Servais','LU','AY99 7JO',387669,15,'Sold','id, libero. Donec consectetuer mauris id sapien. Cras dolor');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F8N3N','1007','692','Ap #409-6472 Est Rd.','Bazzano','ERM','IV23 3UV',626316,7,'For Sale','eget laoreet');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('D6M8Q','1007','697','P.O. Box 525, 2545 Metus. Rd.','Acapulco','Gro','XJ18 6IV',877855,2,'For Sale','Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('F6D3O','5675','701','Ap #530-2294 In, Rd.','Canning','WA','JX59 6IR',660599,3,'Sold','Donec');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('H5H3X','5675','736','204-2491 Senectus St.','Katsina','KT','UD29 8NT',632121,5,'Contract','risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at,');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('V0G7S','3341','739','P.O. Box 136, 5508 Imperdiet Road','Asan','Chu','UD16 2VH',253356,5,'Sold','euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('J9V6S','8009','744','P.O. Box 287, 7102 Neque St.','Castelvecchio Calvisio','Abruzzo','CL09 9AL',439246,1,'For Sale','amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('T8Y3K','5675','822','Ap #948-7693 Iaculis Ave','Masterton','NI','IW98 2UC',660238,10,'For Sale','ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium');
INSERT INTO Property (House_ID,Branch_ID,Seller_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Asking_Price,No_Of_Rooms,Sale_Status,Fixtures_And_Fittings) VALUES ('L9T0T','1007','833','Ap #676-2455 Turpis. Rd.','Cambridge','North Island','SD33 0HL',753532,19,'Contract','ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor');

INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('X8D1C',3097,'interdum. Nunc',549);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('Y6R1L',3238,'facilisis facilisis,',206);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('N7I6I',3386,'nulla vulputate',34);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('R7V3Z',3932,'convallis ligula.',123);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('O1P2N',1632,'ornare, facilisis',553);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('D6M8Q',4415,'scelerisque, lorem',955);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('Q5P5F',2542,'quam, elementum',708);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('C6O9L',4676,'nonummy. Fusce',397);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('N7I6I',2438,'Curabitur vel',14);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('L9T0T',4366,'dictum. Phasellus',55);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('J9V6S',3688,'neque. Morbi',602);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('F9K0D',2422,'sed orci',990);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('C7B2Y',1991,'venenatis vel,',105);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('K7V0W',2332,'pellentesque massa',807);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('M6B0T',1407,'vehicula risus.',639);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('J2D7Y',3104,'ultricies ornare,',892);
INSERT INTO Property_Advert (House_ID,Advert_Price,Advert_Company,Days_Advertised) VALUES ('J1S7T',3783,'sociis natoque',421);

INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('J9V6S','13','26, May 2021',9489,'Caryn Brooks','01039 364668','arcu.imperdiet.ullamcorper@eleifendnon.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Y6H2W','29','20, Mar 2020',7443,'Aline Browning','01119 149822','mollis@Cras.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('N7I6I','11','11, Aug 2021',5410,'Scott Cantu','01158 895674','urna.nec.luctus@lobortisnisi.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Q0U6T','22','04, Jan 2020',5031,'Fritz Conley','01976 511403','aliquet@sapienmolestieorci.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('R9W3V','49','07, Nov 2021',1149,'Pearl Pickett','01398 562092','sapien.imperdiet@Maecenasiaculisaliquet.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('E4K3J','23','14, Sep 2019',5971,'Brock Moran','01749 784298','dolor@mi.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Q0U6T','27','13, Feb 2020',3350,'Jakeem Rios','01481 048587','nunc@musAeneaneget.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('F9K0D','36','18, Mar 2020',5088,'Kirk Mercado','01147 378859','tempor@mollisvitaeposuere.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('U9Z1E','13','23, Jun 2019',8279,'Martina Alvarado','01388 898515','elit.sed.consequat@lacus.org');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('S9D4U','22','20, Oct 2021',2090,'Yvette Osborne','01231 374051','imperdiet.dictum@tempor.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('E4K3J','48','29, Dec 2021',9978,'Uriel Harrington','01921 088610','in.felis.Nulla@duilectus.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('M6B0T','15','12, Nov 2020',5119,'Judith Ashley','01076 756724','nisi@Donec.com');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('P6S7R','12','23, Mar 2020',2512,'Ginger Kent','01781 293020','convallis@quam.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Y6U2X','37','19, Sep 2021',6408,'Roanna Copeland','01185 719165','molestie.in@eliterat.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('E7A1M','41','03, May 2021',1425,'Hiroko Willis','01386 907965','rutrum@suscipitestac.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('I5C0V','46','08, Jan 2020',3230,'Ella Webb','01380 947979','eget.venenatis.a@hendreritneque.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('E4K3J','48','13, Aug 2020',1703,'Jacob Kent','01207 474482','risus@eunullaat.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('H5H3X','31','27, Aug 2019',2584,'Farrah Lloyd','01867 237133','Pellentesque@blanditenim.com');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Y1D9V','47','28, Aug 2021',3269,'Macey Oneil','01015 244506','elit.pharetra@non.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('F1B0W','39','17, Feb 2020',7578,'Celeste Gardner','01804 683655','at@velit.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('L2T3Z','22','22, Sep 2019',9669,'Xanthus Willis','01913 504678','natoque.penatibus@risusNunc.com');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('R7V3Z','37','02, Apr 2020',1363,'Velma Henry','01196 846842','eu@Ut.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Q0U6T','19','22, Jan 2020',5365,'Brooke Duncan','01629 782499','placerat@eget.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('K7V0W','16','19, Sep 2019',1432,'Valentine Shannon','01265 002038','arcu.eu.odio@tempordiam.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Q5P5F','29','09, Sep 2020',4814,'Zoe Grant','01519 593660','lectus.a.sollicitudin@lobortisrisusIn.com');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('M6B0T','10','18, Sep 2021',7468,'Gregory Adkins','01605 921680','habitant.morbi@velitAliquam.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('S9D4U','29','27, Dec 2021',9018,'Noelle Livingston','01257 929242','posuere.vulputate@malesuadamalesuada.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('V0G7S','36','22, Sep 2020',5880,'Roth Fuller','01362 832289','ipsum.Curabitur@adipiscingMauris.org');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('V0G7S','19','07, Dec 2019',7302,'Jaquelyn Koch','01613 972621','Cras.sed.leo@sitamet.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('Y6R1L','28','23, May 2020',5886,'Nigel Fletcher','01922 454630','ut.molestie@pedeultricesa.org');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('J1S7T','10','27, Oct 2019',5608,'Rebecca Jones','01639 202494','dui.Fusce.diam@auctor.org');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('M6B0T','49','31, Aug 2020',3809,'Leslie Mccarthy','01632 859234','vel@lectusNullamsuscipit.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('U9Z1E','35','17, Feb 2019',7449,'Honorato Vaughn','01300 305263','dolor.dolor.tempus@consequat.ca');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('J9V6S','41','04, Jun 2021',7717,'Tatum Donaldson','01145 066542','ipsum.Suspendisse.non@gravidanon.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('F8N3N','38','25, Nov 2020',5049,'Quintessa Larson','01153 722685','lacinia@interdumligula.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('J1S7T','12','25, May 2020',6235,'Tara Murphy','01772 153376','fames.ac@montes.co.uk');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('X8D1C','36','04, Mar 2021',2707,'Isaiah Jacobs','01193 350848','mollis.Duis@placerat.edu');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('J9V6S','34','24, Nov 2019',5851,'Herman Newman','01811 177563','in.lobortis@risus.net');
INSERT INTO Survey (House_ID,Buyer_ID,Survey_Date,Survey_Cost,Surveyor_Name,Contact_Number,Email_Address) VALUES ('D6M8Q','45','29, Mar 2021',2114,'Barry Mckay','01958 504515','faucibus@eratSednunc.co.uk');

INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('R4R2C','20','04-Mar-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('P6S7R','35','07-Jun-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('N7I6I','23','22-Jul-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('P6S7R','18','17-May-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('L2T3Z','29','09-Apr-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('L8L2X','39','01-Nov-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('E7A1M','33','13-Sep-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('N5M3Q','17','19-Feb-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('J9V6S','25','22-Oct-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('T8Y3K','33','13-Aug-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('G7D1D','35','20-Mar-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('H5H3X','13','14-Mar-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('N7I6I','11','25-May-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('Y1D9V','27','19-Aug-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('F8N3N','49','06-Jun-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('L2T3Z','20','07-Feb-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('J8P6A','50','16-May-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('C6O9L','16','18-Feb-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('I5C0V','49','30-Sep-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('G7D1D','13','12-Mar-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('C7U3B','10','01-Sep-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('L8L2X','39','21-Dec-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('Y6H2W','35','15-May-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('U3H8C','13','21-Apr-2020');
INSERT INTO Appointment (House_ID,Buyer_ID,Appointment_Date) VALUES ('J9V6S','34','25-Apr-2020');

INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #264-3642 Enim. Road','Vienna','Wie','9193','Ivor Strong','Stewart Jenkins',1679359,'23-Mar-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','P.O. Box 822, 8683 Inceptos St.','Uddevalla','O','5102','Veda Gates','Lane Fowler',1833685,'23-Feb-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','P.O. Box 106, 3571 Ipsum. Ave','Lapscheure','WV','34331','Francesca Flowers','Robert Hudson',832058,'07-Jun-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #267-7863 Aliquet Road','Boryeong','Chu','721055','Dane Harper','Genevieve Thompson',622253,'09-Jul-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','730-2342 Tincidunt Rd.','Chulucanas','PIU','Z6609','Judah Mccullough','Lamar Ashley',301113,'21-May-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #925-2022 Vehicula. Rd.','Osgoode','Ontario','5257','Otto Hyde','Wyoming Meyers',271297,'06-Aug-14');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','Ap #236-4246 Vulputate, Ave','Destelbergen','Oost-Vlaanderen','59586','Selma Tanner','Ariel Hooper',773879,'20-Nov-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','345-3297 Elit. Rd.','Blue Mountains','New South Wales','7386','Stacey Baker','Aretha Garner',1850982,'28-Nov-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','2030 In Rd.','Mardan','Khyber Pakhtoonkhwa','465457','Flynn Weaver','Charlotte Howard',188071,'14-Aug-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','4928 Ante. St.','Sala Baganza','Emilia-Romagna','9489','Brandon Mendoza','Madison Conley',791834,'28-Oct-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','7150 Pede, St.','Palembang','South Sumatra','698111','Kaitlin Cherry','Emily Sanford',981374,'21-Jan-20');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','449-6391 Facilisis. Rd.','Villar Pellice','PIE','514387','Hope Calhoun','Veda Barrett',700254,'06-May-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','6003 Arcu Rd.','Helena','MT','31306','Melissa Ochoa','Nomlanga Casey',1494237,'24-Sep-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #344-3975 Sapien, Rd.','Kano','KN','32648','Guy Sosa','Arthur Woodward',372209,'25-Jun-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','730-1744 Urna Road','Barcelona','CA','62048-42034','MacKensie Day','Arsenio Haynes',425078,'12-Sep-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','P.O. Box 513, 2530 Turpis St.','Hamilton','ON','65391','Lavinia House','Jonah Norris',290920,'28-Nov-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #456-8965 Fringilla Ave','Lidköping','Västra Götalands län','1434','Carol Parrish','Yolanda Hawkins',1468567,'14-May-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','970-744 Fermentum Road','Sakhalin','Sakhalin Oblast','Z8550','Zia Anthony','Haley Britt',208886,'07-Nov-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','P.O. Box 108, 234 Sit Street','Vienna','Vienna','264461','Tatiana Pittman','Reese Molina',816121,'27-Dec-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','669-2532 Aliquet. St.','Phoenix','AZ','39736','Harding Griffith','Mannix Rhodes',1606141,'04-Nov-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','268-6113 Interdum Av.','Feilding','NI','1176','Jamalia Kelley','Ignatius Fitzgerald',1196605,'06-Jan-20');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','542-4628 Et, Road','Kungälv','O','42256','Zachary Bryant','Dalton Brennan',207912,'04-Jun-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #761-4678 Lectus, Av.','Queanbeyan','New South Wales','37833','Jakeem Nieves','Nomlanga Castillo',815989,'23-Sep-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','Ap #887-3595 Odio. Rd.','San Jose','CA','43-204','Steven Frost','Beau Campbell',1474839,'14-Jun-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','3228 Integer Road','Kungälv','O','S4R 4G9','Hunter Miranda','Hammett Maxwell',685461,'05-Aug-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','P.O. Box 136, 6930 Est Av.','Wonju','Gangwon','15129','Maxwell Dean','Vance Little',1561559,'31-May-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','3200 Velit St.','Levin','North Island','66197','Nolan Nieves','Silas Luna',322861,'16-Feb-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','1255 Nonummy Road','Cusco','Cusco','43507','Blossom Jordan','Fletcher Goff',303349,'18-Jul-14');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','8839 Nec Avenue','Huechuraba','RM','852581','Marvin Frye','Hayden Vinson',1945202,'27-Jul-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #281-1805 Sit Road','Tver','TVE','42516','Kane Potter','Jessamine Sullivan',1924766,'06-Aug-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','P.O. Box 202, 5417 Mauris Road','Itagüí','ANT','74271','Ignatius Lawson','Maile Poole',965583,'27-Dec-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','P.O. Box 588, 6745 Mi St.','Awaran','BL','X7Y 2E7','Bevis Macdonald','Derek Beach',1768031,'09-Sep-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #189-7426 Orci. Avenue','Gisborne','NI','47125','Juliet Compton','Jamalia Raymond',1367969,'23-Dec-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #973-1869 Non Street','Ferness','Nairnshire','090497','Maggy Barron','Noelle Gates',477335,'20-Jan-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #930-5850 Ante Road','Guadalupe','N.L','72387','Chastity Davidson','Dora Woodard',547662,'31-Jan-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','960 Lorem Street','Belfast','U','94191','Carson Griffith','Isabelle Trujillo',425086,'27-Nov-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #542-1924 Sit Ave','Sargodha','Sindh','91402','Octavius Fleming','Ivan Butler',1983076,'06-Dec-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','Ap #348-7295 Eu Av.','Zittau','SN','67128','Leila Harrington','Dillon Rutledge',291156,'26-Nov-14');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','P.O. Box 459, 8242 Nec Rd.','Dollard-des-Ormeaux','QC','68356','Giselle Thompson','Rebecca Kennedy',264836,'15-Aug-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','246-2089 Bibendum Ave','Sete Lagoas','MG','65101','Nicholas Strong','Harper Hale',672468,'25-Jul-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #589-7861 Imperdiet Road','San Vicente','SJ','10045','Rudyard Fulton','Anjolie Boyd',1239980,'23-Sep-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','9910 Ullamcorper Ave','San José del Guaviare','GUV','294573','Ian Shepherd','George Richards',225012,'06-May-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','786-1884 Id Ave','Broken Hill','New South Wales','24780-462','Preston Forbes','Maggie Juarez',683526,'19-Dec-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','875-158 Donec St.','San Juan del Río','Querétaro','79603','Sybill Hahn','Dara Valenzuela',543352,'17-Nov-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','Ap #952-2335 Vitae Avenue','Bulnes','Biobío','476760','Daria Roberson','Orla Petersen',1291458,'19-Jul-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','P.O. Box 130, 4451 Nullam Avenue','Apartadó','Antioquia','Z1796','Rafael Workman','Finn Martinez',1127031,'06-Jun-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','2426 Purus. St.','Ibadan','OY','1702 AE','Edward Lewis','Elmo Stout',1058494,'04-Feb-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','Ap #606-9386 Egestas. Street','Radom','Mazowieckie','PC9 2SC','Willa Johnston','Paki Burns',1166257,'03-Jun-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','P.O. Box 502, 5030 At Av.','Qambar Shahdadkot','PU','12351','Levi Wall','Lysandra Dickerson',382551,'01-Feb-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','509-2219 Sed Street','Kırıkhan','Hatay','390993','Gwendolyn Pittman','Wallace Vance',1805672,'30-Mar-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','796 Magnis St.','Newport News','VA','74361-80281','Cruz Rogers','Tyler Mack',1264622,'28-Apr-14');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','906 Sociis Street','Heredia','H','52321','Jemima Goodman','Harriet Downs',808104,'17-Jan-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','P.O. Box 449, 7788 Semper Rd.','Bremen','HB','30922','Sopoline Randolph','Zelda Suarez',1373831,'01-Feb-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','7792 Risus. Road','Vienna','Wie','61-275','Jerry Montoya','Portia Roberts',938724,'02-Aug-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','P.O. Box 208, 775 Vulputate, Avenue','Warwick','ON','2377','Ignacia Moran','Amaya White',1867105,'23-Oct-14');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #873-3562 Eu Ave','Carleton','QC','8593','Lunea Perry','Rowan Bullock',1061218,'17-Mar-18');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','622-450 Suscipit, Rd.','Chimbote','Ancash','9488','Callie Livingston','Lesley Finch',624723,'04-Jul-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','Ap #380-7390 Quis Av.','Laakdal','AN','73495','Calista Perkins','Ocean Carr',1062093,'06-Aug-19');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','P.O. Box 902, 1047 Vehicula. Av.','Berloz','Luik','42062','Nissim Gamble','Blaine Ware',1616394,'22-Jul-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('3341','395-9551 Vivamus Rd.','Diyarbakır','Diyarbakır','818851','Sacha Ellis','Ishmael Knox',690356,'04-Mar-15');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','P.O. Box 855, 5483 Odio. Street','Tarma','Junín','165188','Remedios Cash','Jelani Burgess',1066572,'04-Feb-20');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('5675','Ap #675-8916 Amet, Road','Queanbeyan','New South Wales','522923','Colorado Daniels','Lewis Hewitt',1834836,'20-Nov-17');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('8009','Ap #277-8032 Velit St.','Warszawa','MA','887986','Sage Ratliff','Hannah Joyce',1966034,'22-Jul-16');
INSERT INTO Sold_Property (Branch_ID,Address_Line_1,Address_Line_2,Address_Line_3,Postcode,Seller_Name,Buyer_Name,Contract_Price,Date_Of_Sale) VALUES ('1007','3205 Purus, Road','Cuernavaca','Morelos','Z9291','Justina Short','Kylynn Fitzgerald',1406707,'21-Jan-17');

INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('R4R2C',1487993);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('L2J6P',1413434);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('E7A1M',595193);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('J2D7Y',1784823);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('C7U3B',153299);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('K7V0W',385172);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('Q5P5F',918776);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('Y1D9V',231255);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('Y6R1L',1999831);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('U9Z1E',340675);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('F1B0W',1096629);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('S9D4U',1911767);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('Y6U2X',1665385);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('R7V3Z',1238826);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('M7X4K',1301466);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('F6D3O',1814003);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('V0G7S',310832);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('M6B0T',1122532);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('N7I6I',574241);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('L8L2X',1455994);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('F7R0B',113189);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('N5M3Q',1140750);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('P6S7R',211032);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('J8P6A',1007495);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('Y6H2W ',838405);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('O1P2N',1525284);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('R9W3V',440002);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('C5T3B',1593263);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('H5H3X',1054858);
INSERT INTO Offer (House_ID,Offer_Amount) VALUES ('L9T0T',637396);