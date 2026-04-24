USE bowling_1;
INSERT INTO `CENTRUM_BOWLINGOWE` (`id_centrum`,`nazwa_centrum`,`adres`)
VALUES
  ("1","StrikeUp","Mielec"),
  ("2","StrikeUp","Elbląg"),
  ("4","StrikeUp","Radom"),
  ("3","StrikeUp","Ostrowiec Świętokrzyski");
  

INSERT INTO `PRACOWNIK` (`numer_pesel`,`imie`,`nazwisko`,`numer_telefonu`,`email_p`,`data_zatrudnienia`,`aktywnosc`,`id_centrum`)
VALUES
  ("31588717412","Paloma","Livingston","130487786","livingstonpaloma@protonmail.net","2025-05-16","1",1),
  ("87586381227","Ralph","Meadows","527665741","r.meadows@protonmail.net","2025-03-07","1",2),
  ("26686815862","MacKensie","Branch","486338227","mbranch@yahoo.couk","2025-05-20","0",1),
  ("13856064491","Regan","Hall","676217846","r_hall4491@hotmail.com","2024-07-24","1",1),
  ("14750200726","Keith","Chandler","311068593","keithchandler@google.org","2025-02-07","0",2),
  ("12568580543","Fiona","Rasmussen","276956412","rasmussenfiona2016@yahoo.net","2024-10-29","0",1),
  ("11627966484","Keaton","Sharpe","493921438","k.sharpe@google.ca","2026-08-04","1",1),
  ("84765698490","Dustin","Fuentes","451232131","fuentesdustin@outlook.com","2025-09-05","0",1),
  ("22564415987","Abbot","Peters","858254626","a-peters3150@protonmail.com","2024-08-05","1",2),
  ("76228880739","Jonah","Garrett","511162570","g_jonah@hotmail.com","2025-03-09","1",1),
  ("17574942408","Beck","Lott","223234412","lott_beck1187@aol.ca","2024-07-16","1",1),
  ("23051012816","Zane","Keith","889763775","keith.zane3942@yahoo.edu","2025-08-25","0",1),
  ("38113442855","Leila","Mueller","434873483","l.mueller7491@protonmail.net","2024-09-15","0",1),
  ("75295086586","Jana","Chambers","892654729","c-jana101@icloud.couk","2025-06-14","1",1),
  ("35513433689","Martin","Boyle","756146628","m_boyle8421@protonmail.edu","2027-01-05","0",1),
  ("50125438192","Xantha","Robles","183272784","xrobles@icloud.org","2025-04-13","0",2),
  ("12205837343","Macaulay","Boyle","534955556","boyle-macaulay2990@outlook.ca","2026-04-09","1",1),
  ("11627757353","Christopher","Moran","668266581","moran.christopher@icloud.net","2026-06-05","0",1),
  ("97142581471","Cairo","Tate","917575546","c-tate@protonmail.couk","2024-11-10","1",1),
  ("74176856574","Amber","Salazar","536487713","asalazar4356@hotmail.edu","2025-12-23","0",2),
  ("09888185780","Guy","Norton","597480762","norton-guy@hotmail.ca","2025-12-12","0",1),
  ("12347513206","Cassady","Marks","966940717","c-marks@aol.net","2026-11-07","1",1),
  ("58873185011","Nell","Rios","647220629","nell-rios2075@icloud.org","2026-11-27","0",1),
  ("24706442343","Salvador","Arnold","331558455","salvador.arnold@icloud.couk","2026-12-18","0",1),
  ("94221739458","Conan","Lamb","684652155","conan-lamb231@google.ca","2025-03-12","0",2);


