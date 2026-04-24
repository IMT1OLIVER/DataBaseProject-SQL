DELIMITER //


CREATE PROCEDURE sp_add_reservation(
    IN p_klient INT, IN p_data DATE, IN p_start TIME, IN p_stop TIME, 
    IN p_centrum INT, IN p_znizka VARCHAR(50), IN p_tor INT
)
BEGIN
    INSERT INTO REZERWACJA (id_klient, data_rez, czas_start_rez, czas_stop_rez, id_centrum, nazwa_znizki)
    VALUES (p_klient, p_data, p_start, p_stop, p_centrum, p_znizka);
    
    INSERT INTO REZERWACJA_TOR (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru)
    VALUES (p_klient, p_data, p_start, p_centrum, p_tor);
END //


CREATE PROCEDURE sp_register_shot(
    IN p_player INT, IN p_kregli INT, IN p_klient INT, IN p_data DATE, 
    IN p_start_rez TIME, IN p_centrum INT, IN p_tor INT, IN p_start_gry DATETIME, 
    IN p_runda INT, IN p_n_rzutu INT
)
BEGIN
    INSERT INTO RZUT (id_klient, data_rez, czas_start_rez, id_centrum, numer_toru, 
                     czas_start_gry, numer_rundy, id_player, numer_rzutu, ilosc_kregli)
    VALUES (p_klient, p_data, p_start_rez, p_id_centrum, p_tor, p_start_gry, p_runda, p_player, p_n_rzutu, p_kregli);
END //


CREATE PROCEDURE sp_deactivate_staff(IN p_pesel CHAR(11))
BEGIN
    UPDATE PRACOWNIK SET aktywnosc = 0 WHERE numer_pesel = p_pesel;
END //


CREATE PROCEDURE sp_update_price(IN p_day VARCHAR(20), IN p_start TIME, IN p_price DECIMAL(10,2))
BEGIN
    UPDATE LISTA_CEN SET cena_za_godzine = p_price 
    WHERE dzien_tygodnia = p_day AND czas_start = p_start;
END //

DELIMITER ;