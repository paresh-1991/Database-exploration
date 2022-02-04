--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

CREATE SCHEMA public AUTHORIZATION postgres;
-- to enable functions like crosstab
CREATE EXTENSION IF NOT EXISTS tablefunc;

create table Country (
	Country_ID INT,
	COUNTRY Varchar(50),
	primary key(Country_ID)
);

ALTER TABLE Country OWNER TO postgres;

create table Athlete(
	ID INT,
	"name" Varchar(20) not null,
	sex varchar(1),
	"age" INT,
	"height" INT,
	weight INT,
	Country_ID INT,
	primary key(ID),
	foreign key (Country_ID) references Country(Country_ID)
);

ALTER TABLE Athlete OWNER TO postgres;
ALTER TABLE public.Athlete ALTER COLUMN "name" TYPE varchar(100) USING "name"::varchar;
ALTER TABLE public.Athlete ALTER COLUMN "name" SET NOT NULL;

select* from athlete;


select* from Country;
create table Olympic_Games(
	Olympiad_ID INT,
	City Varchar(20),
	"year" INT,
	Season varchar(20),
	Country_ID INT,
	primary key(Olympiad_ID),
	foreign key (Country_ID) references Country(Country_ID)
);

ALTER TABLE Olympic_Games OWNER TO postgres;

create table Sport(
	Sport_ID INT,
	Sport_Name Varchar(20),
	primary key(Sport_ID)
);

ALTER TABLE Sport OWNER TO postgres;

select * from Olympic_Games;
select * from Sport;

create table Sport_Event(
	Event_ID INT,
	Category Varchar(50),
	Sport_ID INT,
	Olympiad_ID INT,
	primary key(Event_ID),
	foreign key (Olympiad_ID) references Olympic_Games(Olympiad_ID),
	foreign key (Sport_ID) references Sport(Sport_ID)
);

-- Remove Olympiade_ID from here? 

ALTER TABLE Sport_Event OWNER TO postgres;

create table Participates_in(
	Athlete_ID INT,
	Event_ID INT,
	"result" varchar(15),
	primary key(Athlete_ID, Event_ID),
	foreign key (Athlete_ID) references Athlete(ID),
	foreign key (Event_ID) references Sport_Event(Event_ID)
);

-- Add Olympiade_ID here?

ALTER TABLE Participates_in OWNER TO postgres;


REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;



insert into country( Country_ID, "country") values (1, 'China');
insert into country( Country_ID, "country") values (2, 'Netherlands');
insert into country( Country_ID, "country") values (3, 'United States');
insert into country( Country_ID, "country") values (4, 'Finland');
insert into country( Country_ID, "country") values (5, 'Norway');
insert into country( Country_ID, "country") values (6, 'Romania'); 
insert into country( Country_ID, "country") values (7, 'Estonia');
insert into country( Country_ID, "country") values (8, 'France');
insert into country( Country_ID, "country") values (9, 'Spain');
insert into country( Country_ID, "country") values (10, 'France');
insert into country( Country_ID, "country") values (11, 'Egypt');
insert into country( Country_ID, "country") values (12, 'Bulgaria');
insert into country( Country_ID, "country") values (13, 'Italy');
insert into country( Country_ID, "country") values (14, 'Azerbaijan');
insert into country( Country_ID, "country") values (15, 'Russia');
insert into country( Country_ID, "country") values (17, 'Argentina');
insert into country( Country_ID, "country") values (18, 'Cuba');
insert into country( Country_ID, "country") values (19, 'Belarus');
insert into country( Country_ID, "country") values (20, 'Greece');
insert into country( Country_ID, "country") values (21, 'Cameroon');
insert into country( Country_ID, "country") values (22, 'England');
insert into country( Country_ID, "country") values (23, 'Canada');
insert into country( Country_ID, "country") values (24, 'Australia');
insert into country( Country_ID, "country") values (25, 'Japan');
insert into country( Country_ID, "country") values (26, 'Brazil');
insert into country( Country_ID, "country") values (27, 'Germany');
insert into country( Country_ID, "country") values (28, 'Bosnia-Herzegovina');
insert into country( Country_ID, "country") values (29, 'Mexico');
insert into country( Country_ID, "country") values (30, 'South-Korea');





