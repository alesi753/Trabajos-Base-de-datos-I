USE gabinete_abogados;

-- 1. ¿Cuál es el nombre y la dirección de los procuradores que han trabajado en un asunto abierto?
SELECT DISTINCT p.nombre, p.direccion FROM Procuradores p 
	INNER JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
    INNER JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente
    WHERE a.estado = 'Abierto';

-- 2. ¿Qué clientes han tenido asuntos en los que ha participado el procurador Carlos López?
SELECT DISTINCT c.nombre FROM Clientes c
	INNER JOIN Asuntos a ON c.dni = a.dni_cliente
    INNER JOIN Asuntos_Procuradores ap ON a.numero_expediente = ap.numero_expediente
    INNER JOIN Procuradores p ON ap.id_procurador = p.id_procurador
    WHERE p.nombre = 'Carlos López';

-- 3. ¿Cuántos asuntos ha gestionado cada procurador?
SELECT p.nombre AS nombre_procurador, COUNT(a.numero_expediente) AS cantidad_asuntos_gestionados FROM Procuradores p
	LEFT JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
    LEFT JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente AND a.estado = 'Cerrado'
    GROUP BY p.nombre;

-- 4. Lista los números de expediente y fechas de inicio de los asuntos de los clientes que viven en Buenos Aires.
SELECT a.numero_expediente, a.fecha_inicio FROM Asuntos a
	INNER JOIN Clientes c ON a.dni_cliente = c.dni
    WHERE c.direccion LIKE '%Buenos Aires%';