INSERT INTO `STANOWISKO_PRACY` (`nazwa_roli`,`typ_umowy`,`is_hourly`)
VALUES
  ("Instruktor bowlingu","Umowa zlecenie","1"),
  ("Instruktor bowlingu","Umowa o prace","0"),
  ("Instruktor bowlingu","Umowa o dzieło","0"),
  ("Instruktor bowlingu","B2B","0"),
  ("Mechanik","Umowa zlecenie","1"),
  ("Mechanik","Umowa o prace","0"),
  ("Mechanik","Umowa o dzieło","0"),
  ("Mechanik","B2B","0"),
  ("Recepcjonista","Umowa zlecenie","1"),
  ("Recepcjonista","Umowa o prace","0"),
  ("Recepcjonista","Umowa o dzieło","0"),
  ("Recepcjonista","B2B","0"),
  ("Manager","Umowa zlecenie","1"),
  ("Manager","Umowa o prace","0"),
  ("Manager","Umowa o dzieło","0"),
  ("Manager","B2B","0"),
  ("Barman","Umowa zlecenie","1"),
  ("Barman","Umowa o prace","0"),
  ("Barman","Umowa o dzieło","0"),
  ("Barman","B2B","0"),
  ("Ochroniarz","Umowa zlecenie","1"),
  ("Ochroniarz","Umowa o prace","0"),
  ("Ochroniarz","Umowa o dzieło","0"),
  ("Ochroniarz","B2B","0");



INSERT INTO ZATRUDNIENIE (numer_pesel, nazwa_roli,typ_umowy, data_rozpoczecia, data_zakonczenia, pensja) VALUES
-- aktywni pracownicy
('31588717412','Instruktor bowlingu' ,"Umowa o prace",'2025-05-16',NULL,3500.00),
('87586381227','Recepcjonista',"Umowa o prace",'2025-03-07',NULL,3000.00),
('13856064491','Barman',"Umowa o prace",'2024-07-24',NULL,3200.00),
('11627966484','Manager',"Umowa o prace",'2026-08-04',NULL,6000.00),
('76228880739','Instruktor bowlingu',"Umowa o prace",'2025-03-09',NULL,3500.00),
('22564415987','Mechanik',"Umowa o prace",'2024-08-05',NULL,2800.00),
('75295086586','Recepcjonista',"Umowa o prace",'2025-06-14',NULL,3000.00),

-- byli pracownicy
('26686815862','Instruktor bowlingu',"Umowa o prace",'2025-05-20','2025-12-31',2500.00),
('14750200726','Barman',"Umowa o prace",'2025-02-07','2025-08-31',2600.00),
('12568580543','Mechanik',"Umowa o prace",'2024-10-29','2025-09-30',2700.00),
('84765698490','Manager',"Umowa o prace",'2025-09-05','2026-01-31',5500.00),
('23051012816','Ochroniarz',"Umowa o prace",'2025-08-25','2026-02-28',2800.00),
('38113442855','Recepcjonista',"Umowa o prace",'2024-09-15','2025-03-31',2900.00),
('35513433689','Barman',"Umowa o prace",'2027-01-05','2027-06-30',3100.00),
('50125438192','Instruktor bowlingu',"Umowa o prace",'2025-04-13','2025-10-31',2500.00);


INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (1,"Dominique","Peck","fermentum.risus@outlook.com","285932246","2025-03-15"),
  (2,"Simone","Mcmillan","a.auctor.non@google.couk","956980286","2025-03-02"),
  (3,"Ramona","Crane","enim@google.edu","631663503","2026-02-21"),
  (4,"Iliana","French","ultrices.posuere@protonmail.edu","530532653","2025-07-24"),
  (5,"Selma","Hodge","quisque.porttitor@yahoo.couk","141443513","2026-01-08"),
  (6,"Charlotte","Oneil","mollis.lectus@hotmail.edu","126482354","2025-02-06"),
  (7,"Judah","Hurley","hendrerit.donec.porttitor@icloud.net","617724641","2025-08-07"),
  (8,"Hiroko","Duffy","tortor.dictum@hotmail.ca","742811024","2025-11-25"),
  (9,"Basil","Rosales","dui.cum.sociis@protonmail.org","211634753","2025-08-08"),
  (10,"Marsden","Day","magnis.dis.parturient@outlook.couk","971029348","2025-08-09");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (11,"Carol","Wilkins","tellus.imperdiet.non@icloud.couk","783882777","2025-03-27"),
  (12,"Cassidy","Talley","ac.mattis.velit@protonmail.ca","715308204","2025-02-21"),
  (13,"Rogan","Wheeler","mi.eleifend@hotmail.ca","824253283","2026-01-09"),
  (14,"Kenneth","Farley","aliquet@yahoo.ca","135414806","2025-08-28"),
  (15,"Megan","Velasquez","odio.aliquam@hotmail.edu","838473370","2026-02-21"),
  (16,"Melyssa","Roth","posuere.vulputate@protonmail.org","262935766","2025-03-14"),
  (17,"Wayne","Stout","nulla.vulputate.dui@outlook.org","823204528","2025-03-03"),
  (18,"Keith","Larsen","nunc@hotmail.couk","111803318","2025-02-08"),
  (19,"Kimberly","Thornton","adipiscing.non@outlook.couk","118951315","2025-11-28"),
  (20,"Cassidy","Chen","dui.quis@aol.couk","143862388","2026-01-23");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (21,"Rajah","Mckenzie","donec@outlook.net","857889326","2025-05-30"),
  (22,"Vernon","Black","nonummy.ipsum.non@hotmail.ca","430317136","2025-09-23"),
  (23,"Phillip","Hebert","sit@icloud.net","212763277","2025-12-25"),
  (24,"Macey","Slater","molestie@hotmail.ca","653437084","2025-02-27"),
  (25,"Isaiah","Flores","et.tristique.pellentesque@icloud.ca","643576193","2025-02-14"),
  (26,"Clementine","Davis","dolor.dolor@google.net","460735237","2025-05-18"),
  (27,"Drake","Aguirre","eu.arcu@google.ca","953598565","2025-02-21"),
  (28,"Hanna","Browning","non.enim.commodo@yahoo.edu","366416314","2025-05-15"),
  (29,"Lacy","Hamilton","eleifend.non.dapibus@google.edu","558544928","2025-02-23"),
  (30,"Melodie","Faulkner","eleifend@protonmail.ca","017973106","2025-11-20");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (31,"Vladimir","Sexton","vulputate.lacus@protonmail.edu","781450581","2025-08-09"),
  (32,"Diana","Vazquez","quisque.ornare@aol.ca","232977383","2026-01-17"),
  (33,"Wyatt","Sears","arcu.vestibulum.ante@aol.com","772656455","2025-08-18"),
  (34,"Quintessa","Bell","nisi@aol.edu","932508135","2025-03-21"),
  (35,"Guinevere","Morales","pellentesque.habitant@outlook.net","851684217","2026-02-18"),
  (36,"Brent","Hicks","nullam@google.ca","655125612","2025-12-08"),
  (37,"Abdul","Frederick","nec.tempus.scelerisque@aol.edu","634160640","2025-02-20"),
  (38,"Kaitlin","Hubbard","ipsum.curabitur.consequat@protonmail.ca","256927453","2025-02-17"),
  (39,"Bree","Hinton","a.enim@google.ca","382627612","2026-01-01"),
  (40,"Florence","Duke","diam.eu@protonmail.net","650552967","2025-02-20");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (41,"Reed","Todd","donec.egestas.duis@yahoo.couk","258669678","2025-02-25"),
  (42,"Ciara","Arnold","elementum.lorem@google.net","731312326","2025-09-27"),
  (43,"Bryar","Hunter","ornare.sagittis.felis@icloud.ca","366612396","2025-04-24"),
  (44,"Len","Albert","aliquam.ultrices@outlook.com","548528391","2025-04-12"),
  (45,"Leah","Jarvis","rutrum@icloud.com","243133481","2025-06-06"),
  (46,"Justin","Martin","libero@hotmail.ca","422407810","2025-03-18"),
  (47,"Byron","Kline","lorem.ipsum.sodales@aol.couk","855453633","2025-06-23"),
  (48,"Constance","Reyes","ornare.egestas@icloud.edu","453657315","2025-04-17"),
  (49,"Dominique","Bruce","feugiat.metus@hotmail.couk","481980664","2025-07-05"),
  (50,"Hayley","Mcpherson","pharetra.sed@icloud.edu","181218413","2025-06-21");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (51,"Barrett","Madden","tempor@hotmail.couk","243611388","2025-06-25"),
  (52,"Quinn","Sharp","nibh.aliquam@protonmail.com","736966048","2025-09-14"),
  (53,"Warren","Rich","massa.mauris@hotmail.edu","773671754","2025-09-29"),
  (54,"Ryan","Ward","interdum.libero@protonmail.org","253683386","2026-01-01"),
  (55,"Penelope","Foley","sit.amet@hotmail.net","344377466","2025-04-21"),
  (56,"Oleg","Hooper","tincidunt.orci@aol.com","856557936","2025-11-01"),
  (57,"Harrison","Young","odio.vel@hotmail.ca","134322987","2025-09-25"),
  (58,"Samson","Hutchinson","nunc.in@hotmail.edu","511657507","2025-06-04"),
  (59,"Troy","Nguyen","ac.libero@protonmail.com","833956421","2025-05-15"),
  (60,"Melissa","Caldwell","morbi.non@yahoo.couk","187286678","2025-09-15");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (61,"Leroy","Burke","magna.sed.eu@hotmail.edu","410782546","2025-07-29"),
  (62,"Hadley","Giles","eu@yahoo.ca","801831736","2025-04-26"),
  (63,"Damon","Rodriguez","diam.sed.diam@hotmail.edu","567398203","2025-07-23"),
  (64,"Chiquita","Potter","in.at@icloud.ca","418111178","2025-08-20"),
  (65,"Nehru","Hebert","luctus.curabitur.egestas@hotmail.couk","571118332","2026-02-14"),
  (66,"Shad","Wood","tempor.diam@outlook.org","252149561","2025-11-24"),
  (67,"Sydnee","Chase","tempor.lorem.eget@google.com","380385281","2025-07-23"),
  (68,"Lysandra","Collier","duis.risus.odio@hotmail.org","254951954","2025-03-18"),
  (69,"Ian","Kirk","luctus@icloud.edu","313725377","2025-02-09"),
  (70,"Caryn","Hart","eros.turpis@google.org","455362248","2025-07-30");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (71,"Brett","Haley","posuere@google.org","285270735","2025-09-17"),
  (72,"Flavia","White","ut@outlook.edu","746303113","2025-09-08"),
  (73,"Shad","Byers","id.mollis@protonmail.net","308248852","2026-02-05"),
  (74,"Hedy","Hoffman","dui@outlook.ca","768657235","2025-08-25"),
  (75,"Honorato","Solis","at@hotmail.couk","888831379","2026-01-11"),
  (76,"Christopher","Nicholson","adipiscing.fringilla@icloud.edu","109042477","2025-07-19"),
  (77,"Neville","Whitehead","non@outlook.org","339105740","2025-05-05"),
  (78,"Chadwick","Potter","quis.arcu.vel@outlook.ca","628577594","2025-12-07"),
  (79,"Serena","Carson","ac.tellus@icloud.net","615386382","2025-10-16"),
  (80,"Gillian","Roach","est.mauris@protonmail.couk","446043244","2025-07-22");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (81,"Isaiah","Adams","nec.mauris@aol.edu","774833910","2025-02-04"),
  (82,"Raphael","Mendoza","ornare.fusce@icloud.edu","967685171","2025-10-20"),
  (83,"Richard","Brennan","rhoncus.proin.nisl@outlook.edu","244145660","2025-06-04"),
  (84,"Denton","Bates","pellentesque.habitant.morbi@google.ca","146888587","2025-12-06"),
  (85,"Seth","Flores","egestas.nunc.sed@hotmail.com","527987636","2025-03-06"),
  (86,"Charity","Schwartz","augue@aol.couk","675912428","2025-03-14"),
  (87,"April","Good","ante.ipsum@google.com","423137191","2025-02-24"),
  (88,"Allistair","Roberson","nonummy.ultricies@aol.com","518674646","2025-07-17"),
  (89,"Harding","Cole","justo.faucibus@protonmail.ca","383477749","2025-07-31"),
  (90,"Jolie","Mcgowan","vel.arcu@aol.net","146601785","2025-10-23");
