USE bowling_1;

DELIMITER //

DROP FUNCTION IF EXISTS ObliczFinalnaCene //

CREATE FUNCTION ObliczFinalnaCene(
    p_data DATE, 
    p_start TIME, 
    p_stop TIME, 
    p_znizka_nazwa VARCHAR(50)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_base_price DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_discount_proc DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_hours DECIMAL(10,2);
    DECLARE v_day_name VARCHAR(20);
    DECLARE v_final_price DECIMAL(10,2);

    SET v_day_name = ELT(WEEKDAY(p_data) + 1, 
        'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota', 'Niedziela');

    SELECT cena_za_godzine INTO v_base_price 
    FROM LISTA_CEN 
    WHERE dzien_tygodnia = v_day_name 
      AND p_start >= czas_start AND p_start < czas_stop
    LIMIT 1;
    
    IF v_base_price IS NULL THEN SET v_base_price = 0.00; END IF;

    SET v_hours = TIMESTAMPDIFF(MINUTE, p_start, p_stop) / 60.0;

    
    IF p_znizka_nazwa IS NOT NULL THEN
        SELECT procent INTO v_discount_proc 
        FROM ZNIZKA 
        WHERE nazwa_znizki = p_znizka_nazwa AND aktywnosc = 1; 
        
    END IF;

    SET v_final_price = (v_base_price * v_hours) * (1 - (COALESCE(v_discount_proc, 0) / 100));

    RETURN ROUND(v_final_price, 2);
END //

DELIMITER ;