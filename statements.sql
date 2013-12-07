/* Tabellen */
create table Auto
(	autoNr integer primary key,
	farbe varchar2(10),
	model varchar2(100),
	ps integer
);

create table Kunde
(
	kundenNr integer primary key,
	geburtsdatum date,
	vorname varchar2(50),
	nachname varchar2(50)
);	

create table Mitarbeiter
(
	personalNr integer primary key,
	raum integer,
	vorname varchar2(50),
	nachname varchar2(50)
);

create table mietet
(
	auftragsNr integer primary key,
	datum date,
	kundenNr integer,
	autoNr integer,
	personalNr integer,
	foreign key (kundenNr) references Kunde (kundenNr),
	foreign key (autoNr) references Auto (autoNr),
	foreign key (personalNr) references Verkaeufer (personalNr)
);

/* Daten */

/* PLATZHALTER aus lab1 muss geaendert werden */

/* Auto (int, varchar, varchar, int) */
insert into Auto
values (1, 'Peter', 'Pan', '77652 Offenburg');
insert into Auto
values (2, 'Klaus', 'Klaus', '77652 Offenburg');
insert into Auto
values (3, 'Tom', 'Tom', '77652 Offenburg');
insert into Auto
values (4, 'Wald', 'Traud', '77652 Offenburg');
insert into Auto
values (5, 'Ger', 'Linde', '77652 Offenburg');


/* Kunde (int, date, varchar, varchar) */
insert into Kunde
values (1, 'Peter', 'Pan', '77652 Offenburg');
insert into Kunde
values (2, 'Klaus', 'Klaus', '77652 Offenburg');
insert into Kunde
values (3, 'Tom', 'Tom', '77652 Offenburg');
insert into Kunde
values (4, 'Wald', 'Traud', '77652 Offenburg');
insert into Kunde
values (5, 'Ger', 'Linde', '77652 Offenburg');

commit;

/* Verkaeufer (int, int, varchar, varchar) */
insert into Verkaeufer
values (1, 'James', 'Bond', 1000, 1);
insert into Verkaeufer
values (2, 'Jack', 'Bauer', 2000, 2);
insert into Verkaeufer
values (3, 'Rowan', 'Atkinson', 2000, 1);
insert into Verkaeufer
values (4, 'Ricki', 'Gervais', 2000, 2);
insert into Verkaeufer
values (5, 'Milli', 'Vanilli', 2000, 1);

commit;

/* Auftrag (int, date, int, int, int) */

insert into Auftrag
values (1, 1, 1, 'Kredit', 1);  

insert into Auftrag
values (2, 3, 2, 'Leihe', 2);   

commit;