insert into athlete values (1,'A Dijiang','M',24,180,80,1);
insert into athlete values (2,'A Lamusi','M',23,170,60,1);
insert into athlete values (3,'Christine Jacoba Aaftink','F',21,185,82,2);
insert into athlete values (4,'Per Knut Aaland','M',31,188,75,3);
insert into athlete values (5,'John Aalberg','M',31,183,72,3);
insert into athlete values (6,'Antti Sami Aalto','M',26,186,96,4);
insert into athlete values (7,'Jorma Ilmari Aalto','M',22,182,76.5,4);
insert into athlete values (8,'Jyri Tapani Aalto','M',31,172,70,4);
insert into athlete values (9,'Minna Maarit Aalto','F',30,159,55.5,4);
insert into athlete values (10,'Pirjo Hannele Aalto (Mattila-)','F',32,171,65,4);
insert into athlete values (11,'Juhamatti Tapio Aaltonen','M',28,184,85,4);
insert into athlete values (12,'Paavo Johannes Aaltonen','M',28,175,64,4);
insert into athlete values (13,'Paavo Johannes Aaltonen','M',32,175,64,4);
insert into athlete values (14,'Christine Jacoba Aaftink','F',25,185,82,2);
insert into athlete values (15,'Christine Jacoba Aaftink','F',27,185,82,2);
insert into athlete values (16,'Timo Antero Aaltonen','M',31,189,130,4);
insert into athlete values (17,'Kjetil Andr Aamodt','M',20,176,85,5);
insert into athlete values (18,'Kjetil Andr Aamodt','M',22,176,85,5);
insert into athlete values (19,'Kjetil Andr Aamodt','M',26,176,85,5);
insert into athlete values (20,'Kjetil Andr Aamodt','M',30,176,85,5);
insert into athlete values (21,'Kjetil Andr Aamodt','M',34,176,85,5);
insert into athlete values (22,'Andreea Aanei','F',22,170,125,6);
insert into athlete values (23,'Fritz Aanes','M',22,187,89,5);
insert into athlete values (24,'Fritz Aanes','M',26,187,89,5);
insert into athlete values (25,'Agnes Erika Aanonsen (-Eyde)','F',17,169,65,5);
insert into athlete values (26,'Jan-Erik Aarberg','M',43,170,77,5);
insert into athlete values (27,'Jan-Erik Aarberg','M',47,170,77,5);
insert into athlete values (28,'Pepijn Aardewijn','M',26,189,72,2);
insert into athlete values (29,'Pepijn Aardewijn','M',30,189,72,2);
insert into athlete values (30,'Evald rma (rman-)','M',24,174,70,7);
insert into athlete values (31,'Mika Lauri Aarnikka','M',24,187,76,4);
insert into athlete values (32,'Mika Lauri Aarnikka','M',28,187,76,4);
insert into athlete values (33,'Jamale (Djamel-) Aarrass (Ahrass-)','M',30,187,76,null);
insert into athlete values (34,'Dagfinn Sverre Aarskog','M',24,190,98,5);
insert into athlete values (35,'Stefan Remco Aartsen','M',21,194,78,2);
insert into athlete values (36,'Stefan Remco Aartsen','M',25,194,78,2);
insert into athlete values (37,'Ann Kristin Aarnes','F',23,182,64,5);
insert into athlete values (38,'Morten Gjerdrum Aasen','M',34,185,75,2);
insert into athlete values (39,'Meelis Aasme','M',29,182,73,7);
insert into athlete values (40,'Hans Aasns','M',33,194,93,5);
insert into athlete values (41,'Hans Aasns','M',45,194,93,5);
insert into athlete values (42,'Hans Aasns','M',49,194,93,5);
insert into athlete values (43,'Hans Aasns','M',53,194,93,5);
insert into athlete values (44,'Hans Aasns','M',57,194,93,5);
insert into athlete values (45,'Moonika Aava','F',24,168,65,7);
insert into athlete values (46,'Moonika Aava','F',28,168,65,7);
insert into athlete values (47,'Arvi Aavik','M',22,185,106,7);
insert into athlete values (48,'Arvi Aavik','M',26,185,106,7);
insert into athlete values (49,'Nstor Abad Sanjun','M',23,167,64,9);
insert into athlete values (50,'Patrick Abada','M',22,189,80,10);
insert into athlete values (51,'Talaat Abada','M',24,172,58,11);
insert into athlete values (52,'Antonio Abadia Beci','M',26,170,65,9);
insert into athlete values (53,'Borislav Abadzhiev','M',24,176,66,12);
insert into athlete values (54,'Ivan Nikolov Abadzhiev','M',24,164,71,12);
insert into athlete values (55,'Mikhail Abadzhiev','M',24,172,75,12);
insert into athlete values (56,'Stefan Abadzhiev','M',26,175,72,12);
insert into athlete values (57,'Giovanni Abagnale','M',21,198,90,13);
insert into athlete values (58,'Jos Luis Abajo Gmez','M',30,194,87,9);
insert into athlete values (59,'Patimat Abakarova','F',21,165,49,14);
insert into athlete values (60,'Mariya Vasilyevna Abakumova (-Tarabina)','F',22,179,80,15);
insert into athlete values (61,'Mariya Vasilyevna Abakumova (-Tarabina)','F',26,179,80,15);
insert into athlete values (62,'Pablo Martn Abal','M',23,178,76,17);
insert into athlete values (63,'Tamara Abalde Daz','F',19,185,72,9);
insert into athlete values (64,'Juan Antonio Aball Delgado','M',27,172,82,18);
insert into athlete values (65,'Aleksey Aleksandrovich Abalmasov','M',24,180,83,19);
insert into athlete values (66,'Luc Abalo','M',23,182,86,8);
insert into athlete values (67,'Luc Abalo','M',27,182,86,8);
insert into athlete values (68,'Luc Abalo','M',31,182,86,8);
insert into athlete values (69,'Mara Laura Abalo','F',30,182,73,17);
insert into athlete values (70,'Giorgos Abalof','M',22,178,70,20);
insert into athlete values (71,'Jouan Patrice Abanda Etong','M',22,185,82,21);
insert into athlete values (72,'Minna Maarit Aalto','F',34,159,55.5,4);


