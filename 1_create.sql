DROP DATABASE IF EXISTS bowling_1; 
CREATE DATABASE IF NOT EXISTS bowling_1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE bowling_1;

CREATE TABLE CENTRUM_BOWLINGOWE (
    id_centrum INT UNSIGNED NOT NULL PRIMARY KEY,
    nazwa_centrum VARCHAR(100) NOT NULL,
    adres VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE ZNIZKA (
    nazwa_znizki VARCHAR(50) NOT NULL PRIMARY KEY,
    procent DECIMAL(5, 2) NOT NULL,
    aktywnosc TINYINT NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE METODA_PLATNOSCI (
    id_metody INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa_metody VARCHAR(50) NOT NULL UNIQUE, 
    czy_aktywna TINYINT NOT NULL DEFAULT 1 
) ENGINE=InnoDB;

CREATE TABLE LISTA_CEN (
    dzien_tygodnia ENUM('Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota', 'Niedziela') NOT NULL,
    czas_start TIME NOT NULL,
    czas_stop TIME NOT NULL,
    cena_za_godzine DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (dzien_tygodnia, czas_start),
    CONSTRAINT check_price_time CHECK (czas_stop > czas_start)
) ENGINE=InnoDB;


CREATE TABLE KLIENT (
    id_klient INT UNSIGNED NOT NULL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, 
    numer_tel VARCHAR(20) UNIQUE NOT NULL,
    data_rejestracji DATE NOT NULL DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

CREATE TABLE MOZLIWE_ZNIZKI_KLIENTA (
    id_klient INT UNSIGNED NOT NULL,
    nazwa_znizki VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_klient, nazwa_znizki)
) ENGINE=InnoDB;

CREATE TABLE STANOWISKO_PRACY (
    nazwa_roli VARCHAR(100) NOT NULL ,
    typ_umowy ENUM("Umowa o prace", "Umowa zlecenie", "B2B", "Umowa o dzieło") NOT NULL,
    is_hourly TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (nazwa_roli, typ_umowy),
    CONSTRAINT check_contract_logic CHECK ( NOT (typ_umowy = 'Umowa o pracę' AND is_hourly = 1))
) ENGINE=InnoDB;

CREATE TABLE PRACOWNIK (
    numer_pesel VARCHAR(11) NOT NULL PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    numer_telefonu VARCHAR(20) NOT NULL,
    email_p VARCHAR(100) NOT NULL UNIQUE,
    data_zatrudnienia DATE NOT NULL DEFAULT (CURRENT_DATE),
    aktywnosc TINYINT NOT NULL DEFAULT 1,
    id_centrum INT UNSIGNED NOT NULL
) ENGINE=InnoDB;

CREATE TABLE ZATRUDNIENIE (
    numer_pesel VARCHAR(11) NOT NULL,
    nazwa_roli VARCHAR(100) NOT NULL,
    typ_umowy ENUM("Umowa o prace", "Umowa zlecenie", "B2B", "Umowa o dzieło") NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE DEFAULT NULL,
    pensja DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (numer_pesel, nazwa_roli, data_rozpoczecia,typ_umowy),
    CONSTRAINT check_employment_validity CHECK (
        (data_zakonczenia IS NULL OR data_zakonczenia >= data_rozpoczecia) AND (pensja > 0)
    )
) ENGINE=InnoDB;


CREATE TABLE REZERWACJA (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    nazwa_znizki VARCHAR(50), 
    czas_stop_rez TIME NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'czeka na oplate',
    cena DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum),
    CONSTRAINT check_time_order CHECK (czas_stop_rez > czas_start_rez),
    CONSTRAINT check_cena CHECK (cena >= 0)
) ENGINE=InnoDB;

CREATE TABLE PLATNOSC (
    id_centrum INT UNSIGNED NOT NULL,
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    kod_platnosci VARCHAR(100) NOT NULL PRIMARY KEY, 
    kwota DECIMAL(10, 2) NOT NULL, 
    data_platnosci DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    status VARCHAR(50) NOT NULL DEFAULT 'NEW',
    czy_czesciowa TINYINT NOT NULL DEFAULT 0, 
    id_metody INT UNSIGNED NOT NULL, 
    CONSTRAINT check_kwota CHECK (kwota >= 0)
) ENGINE=InnoDB;


CREATE TABLE TOR (
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czy_aktywny TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_centrum, numer_toru)
) ENGINE=InnoDB;

CREATE TABLE REZERWACJA_TOR (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru)
) ENGINE=InnoDB;

CREATE TABLE GRA (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czas_start_gry DATETIME NOT NULL, 
    czas_stop_gry DATETIME NULL,
    punkty_zespolu INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry)
) ENGINE=InnoDB;

CREATE TABLE GRACZ (
    id_player INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50) NOT NULL,
    data_dolaczenia DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_player_nickname UNIQUE (nickname)
) ENGINE=InnoDB;

CREATE TABLE STATYSTYKA_GRACZA_W_GRZE (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czas_start_gry DATETIME NOT NULL,
    id_player INT UNSIGNED,
    suma_punktow_w_grze INT UNSIGNED NOT NULL DEFAULT 0,
    laczna_ilosc_rzutow INT UNSIGNED NOT NULL DEFAULT 0,
    ilosc_strikes INT UNSIGNED NOT NULL DEFAULT 0,
    ilosc_spares INT UNSIGNED NOT NULL DEFAULT 0,
    ilosc_fouls INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, id_player)
) ENGINE=InnoDB;

CREATE TABLE RUNDA (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czas_start_gry DATETIME NOT NULL,
    numer_rundy TINYINT UNSIGNED NOT NULL,
    suma_punktow INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy),
    CONSTRAINT check_frame_limit CHECK (numer_rundy BETWEEN 1 AND 10)
) ENGINE=InnoDB;

CREATE TABLE RUNDA_DLA_GRACZA (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czas_start_gry DATETIME NOT NULL,
    numer_rundy TINYINT UNSIGNED NOT NULL,
    id_player INT UNSIGNED,
    punkty_w_rundzie INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy, id_player)
) ENGINE=InnoDB;

CREATE TABLE RZUT (
    id_klient INT UNSIGNED NOT NULL,
    data_rez DATE NOT NULL,
    czas_start_rez TIME NOT NULL,
    id_centrum INT UNSIGNED NOT NULL,
    numer_toru INT UNSIGNED NOT NULL,
    czas_start_gry DATETIME NOT NULL,
    numer_rundy TINYINT UNSIGNED NOT NULL,
    id_player INT UNSIGNED,
    numer_rzutu TINYINT UNSIGNED NOT NULL,
    ilosc_kregli TINYINT UNSIGNED NOT NULL DEFAULT 0,
    is_strike BOOLEAN NOT NULL DEFAULT FALSE,
    is_spare BOOLEAN NOT NULL DEFAULT FALSE,
    is_foul BOOLEAN NOT NULL DEFAULT FALSE,
    last_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, numer_rundy, id_player, numer_rzutu),
    CONSTRAINT check_pins_limit CHECK (ilosc_kregli <= 10),
    CONSTRAINT check_throw_limit CHECK (numer_rzutu BETWEEN 1 AND 3),
    CONSTRAINT check_strike_logic CHECK ((is_strike = TRUE AND ilosc_kregli = 10) OR (is_strike = FALSE))
) ENGINE=InnoDB;