INSERT INTO `KLIENT` (`id_klient`,`imie`,`nazwisko`,`email`,`numer_tel`,`data_rejestracji`)
VALUES
  (91,"Alexis","Cohen","dictum.sapien@icloud.couk","015712335","2025-10-16"),
  (92,"Marshall","Park","sodales.at@google.ca","416686457","2025-04-23"),
  (93,"Victor","Wilkerson","nec.ante@yahoo.net","422843165","2025-05-30"),
  (94,"Wesley","Fox","auctor.odio@outlook.couk","574743729","2025-11-27"),
  (95,"Kerry","Welch","cursus.diam.at@hotmail.org","813011616","2025-05-31"),
  (96,"Steel","Dunlap","tincidunt.congue@google.org","258363310","2025-09-01"),
  (97,"Evan","Hayden","egestas.aliquam@protonmail.org","331218953","2025-04-11"),
  (98,"Andrew","Hart","tincidunt@aol.couk","712536816","2025-07-20"),
  (99,"Dale","Walsh","tincidunt.tempus.risus@hotmail.couk","525875948","2025-11-01"),
  (100,"Randall","Davenport","parturient.montes@aol.ca","408365416","2025-06-25");
  
  -- Очистим старые цены, чтобы не было конфликтов первичных ключей
TRUNCATE TABLE LISTA_CEN;