/* The insertion of the data (3)
 * Olympic Games consists of the following columns:
 * olympic_games( Olympiad_ID, Year, "Season", "City", Country_ID)
 */


insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (1, 1992, 'Summer', 'Barcelona', 9);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (2, 2012, 'Summer', 'London', 22);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (3, 1998, 'Winter', 'Calgary', 23);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (4, 1992, 'Winter', 'Albertville', 3);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (5, 1994, 'Winter', 'Lillehamm', 5);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (6, 2002, 'Winter', 'Salt Lake city', 3);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (7, 1980, 'Winter', 'Lake Placid', 3);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (8, 2000, 'Summer', 'Sydney', 24);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (9, 1996, 'Summer', 'Atlanta', 3);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (10, 2014, 'Winter', 'Sochi', 15);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (11, 1948, 'Summer', 'London', 22);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (12, 1952, 'Summer', 'Helsinki', 4);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (13, 1998, 'Winter', 'Nagano', 25);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (14, 2006, 'Winter', 'Torino', 13);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (15, 2016, 'Summer', 'Rio de Janeiro', 26);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (16, 2004, 'Summer', 'Athina', 20);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (17, 1984, 'Winter', 'Sarajevo', 28);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (18, 1968, 'Summer', 'Mexico city', 29);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (19, 1972, 'Summer', 'Munich', 27);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (20, 1936, 'Summer', 'Berlin', 27);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (21, 1992, 'Summer', 'Barcelona', 9);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (22, 1956, 'Summer', 'Melbourne', 24);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (23, 1960, 'Summer', 'Roma', 13);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (24, 2008, 'Summer', 'Beijing', 1);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (25, 1976, 'Summer', 'Montreal', 23);
insert into olympic_games( Olympiad_ID, year, "season", "city", country_id) values (26, 1988, 'Summer', 'Seoul', 23);


