create table Auto
(        autoNr integer primary key,
        farbe varchar(10),
        model varchar(100),
        ps integer
);


create table Kunde
(
        kundenNr integer primary key,
        vorname varchar(50),
        nachname varchar(50),
		geburtsdatum date
);        


create table Mitarbeiter
(
        personalNr integer primary key,
        raum integer,
        vorname varchar(50),
        nachname varchar(50)
);


create table mietet
(
        auftragsNr integer primary key,
        kundenNr integer,
		datum date,
        autoNr integer,
        personalNr integer,
);


/* Daten */


/* PLATZHALTER aus lab1 muss geaendert werden */


/* Auto (int, varchar, varchar, int) */
insert into Auto
values (1, 'rot', 'Mercedes SLK 3000', 362);
insert into Auto
values (2, 'gelb', 'Porsche 911', 621);
insert into Auto
values (3, 'weiss', 'Seat Ibiza', 105);
insert into Auto
values (4, 'pink', 'Smart', 1001);
insert into Auto
values (5, 'schwarz', 'Hummer', 440);




/* Kunde (int, varchar, varchar, date) */
insert into Kunde
values (1, 'Peter', 'Pan', '01-JAN-1990 00:00');
insert into Kunde
values (2, 'Klaus', 'Klawus', '21-JAN-1980 00:00');
insert into Kunde
values (3, 'Tom', 'Tomer', '01-JAN-1992 00:00');
insert into Kunde
values (4, 'Wald', 'Traud', '02-JAN-1998 00:00');
insert into Kunde
values (5, 'Ger', 'Linde', '01-JAN-1991 00:00');


commit;


/* Mitarbeiter (int, int, varchar, varchar) */
insert into Mitarbeiter
values (1, 7, 'James', 'Bond');
insert into Mitarbeiter
values (2, 8, 'Johann', 'Zum');
insert into Mitarbeiter
values (3, 9, 'Olewa', 'Kack');
insert into Mitarbeiter
values (4, 10, 'Friedrich', 'Shei');
insert into Mitarbeiter
values (5, 11, 'Ku Wi', 'Wong');

commit;


/* Auftrag (int, int, date, int, int) */


insert into mietet
values (1, 2, '01-JAN-2012 00:00', 3, 2);   

insert into mietet
values (2, 3, '01-DEZ-2013 00:00', 4, 1);    
commit;