INSERT INTO LISTA_CEN (dzien_tygodnia, czas_start, czas_stop, cena_za_godzine) VALUES
-- Poniedziałek (Бюджетный день)
('Poniedziałek', '10:00:00', '12:30:00', 35.00),
('Poniedziałek', '12:30:00', '15:00:00', 40.00),
('Poniedziałek', '15:00:00', '17:30:00', 45.00),
('Poniedziałek', '17:30:00', '20:00:00', 50.00),
('Poniedziałek', '20:00:00', '22:00:00', 55.00),

-- Wtorek
('Wtorek', '10:00:00', '12:30:00', 38.00),
('Wtorek', '12:30:00', '15:00:00', 42.00),
('Wtorek', '15:00:00', '17:30:00', 48.00),
('Wtorek', '17:30:00', '20:00:00', 52.00),
('Wtorek', '20:00:00', '22:00:00', 58.00),

-- Środa
('Środa', '10:00:00', '12:30:00', 40.00),
('Środa', '12:30:00', '15:00:00', 45.00),
('Środa', '15:00:00', '17:30:00', 50.00),
('Środa', '17:30:00', '20:00:00', 55.00),
('Środa', '20:00:00', '22:00:00', 60.00),

-- Czwartek (Маленькая пятница)
('Czwartek', '10:00:00', '12:30:00', 45.00),
('Czwartek', '12:30:00', '15:00:00', 50.00),
('Czwartek', '15:00:00', '17:30:00', 55.00),
('Czwartek', '17:30:00', '20:00:00', 65.00),
('Czwartek', '20:00:00', '22:00:00', 70.00),

-- Piątek (Вечерний пик)
('Piątek', '10:00:00', '12:30:00', 50.00),
('Piątek', '12:30:00', '15:00:00', 60.00),
('Piątek', '15:00:00', '17:30:00', 70.00),
('Piątek', '17:30:00', '20:00:00', 85.00),
('Piątek', '20:00:00', '22:00:00', 95.00),

-- Sobota (Максимальный тариф)
('Sobota', '10:00:00', '12:30:00', 70.00),
('Sobota', '12:30:00', '15:00:00', 85.00),
('Sobota', '15:00:00', '17:30:00', 95.00),
('Sobota', '17:30:00', '20:00:00', 110.00),
('Sobota', '20:00:00', '22:00:00', 120.00),

-- Niedziela (Семейный день)
('Niedziela', '10:00:00', '12:30:00', 60.00),
('Niedziela', '12:30:00', '15:00:00', 70.00),
('Niedziela', '15:00:00', '17:30:00', 80.00),
('Niedziela', '17:30:00', '20:00:00', 85.00),
('Niedziela', '20:00:00', '22:00:00', 90.00);

INSERT INTO `METODA_PLATNOSCI` (`id_metody`,`nazwa_metody`,`czy_aktywna`)
VALUES
  (1,"Przelew bankowy","1"),
  (2,"Gotówka","1"),
  (3,"Pobranie","0"),
  (4,"Karta płatnicza","1"),
  (5,"Kredyt kupiecki","0"),
  (6,"BLIK","1");
  
  
  INSERT INTO `TOR` (`id_centrum`,`numer_toru`,`czy_aktywny`)