/* The insertion of the data (3)
 * Sport consists of the following columns:
 * Sport_ID, Sport_name
 */

insert into sport(sport_id, "sport_name") values (1, 'Basketball');
insert into sport(sport_id, "sport_name") values (2, 'Judo');
insert into sport(sport_id, "sport_name") values (3, 'Speed Skating');
insert into sport(sport_id, "sport_name") values (4, 'Cross Country Skiing' );
insert into sport(sport_id, "sport_name") values (5, 'Ice Hockey');
insert into sport(sport_id, "sport_name") values (6, 'Badminton');
insert into sport(sport_id, "sport_name") values (7, 'Sailing');
insert into sport(sport_id, "sport_name") values (8, 'Biathlon');
insert into sport(sport_id, "sport_name") values (9, 'Gymnastics');
insert into sport(sport_id, "sport_name") values (10, 'Water Polo');
insert into sport(sport_id, "sport_name") values (11, 'Athletics');
insert into sport(sport_id, "sport_name") values (12, 'Alpine Skiing');
insert into sport(sport_id, "sport_name") values (13, 'Weightlifting');
insert into sport(sport_id, "sport_name") values (14, 'Wrestling');
insert into sport(sport_id, "sport_name") values (15, 'Rowing');
insert into sport(sport_id, "sport_name") values (16, 'Luge');
insert into sport(sport_id, "sport_name") values (17, 'Bobsleigh');
insert into sport(sport_id, "sport_name") values (18, 'Swimming');
insert into sport(sport_id, "sport_name") values (19, 'Football');
insert into sport(sport_id, "sport_name") values (20, 'Equestrianism');
insert into sport(sport_id, "sport_name") values (21, 'Shooting');
insert into sport(sport_id, "sport_name") values (22, 'Taekwondo');
insert into sport(sport_id, "sport_name") values (23, 'Boxing');
insert into sport(sport_id, "sport_name") values (24, 'Fencing');
insert into sport(sport_id, "sport_name") values (25, 'Basketball');
insert into sport(sport_id, "sport_name") values (26, 'Diving');
insert into sport(sport_id, "sport_name") values (27, 'Canoeing');
insert into sport(sport_id, "sport_name") values (28, 'Handball');



