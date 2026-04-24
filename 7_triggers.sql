USE bowling_1;

DELIMITER //

DROP TRIGGER IF EXISTS auto_set_reservation_price //

CREATE TRIGGER auto_set_reservation_price
BEFORE INSERT ON REZERWACJA
FOR EACH ROW
BEGIN
    DECLARE is_active TINYINT DEFAULT 1;

   
    IF NEW.nazwa_znizki IS NOT NULL THEN
        SELECT aktywnosc INTO is_active FROM ZNIZKA WHERE nazwa_znizki = NEW.nazwa_znizki;
        
        
        IF is_active = 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'BŁĄD: Ta zniżka (student) jest obecnie wyłączona!';
        END IF;
    END IF;

    
    SET NEW.cena = ObliczFinalnaCene(NEW.data_rez, NEW.czas_start_rez, NEW.czas_stop_rez, NEW.nazwa_znizki);
END //



CREATE TRIGGER validate_and_mark_payment
BEFORE INSERT ON PLATNOSC
FOR EACH ROW
BEGIN
    DECLARE total_price DECIMAL(10,2);
    DECLARE current_paid DECIMAL(10,2) DEFAULT 0.00;

    SELECT cena INTO total_price FROM REZERWACJA
    WHERE id_centrum = NEW.id_centrum AND id_klient = NEW.id_klient AND data_rez = NEW.data_rez AND czas_start_rez = NEW.czas_start_rez;

    SELECT COALESCE(SUM(kwota), 0) INTO current_paid FROM PLATNOSC
    WHERE id_centrum = NEW.id_centrum AND id_klient = NEW.id_klient AND data_rez = NEW.data_rez AND czas_start_rez = NEW.czas_start_rez;

    IF (current_paid + NEW.kwota) > total_price THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = BŁĄD: Kwota płatności przekracza cenę rezerwacji!;
    END IF;

    IF (current_paid + NEW.kwota) < total_price THEN
        SET NEW.czy_czesciowa = 1;
    ELSE
        SET NEW.czy_czesciowa = 0;
    END IF;
END //

DROP TRIGGER IF EXISTS check_lane_overlap //

CREATE TRIGGER check_lane_overlap
BEFORE INSERT ON REZERWACJA_TOR
FOR EACH ROW
BEGIN
    DECLARE new_stop TIME;
    DECLARE overlap_count INT DEFAULT 0;
    DECLARE is_lane_active TINYINT;

    
    SELECT czy_aktywny INTO is_lane_active 
    FROM TOR 
    WHERE id_centrum = NEW.id_centrum AND numer_toru = NEW.numer_toru;

    IF is_lane_active = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'BŁĄD: Ten tor jest obecnie nieaktywny (awaria/serwis)!';
    END IF;

    
    SELECT czas_stop_rez INTO new_stop FROM REZERWACJA
    WHERE id_centrum = NEW.id_centrum AND id_klient = NEW.id_klient 
      AND data_rez = NEW.data_rez AND czas_start_rez = NEW.czas_start_rez;

    SELECT COUNT(*) INTO overlap_count
    FROM REZERWACJA_TOR rt
    JOIN REZERWACJA r ON rt.id_klient = r.id_klient AND rt.data_rez = r.data_rez 
                      AND rt.czas_start_rez = r.czas_start_rez AND rt.id_centrum = r.id_centrum
    WHERE rt.id_centrum = NEW.id_centrum AND rt.numer_toru = NEW.numer_toru AND rt.data_rez = NEW.data_rez
      AND (NEW.czas_start_rez < r.czas_stop_rez AND new_stop > r.czas_start_rez);

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BŁĄD: Ten tor w tym czasie jest już zajęty!';
    END IF;
END //

CREATE TRIGGER fill_throw_details
BEFORE INSERT ON RZUT
FOR EACH ROW
BEGIN
    DECLARE first_throw_pins INT DEFAULT 0;
    IF NEW.numer_rzutu = 1 AND NEW.ilosc_kregli = 10 THEN
        SET NEW.is_strike = TRUE;
    END IF;
    IF NEW.numer_rzutu = 2 THEN
        SELECT ilosc_kregli INTO first_throw_pins FROM RZUT 
        WHERE id_centrum = NEW.id_centrum AND data_rez = NEW.data_rez AND czas_start_rez = NEW.czas_start_rez AND numer_toru = NEW.numer_toru AND numer_rundy = NEW.numer_rundy AND id_player = NEW.id_player AND numer_rzutu = 1;
        IF (first_throw_pins + NEW.ilosc_kregli) = 10 THEN
            SET NEW.is_spare = TRUE;
        END IF;
    END IF;
