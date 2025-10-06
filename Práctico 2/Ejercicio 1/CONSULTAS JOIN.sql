USE club_nautico;

-- 1. ¿Qué socios tienen barcos amarrados en un número de amarre mayor que 10?
SELECT Socios.nombre, Barcos.numero_amarre FROM Socios INNER JOIN Barcos ON Socios.id_socio = Barcos.id_socio WHERE Barcos.numero_amarre > 10;

-- 2. ¿Cuáles son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama 'Juan Pérez'?
SELECT s.nombre AS nombre_socio, b.nombre AS nombre_barco, b.cuota FROM Socios s INNER JOIN Barcos b ON s.id_socio = b.id_socio WHERE s.nombre = 'Juan Pérez';

-- 3. ¿Cuántas salidas ha realizado el barco con matrícula 'ABC123'?
SELECT b.matricula, COUNT(*) AS cantidad_salidas FROM Salidas s 
	INNER JOIN Barcos b ON s.matricula = b.matricula 
    WHERE b.matricula = 'ABC123'
	GROUP BY b.matricula;
    
-- 4. Lista los barcos que tienen una cuota mayor a 500 y sus respectivos socios.
SELECT b.nombre AS nombre_barcos, b.cuota, s.nombre AS nombre_socios FROM Barcos b INNER JOIN  Socios s ON b.id_socio = s.id_socio WHERE b.cuota > 500;

-- 5. ¿Qué barcos han salido con destino a 'Mallorca'?
SELECT DISTINCT b.nombre AS nombre_barco FROM Barcos b INNER JOIN  Salidas s ON b.matricula = s.matricula WHERE s.destino = 'Mallorca';

-- 6. ¿Qué patrones (nombre y dirección) han llevado un barco cuyo socio vive en 'Barcelona'?
SELECT s.patron_nombre, s.patron_direccion FROM Salidas s
	INNER JOIN Barcos b ON s.matricula = b.matricula
    INNER JOIN Socios so ON b.id_socio = so.id_socio
    WHERE so.direccion LIKE '%Barcelona%';