insert into sport_event values (1, 'Basketball Mens Basketball', 1,1); -- Summer Barcelona
insert into sport_event values (2, 'Judo Mens, Extra-Lightweight', 2,2); -- Summer London
insert into sport_event values (3, 'Speed Skating Womens 500 metres', 3, 3); -- Calgary Winter
insert into sport_event values (4, 'Speed Skating Womens 1000 metres', 3, 3);
insert into sport_event values (56, 'Speed Skating Womens 500 metres', 3, 4); -- Albertville Winter
insert into sport_event values (57, 'Speed Skating Womens 1000 metres', 3, 4);
insert into sport_event values (58, 'Speed Skating Womens 500 metres', 3, 5); -- Lillehammer Winter
insert into sport_event values (59, 'Speed Skating Womens 1000 metres', 3, 5);
insert into sport_event values (5, 'Cross Country Skiing Mens 10 kilometres', 4, 4); -- Albertville Winter
insert into sport_event values (6, 'Cross Country Skiing Mens 50 kilometres', 4, 4);
insert into sport_event values (7, 'Cross Country Skiing Mens 10/15 kilometres', 4, 4);
insert into sport_event values (8, 'Cross Country Skiing Mens 4x10 kilometres', 4, 4);
insert into sport_event values (9, 'Cross Country Skiing Mens 30 kilometres', 4, 4);
insert into sport_event values (60, 'Cross Country Skiing Mens 10 kilometres', 4, 5); -- Lillehammer Winter
insert into sport_event values (61, 'Cross Country Skiing Mens 50 kilometres', 4, 5);
insert into sport_event values (62, 'Cross Country Skiing Mens 10/15 kilometres', 4, 5);
insert into sport_event values (63, 'Cross Country Skiing Mens 4x10 kilometres', 4, 5);
insert into sport_event values (64, 'Cross Country Skiing Mens 30 kilometres', 4, 5);
insert into sport_event values (10, 'Ice Hockey Mens Ice Hockey', 5, 6); -- Salt Lake City
insert into sport_event values (65, 'Cross Country Skiing Mens 30 kilometres', 4, 7); -- Lake Placid
insert into sport_event values (11, 'Badminton Mens Singles', 6, 8); -- Sydney
insert into sport_event values (12, 'Sailing Womens Windsurfer', 7, 8); -- Sydney
insert into sport_event values (13, 'Biathlon Womens 7.5 kilometers Sprint', 8, 5); -- Lilehamer
insert into sport_event values (14, 'Gymnastics Mens Team All-Round', 9, 11); -- London
insert into sport_event values (15, 'Gymnastics Mens Floor Exercise', 9, 11);
insert into sport_event values (16, 'Gymnastics Mens Horse Vault', 9, 11);
insert into sport_event values (17, 'Gymnastics Mens Parallel Bars', 9, 11);
insert into sport_event values (18, 'Gymnastics Mens Horizontal Bar', 9, 11);
insert into sport_event values (19, 'Gymnastics Mens Rings', 9, 11);
insert into sport_event values (20, 'Gymnastics Mens Pommeld Horse', 9, 11);
insert into sport_event values (21, 'Gymnastics Mens Individual All-Round', 9, 11);
insert into sport_event values (66, 'Gymnastics Mens Team All-Round',9, 12); -- Helsinki
insert into sport_event values (67, 'Gymnastics Mens Floor Exercise', 9, 12);
insert into sport_event values (68, 'Gymnastics Mens Horse Vault', 9, 12);
insert into sport_event values (69, 'Gymnastics Mens Parallel Bars',9,12);
insert into sport_event values (70, 'Gymnastics Mens Horizontal Bar',9, 12);
insert into sport_event values (71, 'Gymnastics Mens Rings', 9, 12);
insert into sport_event values (72, 'Gymnastics Mens Pommeld Horse', 9, 12);
insert into sport_event values (73, 'Gymnastics Mens Individual All-Round', 12);
insert into sport_event values (22, 'Athletics Mens Shot Put', 11, 8);
insert into sport_event values (23, 'Alpine Skkiing Mens Downhill', 12, 4); -- Albertville
insert into sport_event values (24, 'Alpine Skiing Mens Super G', 12, 4);
insert into sport_event values (25, 'Alpine Skiing Mens Giant Slalom', 12, 4);
insert into sport_event values (78, 'Alpine Skiing Mens Slalom', 12, 4);
insert into sport_event values (74, 'Alpine Skkiing Mens Downhill', 12, 5); -- Lillehammer
insert into sport_event values (75, 'Alpine Skiing Mens Super G', 12, 5);
insert into sport_event values (76, 'Alpine Skiing Mens Giant Slalom', 12, 5);
insert into sport_event values (77, 'Alpine Skiing Mens Combined', 12, 5);
insert into sport_event values (79, 'Alpine Skiing Mens Slalom', 12, 5);
insert into sport_event values (80, 'Alpine Skkiing Mens Downhill', 12, 13); -- Nagano
insert into sport_event values (81, 'Alpine Skiing Mens Super G', 12, 13);
insert into sport_event values (82, 'Alpine Skiing Mens Giant Slalom', 12, 13);
insert into sport_event values (83, 'Alpine Skiing Mens Combined', 12, 13);
insert into sport_event values (84, 'Alpine Skiing Mens Slalom', 12, 13);
insert into sport_event values (85, 'Alpine Skkiing Mens Downhill', 12, 14); -- Torino
insert into sport_event values (86, 'Alpine Skiing Mens Super G', 12, 14);

