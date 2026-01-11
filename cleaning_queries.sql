INSERT INTO ubicacions (codi_ubicacio, passadis, alcada, tipus, estat)
SELECT 
    'U-' || i,           -- Codi com 'U-1', 'U-2'...
    (i / 10) + 1,        -- Passadís
    (i % 5) + 1,         -- Alçada
    CASE WHEN i % 2 = 0 THEN 'GRAN' ELSE 'PETIT' END,
    'BU'                 -- Totes comencen com a 'BU' (Buides)
FROM generate_series(1, 50) AS i;

INSERT INTO moviments (producte_id, ubicacio_id, quantitat, tipus_moviment, data_moviment)
SELECT 
    producte_id, 
    ubicacio_id, 
    quantitat, 
    tipus_moviment, 
    data_moviment::timestamp
FROM stg_moviments
WHERE quantitat > 0 
  AND producte_id IN (SELECT id FROM productes)   -- Filtra productes vàlids 🏷️
  AND ubicacio_id IN (SELECT id FROM ubicacions); -- Filtra ubicacions vàlides 📍


SELECT COUNT (*) FROM moviments;