VALUES
  ("1",1,"1"),
  ("1",2,"1"),
  ("1",3,"1"),
  ("1",4,"1"),
  ("1",5,"1"),
  ("1",6,"1"),
  ("1",7,"1"),
  ("1",8,"1"),
  ("1",9,"1"),
  ("1",10,"1"),
  ("1",11,"1"),
  ("1",12,"1"),
  ("1",13,"1"),
  ("1",14,"1"),
  ("1",15,"1"),
  ("1",16,"1"),
  ("1",17,"1"),
  ("1",18,"1"),
  ("1",19,"1"),
  ("1",20,"1"),
  ("1",21,"1"),
  ("1",22,"1"),
  ("1",23,"1"),
  ("1",24,"1");
  
INSERT INTO `TOR` (`id_centrum`,`numer_toru`,`czy_aktywny`)
VALUES
  ("2",1,"1"),
  ("2",2,"1"),
  ("2",3,"1"),
  ("2",4,"1"),
  ("2",5,"1"),
  ("2",6,"1"),
  ("2",7,"1"),
  ("2",8,"1"),
  ("2",9,"1"),
  ("2",10,"1"),
  ("2",11,"1"),
  ("2",12,"1"),
  ("2",13,"1"),
  ("2",14,"1"),
  ("2",15,"1"),
  ("2",16,"1"),
  ("2",17,"1"),
  ("2",18,"1"),
  ("2",19,"1"),
  ("2",20,"1"),
  ("2",21,"1"),
  ("2",22,"1"),
  ("2",23,"1"),
  ("2",24,"1");

USE bowling_1;
INSERT INTO `ZNIZKA` (`nazwa_znizki`,`procent`,`aktywnosc`)
VALUES
  ("student","0.5","0"),
  ("niepełnosprawność","0.75","1"),
  ("multisport","0.5","1");
  
  INSERT INTO `MOZLIWE_ZNIZKI_KLIENTA` (`id_klient`,`nazwa_znizki`)
VALUES
  (1,"niepełnosprawność"),
  (2,"student"),
  (3,"student"),
  (4,"student"),
  (5,"niepełnosprawność"),
  (6,"multisport"),
  (7,"multisport"),
  (8,"multisport"),
  (9,"multisport"),
  (10,"niepełnosprawność"),
  (11,"multisport"),
  (12,"student"),
  (13,"multisport"),
  (14,"student"),
  (15,"student"),
  (16,"multisport"),
  (17,"multisport"),
  (18,"student"),
  (19,"niepełnosprawność"),
  (20,"multisport"),
  (21,"multisport"),
  (22,"niepełnosprawność"),
  (23,"niepełnosprawność"),
  (24,"student"),
  (25,"multisport"),
  (26,"multisport"),
  (27,"student"),
  (28,"niepełnosprawność"),
  (29,"student"),
  (30,"student"),
  (31,"multisport"),
  (32,"student"),
  (33,"niepełnosprawność"),
  (34,"niepełnosprawność"),
  (35,"multisport"),
  (36,"student"),
  (37,"multisport"),
  (38,"multisport"),
  (39,"multisport"),
  (40,"multisport"),
  (41,"student"),
  (42,"multisport"),
  (43,"multisport"),
  (44,"multisport"),
  (45,"student"),
  (46,"niepełnosprawność"),
  (47,"multisport"),
  (48,"student"),
  (49,"student"),
  (50,"student");




INSERT INTO REZERWACJA (id_klient, data_rez, czas_start_rez, id_centrum, nazwa_znizki, czas_stop_rez ) VALUES
(1, '2025-03-17', '10:00:00', 1, 'niepełnosprawność', '12:00:00'),
(2, '2025-03-17', '14:00:00', 1, NULL, '16:00:00' ),
(6, '2025-03-18', '10:00:00', 2, 'multisport', '12:00:00' ),
(10, '2025-03-20', '18:00:00', 1, 'niepełnosprawność', '20:00:00'),
(20, '2025-03-21', '16:00:00', 2, 'multisport', '18:00:00' ),
(60, '2025-03-19', '12:00:00', 1, NULL, '14:00:00' ),
(35, '2025-03-22', '12:00:00', 4, 'multisport', '14:00:00' ),
(13, '2025-03-18', '18:00:00', 2, 'multisport', '20:00:00' );