insert into sport_event values (27, 'Weightlifting Womens Super Heavy Weight', 13, 15); -- Rio
insert into sport_event values (28, 'Wrestling Mens Light Heavy Wieght',14, 8); -- Sydney

insert into sport_event values (29, 'Luge Womens Singles', 15, 17); -- Sarajevo

insert into sport_event values (30, 'Sailing Mixed Three Person Keelbaot',16, 18); -- Mexico
insert into sport_event values (31, 'Rowing Mens Lightweight Double Sculls', 17, 9);-- Atlanta
insert into sport_event values (87, 'Rowing Mens Lightweight Double Sculls', 17, 8); -- Sydney
insert into sport_event values (32, 'Athletics Mens Pole Vault', 11, 20); -- Berlin

insert into sport_event values (33, 'Sailing Mens Two Person Dinghy', 16, 21); -- Barcelona
insert into sport_event values (88, 'Sailing Mens Two Person Dinghy', 16, 9); -- Atlanta
insert into sport_event values (34, 'Bobsleigh Mens Four', 17, 13); -- Nagano

insert into sport_event values (35, 'Swimming Mens 100 metres Butterfly',18, 9); -- Atlanta
insert into sport_event values (36, 'Swimming Mens 200 metres Butterfly',18, 9);
insert into sport_event values (37, 'Swimming Mens 4x100 metres Butterfly',18, 9);

insert into sport_event values (89, 'Swimming Mens 100 metres Butterfly',18, 8); -- Sydney
insert into sport_event values (90, 'Swimming Mens 200 metres Butterfly',18, 8);

insert into sport_event values (38, 'Football Womens Football', 19, 9); -- Atlanta

insert into sport_event values (39, 'Equestrianism Mixed Jumping Individual', 20, 21); -- Barca
insert into sport_event values (91, 'Cross Country Skiing Mens 50 kilometres', 4, 3); -- Salt Lake C
insert into sport_event values (92, 'Cross Country Skiing Mens 10/15 kilometres', 4, 3);
insert into sport_event values (93, 'Cross Country Skiing Mens 4x10 kilometres', 4, 3);
insert into sport_event values (94, 'Cross Country Skiing Mens 30 kilometres', 4, 13); -- Nagano
insert into sport_event values (95, 'Cross Country Skiing Mens 50 kilometres', 4, 13); -- Nagano

insert into sport_event values (40, 'Shooting Mens Trap', 12, 12); -- Helsinki
insert into sport_event values (41, 'Shooting Mens Rapid-Fire Pistol 25 metres', 12, 20); -- Berlin
insert into sport_event values (96, 'Shooting Mens Rapid-Fire Pistol 25 metres', 12, 11); -- London

insert into sport_event values (42, 'Shooting Mens Trap', 12, 22); -- Melbourne
insert into sport_event values (97, 'Shooting Mens Trap', 12, 23); -- Roma

insert into sport_event values (43, 'Athletics Womens Javelin Throw', 11, 16); --Athina
insert into sport_event values (98, 'Athletics Womens Javelin Throw', 11, 24); --Bejing

