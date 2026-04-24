USE bowling_1;

-- MOZLIWE_ZNIZKI_KLIENTA
ALTER TABLE MOZLIWE_ZNIZKI_KLIENTA 
ADD CONSTRAINT fk_mzk_klient FOREIGN KEY (id_klient) REFERENCES KLIENT(id_klient) ON DELETE CASCADE,
ADD CONSTRAINT fk_mzk_znizka FOREIGN KEY (nazwa_znizki) REFERENCES ZNIZKA(nazwa_znizki) ON DELETE CASCADE;

--  PRACOWNIK
ALTER TABLE PRACOWNIK 
ADD CONSTRAINT fk_pracownik_centrum FOREIGN KEY (id_centrum) REFERENCES CENTRUM_BOWLINGOWE(id_centrum) ON DELETE RESTRICT;

--  ZATRUDNIENIE
ALTER TABLE ZATRUDNIENIE 
ADD CONSTRAINT fk_zatr_pracownik FOREIGN KEY (numer_pesel) REFERENCES PRACOWNIK(numer_pesel) ON DELETE CASCADE,
ADD CONSTRAINT fk_zatr_stanowisko FOREIGN KEY (nazwa_roli,typ_umowy) REFERENCES STANOWISKO_PRACY(nazwa_roli,typ_umowy) ON DELETE CASCADE;

-- REZERWACJA
ALTER TABLE REZERWACJA 
ADD CONSTRAINT fk_rez_klient FOREIGN KEY (id_klient) REFERENCES KLIENT(id_klient),
ADD CONSTRAINT fk_rez_znizka_klienta FOREIGN KEY (id_klient, nazwa_znizki) REFERENCES MOZLIWE_ZNIZKI_KLIENTA(id_klient, nazwa_znizki),
ADD CONSTRAINT fk_rez_centrum FOREIGN KEY (id_centrum) REFERENCES CENTRUM_BOWLINGOWE(id_centrum) ON DELETE CASCADE;

--  PLATNOSC
ALTER TABLE PLATNOSC 
ADD CONSTRAINT fk_plat_metoda FOREIGN KEY (id_metody) REFERENCES METODA_PLATNOSCI(id_metody),
ADD CONSTRAINT fk_plat_rez FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum) REFERENCES REZERWACJA(id_klient, data_rez, czas_start_rez, id_centrum);

--  TOR
ALTER TABLE TOR 
ADD CONSTRAINT fk_tor_centrum FOREIGN KEY (id_centrum) REFERENCES CENTRUM_BOWLINGOWE(id_centrum) ON DELETE CASCADE;

--  REZERWACJA_TOR
ALTER TABLE REZERWACJA_TOR 
ADD CONSTRAINT fk_rt_rezerwacja FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum) REFERENCES REZERWACJA(id_klient, data_rez, czas_start_rez, id_centrum) ON DELETE CASCADE,
ADD CONSTRAINT fk_rt_tor FOREIGN KEY (id_centrum, numer_toru) REFERENCES TOR(id_centrum, numer_toru);

--  GRA
ALTER TABLE GRA 
ADD CONSTRAINT fk_gra_plan FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru) REFERENCES REZERWACJA_TOR(id_klient, data_rez, czas_start_rez, id_centrum, numer_toru) ON DELETE CASCADE;

--  STATYSTYKA_GRACZA_W_GRZE
ALTER TABLE STATYSTYKA_GRACZA_W_GRZE 
ADD CONSTRAINT fk_stats_gra FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry) REFERENCES GRA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry) ON DELETE CASCADE,
ADD CONSTRAINT fk_stats_gracz FOREIGN KEY (id_player) REFERENCES GRACZ(id_player);

-- RUNDA
ALTER TABLE RUNDA 
ADD CONSTRAINT fk_runda_gra FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry) REFERENCES GRA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry) ON DELETE CASCADE;

--  RUNDA_DLA_GRACZA
ALTER TABLE RUNDA_DLA_GRACZA 
ADD CONSTRAINT fk_rdg_runda FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy) REFERENCES RUNDA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy) ON DELETE CASCADE,
ADD CONSTRAINT fk_rdg_gracz FOREIGN KEY (id_player) REFERENCES GRACZ(id_player) ON DELETE CASCADE;

--  RZUT
ALTER TABLE RZUT 
ADD CONSTRAINT fk_rzut_rdg FOREIGN KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy, id_player) REFERENCES RUNDA_DLA_GRACZA (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy, id_player) ON DELETE CASCADE;