INSERT INTO REZERWACJA_TOR (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru ) VALUES
(1, '2025-03-17', '10:00:00', 1, 1),
(2, '2025-03-17', '14:00:00', 1, 2),
(6, '2025-03-18', '10:00:00', 2, 3),
(10, '2025-03-20', '18:00:00', 1, 4),
(20, '2025-03-21', '16:00:00', 2, 5),
(60, '2025-03-19', '12:00:00', 1, 6),
(13, '2025-03-18', '18:00:00', 2, 8);


INSERT INTO PLATNOSC (id_centrum, id_klient, data_rez, czas_start_rez, kod_platnosci, kwota, id_metody) 
VALUES (1, 1, '2025-03-17', '10:00:00', 'PAY-FULL-001', 20.00, 4);
INSERT INTO PLATNOSC (id_centrum, id_klient, data_rez, czas_start_rez, kod_platnosci, kwota, id_metody) 
VALUES (2, 6, '2025-03-18', '10:00:00', 'PAY-PART-002', 20.00, 6);
INSERT INTO PLATNOSC (id_centrum, id_klient, data_rez, czas_start_rez, kod_platnosci, kwota, id_metody) 
VALUES (2, 20, '2025-03-21', '16:00:00', 'PAY-STEP-1', 50.00, 2);
INSERT INTO PLATNOSC (id_centrum, id_klient, data_rez, czas_start_rez, kod_platnosci, kwota, id_metody) 
VALUES (2, 20, '2025-03-21', '16:00:00', 'PAY-STEP-2', 30.00, 4);
INSERT INTO PLATNOSC (id_centrum, id_klient, data_rez, czas_start_rez, kod_platnosci, kwota, id_metody) 
VALUES (2, 20, '2025-03-21', '16:00:00', 'PAY-STEP-3', 59.30, 4);


INSERT INTO GRACZ (id_player, nickname, data_dolaczenia) VALUES
(1,  'StrikeMaster',      '2025-03-17 09:45:00'),
(2,  'PinCrusher',       '2025-03-17 10:05:00'),
(3,  'SpareHunter',      '2025-03-18 11:20:00'),
(4,  'GutterGuru',       '2025-03-18 17:50:00'),
(5,  'LaneLegend',       '2025-03-19 12:10:00'),
(6,  'AlleyAce',         '2025-03-20 18:05:00'),
(7,  'BallisticPete',    '2025-03-21 16:30:00'),
(8,  'TenPinTina',       '2025-03-22 12:45:00'),
(9,  'CurveKing',        '2025-03-22 13:00:00'),
(10, 'SplitSmasher',     '2025-03-23 14:15:00'),
(11, 'TurboToss',        '2025-03-24 15:40:00'),
(12, 'BowlingBella',     '2025-03-25 16:00:00'),
(13, 'FrameFury',        '2025-03-26 17:10:00'),
(14, 'PinPal',           '2025-03-27 18:25:00'),
(15, 'LaneRanger',       '2025-03-28 19:30:00'),
(16, 'StrikeShadow',     '2025-03-29 20:05:00'),
(17, 'SpareWhisperer',   '2025-03-30 09:55:00'),
(18, 'KingOfKregle',     '2025-03-31 11:11:00'),
(19, 'QueenOfPins',      '2025-04-01 12:12:00'),
(20, 'LuckyRoller',      '2025-04-02 13:13:00');



--
INSERT  INTO GRA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry)
VALUES (1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00');

INSERT  INTO STATYSTYKA_GRACZA_W_GRZE (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, id_player)
VALUES 
(1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00', 1),
(1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00', 2);

INSERT INTO RUNDA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy)
VALUES (1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00', 1);

INSERT INTO RUNDA_DLA_GRACZA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy, id_player)
VALUES 
(1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00', 1, 1),
(1, '2025-03-17', '10:00:00', 1, 1, '2025-03-17 10:05:00', 1, 2);



INSERT INTO RZUT (
    id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, 
    czas_start_gry, numer_rundy, id_player, numer_rzutu, ilosc_kregli
) VALUES (
    1, '2025-03-17', '10:00:00', 1, 1, 
    '2025-03-17 10:05:00', 1, 1, 1, 8
);

INSERT INTO RZUT (
    id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, 
    czas_start_gry, numer_rundy, id_player, numer_rzutu, ilosc_kregli
) VALUES (
    1, '2025-03-17', '10:00:00', 1, 1, 
    '2025-03-17 10:05:00', 1, 1, 2, 2
);