insert into sport_event values (44, 'Wrestling Mens Heavyweight Freestyle', 14, 21); -- Barca
insert into sport_event values (99, 'Wrestling Mens Heavyweight Freestyle', 14, 9); -- Atlanta

insert into sport_event values (100, 'Gymnastics Mens Team All-Round', 9, 15); -- Rio
insert into sport_event values (101, 'Gymnastics Mens Floor Exercise', 9, 15);
insert into sport_event values (102, 'Gymnastics Mens Horse Vault', 9, 15);
insert into sport_event values (103, 'Gymnastics Mens Parallel Bars', 9, 15);
insert into sport_event values (104, 'Gymnastics Mens Horizontal Bar', 9, 15);
insert into sport_event values (105, 'Gymnastics Mens Rings', 9, 15);
insert into sport_event values (106, 'Gymnastics Mens Pommeld Horse', 9, 15);
insert into sport_event values (107, 'Gymnastics Mens Individual All-Round', 9, 15);

insert into sport_event values (108, 'Athletics Mens Pole Vault', 11, 25); -- Montreal
insert into sport_event values (109, 'Athletics Mens 5,000 metres', 11, 15); -- Rio
insert into sport_event values (55, 'Taekwondo Womens Flyweight', 22, 8); -- Sydney

insert into sport_event values (45, 'Boxing Mens Light-Welterweight', 23, 22); -- Seoul

insert into sport_event values (46, 'Weightlifting Mens Lightweight', 13, 22); -- Melbourne
insert into sport_event values (47, 'Weightlifting Mens Middleweight', 13, 23); -- Roma

insert into sport_event values (48, 'Football Mens Football', 19, 23); --Roma

insert into sport_event values (49, 'Rowing Mens Coxless Pairs', 15, 15);

insert into sport_event values (50, 'Fencing Mens Epee Individual', 24, 24); -- Beijing

insert into sport_event values (112, 'Taekwondo Womens Flyweight', 22, 15); -- Rio

insert into sport_event values (51, 'Handball Mens Handball', 28, 24); -- Beijing
insert into sport_event values (110, 'Handball Mens Handball', 28, 11); -- London
insert into sport_event values (111, 'Handball Mens Handball', 28, 15); -- Rio

insert into sport_event values (52, 'Canoeing Mens Canadian Doubles 500 metres', 25); -- Barca

insert into sport_event values (113, 'Canoeing Mens Kayak Doubles 1000 metres', 16); --Athina
insert into sport_event values (114, 'Canoeing Mens Kayak Doubles 1000 metres', 24); --Beijing

insert into sport_event values (53, 'Diving Mens Platform', 26, 8); -- Sydney
insert into sport_event values (54, 'Basketball Womens Basketball', 1, 24); -- Beijing