END //

CREATE TRIGGER init_player_game_stats
AFTER INSERT ON RUNDA_DLA_GRACZA
FOR EACH ROW
BEGIN
    IF NEW.numer_rundy = 1 THEN
        INSERT IGNORE INTO STATYSTYKA_GRACZA_W_GRZE (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, czas_start_gry, id_player)
        VALUES (NEW.id_klient, NEW.data_rez, NEW.czas_start_rez, NEW.id_centrum, NEW.numer_toru, NEW.czas_start_gry, NEW.id_player);
    END IF;
END //

DELIMITER //

CREATE TRIGGER process_detailed_throw
AFTER INSERT ON RZUT
FOR EACH ROW
BEGIN
    
    UPDATE STATYSTYKA_GRACZA_W_GRZE SET 
        suma_punktow_w_grze = suma_punktow_w_grze + NEW.ilosc_kregli,
        laczna_ilosc_rzutow = laczna_ilosc_rzutow + 1,
        ilosc_strikes = ilosc_strikes + IF(NEW.is_strike, 1, 0),
        ilosc_spares = ilosc_spares + IF(NEW.is_spare, 1, 0),
        ilosc_fouls = ilosc_fouls + IF(NEW.is_foul, 1, 0)
    WHERE id_klient = NEW.id_klient        
      AND id_centrum = NEW.id_centrum 
      AND data_rez = NEW.data_rez 
      AND czas_start_rez = NEW.czas_start_rez 
      AND numer_toru = NEW.numer_toru 
      AND czas_start_gry = NEW.czas_start_gry 
      AND id_player = NEW.id_player;

    
    UPDATE RUNDA_DLA_GRACZA 
    SET punkty_w_rundzie = punkty_w_rundzie + NEW.ilosc_kregli
    WHERE id_klient = NEW.id_klient        
      AND id_centrum = NEW.id_centrum 
      AND data_rez = NEW.data_rez 
      AND czas_start_rez = NEW.czas_start_rez 
      AND numer_toru = NEW.numer_toru 
      AND czas_start_gry = NEW.czas_start_gry 
      AND numer_rundy = NEW.numer_rundy 
      AND id_player = NEW.id_player;

        UPDATE GRA 
    SET punkty_zespolu = punkty_zespolu + NEW.ilosc_kregli
    WHERE id_klient = NEW.id_klient       
      AND id_centrum = NEW.id_centrum 
      AND data_rez = NEW.data_rez 
      AND czas_start_rez = NEW.czas_start_rez 
      AND numer_toru = NEW.numer_toru 
      AND czas_start_gry = NEW.czas_start_gry;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER update_reservation_status
AFTER INSERT ON PLATNOSC
FOR EACH ROW
BEGIN
    DECLARE total_paid DECIMAL(10,2);
    DECLARE total_price DECIMAL(10,2);

    
    SELECT cena INTO total_price 
    FROM REZERWACJA
    WHERE id_centrum = NEW.id_centrum 
      AND id_klient = NEW.id_klient 
      AND data_rez = NEW.data_rez 
      AND czas_start_rez = NEW.czas_start_rez;


    SELECT COALESCE(SUM(kwota), 0) INTO total_paid 
    FROM PLATNOSC
    WHERE id_centrum = NEW.id_centrum 
      AND id_klient = NEW.id_klient 
      AND data_rez = NEW.data_rez 
      AND czas_start_rez = NEW.czas_start_rez;

 
    IF total_paid >= total_price THEN
        UPDATE REZERWACJA 
        SET status = 'opłacona' 
        WHERE id_centrum = NEW.id_centrum 
          AND id_klient = NEW.id_klient 
          AND data_rez = NEW.data_rez 
          AND czas_start_rez = NEW.czas_start_rez;
    END IF;
END //

DELIMITER ;