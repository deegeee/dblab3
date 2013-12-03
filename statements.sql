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

create table Verkaeufer
(
	personalNr integer primary key,
	raum integer,
	vorname varchar2(50),
	nachname varchar2(50)
);

create table Auftrag
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