insert into participates_in (athlete_id, event_id, "result") values( 1, 1, null);
insert into participates_in (athlete_id, event_id, "result") values( 2, 2, 'Gold');
insert into participates_in (athlete_id, event_id, "result") values( 3, 43, null);
insert into participates_in (athlete_id, event_id, "result") values( 4, 56, null);
insert into participates_in (athlete_id, event_id, "result") values( 5, 76, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 6, 35, null);
insert into participates_in (athlete_id, event_id, "result") values( 7, 23, null);
insert into participates_in (athlete_id, event_id, "result") values( 8, 24, null);
insert into participates_in (athlete_id, event_id, "result") values( 9, 10, null);
insert into participates_in (athlete_id, event_id, "result") values( 10, 28, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 11, 29, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 12, 30, null);
insert into participates_in (athlete_id, event_id, "result") values( 13, 31, null);
insert into participates_in (athlete_id, event_id, "result") values( 14, 32, null);
insert into participates_in (athlete_id, event_id, "result") values( 15, 38, null);
insert into participates_in (athlete_id, event_id, "result") values( 16, 39, null);
insert into participates_in (athlete_id, event_id, "result") values( 17, 40, null);
insert into participates_in (athlete_id, event_id, "result") values( 18, 43, null);
insert into participates_in (athlete_id, event_id, "result") values( 19, 48, null);
insert into participates_in (athlete_id, event_id, "result") values( 20, 47, null);
insert into participates_in (athlete_id, event_id, "result") values( 21, 49, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 22, 20, 'Gold');
insert into participates_in (athlete_id, event_id, "result") values( 23, 3, null);
insert into participates_in (athlete_id, event_id, "result") values( 24, 5, null);
insert into participates_in (athlete_id, event_id, "result") values( 25, 59, null);
insert into participates_in (athlete_id, event_id, "result") values( 26, 67, null);
insert into participates_in (athlete_id, event_id, "result") values( 27, 75, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 28, 33, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 29, 39, null);
insert into participates_in (athlete_id, event_id, "result") values( 30, 51, null);
insert into participates_in (athlete_id, event_id, "result") values( 31, 91, null);
insert into participates_in (athlete_id, event_id, "result") values( 32, 83, null);
insert into participates_in (athlete_id, event_id, "result") values( 33, 96, null);
insert into participates_in (athlete_id, event_id, "result") values( 34, 13, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 35, 77, 'Gold');
insert into participates_in (athlete_id, event_id, "result") values( 36, 112, null);
insert into participates_in (athlete_id, event_id, "result") values( 37, 16, null);
insert into participates_in (athlete_id, event_id, "result") values( 38, 93, null);
insert into participates_in (athlete_id, event_id, "result") values( 39, 49, null);
insert into participates_in (athlete_id, event_id, "result") values( 40, 54, null);
insert into participates_in (athlete_id, event_id, "result") values( 41, 112, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 42, 85, null);
insert into participates_in (athlete_id, event_id, "result") values( 43, 17, null);
insert into participates_in (athlete_id, event_id, "result") values( 44, 38, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 45, 57, null);
insert into participates_in (athlete_id, event_id, "result") values( 46, 95, null);
insert into participates_in (athlete_id, event_id, "result") values( 47, 89, null);
insert into participates_in (athlete_id, event_id, "result") values( 48, 105, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 49, 88, 'Gold');
insert into participates_in (athlete_id, event_id, "result") values( 50, 53, null);
insert into participates_in (athlete_id, event_id, "result") values( 51, 7, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 52, 106, null);
insert into participates_in (athlete_id, event_id, "result") values( 53, 21, null);
insert into participates_in (athlete_id, event_id, "result") values( 54, 19, null);
insert into participates_in (athlete_id, event_id, "result") values( 55, 29, null);
insert into participates_in (athlete_id, event_id, "result") values( 56, 89, null);
insert into participates_in (athlete_id, event_id, "result") values( 57, 78, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 58, 83, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 59, 98, null);
insert into participates_in (athlete_id, event_id, "result") values( 60, 16, null);
insert into participates_in (athlete_id, event_id, "result") values( 61, 44, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 62, 78, null);
insert into participates_in (athlete_id, event_id, "result") values( 63, 97, null);
insert into participates_in (athlete_id, event_id, "result") values( 64, 3, null);
insert into participates_in (athlete_id, event_id, "result") values( 65, 101, 'Bronze');
insert into participates_in (athlete_id, event_id, "result") values( 66, 110, 'Gold');
insert into participates_in (athlete_id, event_id, "result") values( 67, 32, null);
insert into participates_in (athlete_id, event_id, "result") values( 68, 81, null);
insert into participates_in (athlete_id, event_id, "result") values( 69, 96, null);
insert into participates_in (athlete_id, event_id, "result") values( 70, 107, 'Silver');
insert into participates_in (athlete_id, event_id, "result") values( 71, 45, null);
insert into participates_in (athlete_id, event_id, "result") values( 72, 111, 'Bronze');





