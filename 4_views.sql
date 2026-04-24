CREATE OR REPLACE VIEW v_reservation_details AS
SELECT 
    r.id_klient,
    CONCAT(k.imie, ' ', k.nazwisko) AS klient,
    c.nazwa_centrum,
    r.data_rez,
    r.czas_start_rez,
    r.czas_stop_rez,
    r.status,
    r.nazwa_znizki,
    r.cena AS final_price,
    GROUP_CONCAT(rt.numer_toru) AS toru_numery
FROM REZERWACJA r
JOIN KLIENT k ON r.id_klient = k.id_klient
JOIN CENTRUM_BOWLINGOWE c ON r.id_centrum = c.id_centrum
LEFT JOIN REZERWACJA_TOR rt ON r.id_klient = rt.id_klient 
    AND r.data_rez = rt.data_rez 
    AND r.czas_start_rez = rt.czas_start_rez
GROUP BY r.id_klient, r.data_rez, r.czas_start_rez;


CREATE OR REPLACE VIEW v_unpaid_orders AS
SELECT 
    v.klient, 
    v.data_rez, 
    v.czas_start_rez, -- Добавил для точности связи
    v.final_price, 
    COALESCE(SUM(p.kwota), 0) AS wpłacono,
    (v.final_price - COALESCE(SUM(p.kwota), 0)) AS do_zapłaty
FROM v_reservation_details v
LEFT JOIN PLATNOSC p ON 
    v.id_klient = p.id_klient AND 
    v.data_rez = p.data_rez AND 
    v.czas_start_rez = p.czas_start_rez
WHERE v.status != 'opłacona'
GROUP BY v.id_klient, v.data_rez, v.czas_start_rez, v.klient, v.final_price
HAVING do_zapłaty > 0;


CREATE OR REPLACE VIEW v_live_scoreboard AS
SELECT 
    g.id_centrum,
    g.numer_toru,
    gr.nickname,
    s.suma_punktow_w_grze AS очки,
    s.laczna_ilosc_rzutow AS броски,
    g.czas_start_gry
FROM GRA g
JOIN STATYSTYKA_GRACZA_W_GRZE s ON g.id_klient = s.id_klient 
    AND g.data_rez = s.data_rez 
    AND g.id_centrum = s.id_centrum 
    AND g.numer_toru = s.numer_toru 
    AND g.czas_start_gry = s.czas_start_gry
JOIN GRACZ gr ON s.id_player = gr.id_player
WHERE g.czas_stop_gry IS NULL;


CREATE OR REPLACE VIEW v_global_ranking AS
SELECT 
    gr.nickname,
    COUNT(DISTINCT s.czas_start_gry) AS всего_игр,
    SUM(s.suma_punktow_w_grze) AS суммарные_очки,
    AVG(s.suma_punktow_w_grze) AS средний_балл,
    (SELECT COUNT(*) FROM RZUT rz WHERE rz.id_player = gr.id_player AND rz.ilosc_kregli = 10) AS всего_страйков
FROM GRACZ gr
JOIN STATYSTYKA_GRACZA_W_GRZE s ON gr.id_player = s.id_player
GROUP BY gr.id_player
ORDER BY средний_балл DESC;


CREATE OR REPLACE VIEW v_active_staff AS
SELECT 
    p.imie, 
    p.nazwisko, 
    p.numer_telefonu, 
    z.nazwa_roli, 
    c.nazwa_centrum,
    z.pensja
FROM PRACOWNIK p
JOIN ZATRUDNIENIE z ON p.numer_pesel = z.numer_pesel
JOIN CENTRUM_BOWLINGOWE c ON p.id_centrum = c.id_centrum
WHERE p.aktywnosc = 1;


CREATE OR REPLACE VIEW v_discount_analytics AS
SELECT 
    nazwa_znizki,
    COUNT(*) AS раз_использовано,
    SUM(ObliczFinalnaCene(data_rez, czas_start_rez, czas_stop_rez, NULL) - cena) AS suma_zniżek
FROM REZERWACJA
WHERE nazwa_znizki IS NOT NULL
GROUP BY nazwa_znizki;


CREATE OR REPLACE VIEW v_lane_usage_history AS
SELECT 
    id_centrum,
    numer_toru,
    COUNT(*) AS 
    SUM(TIMESTAMPDIFF(MINUTE, czas_start_gry, czas_stop_gry)) AS  czas_uzycia
FROM GRA
WHERE czas_stop_gry IS NULL = FALSE
GROUP BY id_centrum, numer_toru;


CREATE OR REPLACE VIEW v_full_shot_log AS
SELECT 
    rz.data_rez,
    c.nazwa_centrum,
    rz.numer_toru,
    gr.nickname,
    rz.numer_rundy,
    rz.numer_rzutu,
    rz.ilosc_kregli,
    CASE WHEN rz.ilosc_kregli = 10 THEN 'STRIKE' ELSE '' END AS result
FROM RZUT rz
JOIN GRACZ gr ON rz.id_player = gr.id_player
JOIN CENTRUM_BOWLINGOWE c ON rz.id_centrum = c.id_centrum;