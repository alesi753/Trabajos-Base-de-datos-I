CREATE DATABASE Banco;
USE Banco;

-- Tables
CREATE TABLE Clientes(numero_cliente INT AUTO_INCREMENT PRIMARY KEY, dni INT NOT NULL, apellido VARCHAR(60) NOT NULL, nombre VARCHAR(60) NOT NULL);
CREATE TABLE Cuentas(numero_cuenta INT PRIMARY KEY, numero_cliente INT, saldo DECIMAL(10,2) NOT NULL DEFAULT 0,
	CONSTRAINT FOREIGN KEY (numero_cliente) REFERENCES Clientes(numero_cliente)
);
CREATE TABLE Movimientos(numero_movimiento INT PRIMARY KEY, numero_cuenta INT, fecha DATE NOT NULL,
	tipo ENUM('CREDITO', 'DEBITO') NOT NULL, importe DECIMAL(10,2) NOT NULL,
	CONSTRAINT FOREIGN KEY (numero_cuenta) REFERENCES Cuentas(numero_cuenta)
);
CREATE TABLE Historial_movimientos(id INT AUTO_INCREMENT PRIMARY KEY, numero_cuenta INT NOT NULL, numero_movimiento INT NOT NULL,
	saldo_anterior DECIMAL(10,2) NOT NULL, saldo_actual DECIMAL(10,2) NOT NULL,
    CONSTRAINT FOREIGN KEY (numero_cuenta) REFERENCES Cuentas(numero_cuenta),
    CONSTRAINT FOREIGN KEY (numero_movimiento) REFERENCES Movimientos(numero_movimiento)
);

-- Inserción de datos
INSERT INTO Clientes(numero_cliente, dni, apellido, nombre) VALUES
	(1, 20345678, 'Pérez', 'Carlos'),
	(2, 21456789, 'Gómez', 'Ana'),
	(3, 22567890, 'Torres', 'Luis'),
	(4, 23678901, 'Fernández', 'Carla'),
	(5, 24789012, 'Ramos', 'Sofía'),
	(6, 25890123, 'Alvarez', 'Diego'),
	(7, 26901234, 'Martínez', 'Lucía'),
	(8, 27912345, 'García', 'Mariano');
    
INSERT INTO Cuentas(numero_cuenta, numero_cliente, saldo) VALUES
	(1001, 1, 1500.00),
	(1002, 2, 3200.00),
	(1003, 3, 800.00),
	(1004, 4, 5000.00),
	(1005, 5, 2500.00),
	(1006, 6, 1200.00),
	(1007, 7, 950.00),
	(1008, 8, 4000.00),
	(1009, 1, 700.00),   -- Carlos Pérez tiene dos cuentas
	(1010, 5, 1500.00);  -- Sofía Ramos tiene dos cuentas

INSERT INTO Movimientos(numero_cuenta, fecha, tipo, importe) VALUES
	(1001, '2025-01-05', 'CREDITO', 500.00),
	(1001, '2025-01-10', 'DEBITO', 200.00),
	(1002, '2025-01-12', 'CREDITO', 1000.00),
	(1003, '2025-01-15', 'DEBITO', 100.00),
	(1004, '2025-02-01', 'CREDITO', 1500.00),
	(1004, '2025-02-10', 'DEBITO', 300.00),
	(1005, '2025-02-05', 'CREDITO', 700.00),
	(1006, '2025-02-15', 'DEBITO', 100.00),
	(1007, '2025-03-01', 'CREDITO', 250.00),
	(1008, '2025-03-02', 'DEBITO', 500.00),
	(1009, '2025-03-10', 'CREDITO', 200.00),
	(1010, '2025-03-12', 'DEBITO', 150.00),
	(1002, '2025-03-15', 'DEBITO', 400.00),
	(1005, '2025-03-16', 'CREDITO', 300.00),
	(1008, '2025-10-20', 'CREDITO', 600.00),
	(1002, '2025-10-21', 'credito', 1000),
	(1002, '2025-10-21', 'debito', 900),
	(1001, '2025-10-05', 'CREDITO', 500.00),
	(1001, '2025-10-10', 'DEBITO', 200.00),
	(1002, '2025-10-12', 'CREDITO', 1000.00),
	(1003, '2025-10-15', 'DEBITO', 100.00),
	(1004, '2025-10-01', 'CREDITO', 1500.00),
	(1004, '2025-10-10', 'DEBITO', 300.00),
	(1005, '2025-10-05', 'CREDITO', 700.00),
	(1006, '2025-10-15', 'DEBITO', 100.00),
	(1007, '2025-10-01', 'CREDITO', 250.00),
	(1008, '2025-10-02', 'DEBITO', 500.00),
	(1009, '2025-10-10', 'CREDITO', 200.00),
	(1010, '2025-10-12', 'DEBITO', 150.00),
	(1002, '2025-10-15', 'DEBITO', 400.00),
	(1005, '2025-10-16', 'CREDITO', 300.00),
	(1008, '2025-10-20', 'CREDITO', 600.00),
	(1002, '2025-10-21', 'credito', 3000),
	(1002, '2025-10-21', 'debito', 1000);
    
INSERT INTO Historial_movimientos(id, numero_cuenta, numero_movimiento, saldo_anterior, saldo_actual) VALUES
	(1,1001,1,1500.00,2000.00),mysql -u tu_usuario -p Banco < tp4.sql
	(2,1001,2,2000.00,1800.00),
	(3,1002,3,3200.00,4200.00),
	(4,1003,4,800.00,700.00),
	(5,1004,5,5000.00,6500.00),
	(6,1004,6,6500.00,6200.00),
	(7,1005,7,2500.00,3200.00),
	(8,1006,8,1200.00,1100.00),
	(9,1007,9,950.00,1200.00),
	(10,1008,10,4000.00,3500.00),
	(11,1009,11,700.00,900.00),
	(12,1010,12,1500.00,1350.00),
	(13,1002,13,4200.00,3800.00),
	(14,1005,14,3200.00,3500.00),
	(15,1008,15,3500.00,4100.00),
	(16,1002,16,3800.00,4800.00),
	(17,1002,17,4800.00,3900.00),
	(18,1001,18,1800.00,2300.00),
	(19,1001,19,2300.00,2100.00),
	(20,1002,20,3900.00,4900.00),
	(21,1003,21,700.00,600.00),
	(22,1004,22,6200.00,7700.00),
	(23,1004,23,7700.00,7400.00),
	(24,1005,24,3500.00,4200.00),
	(25,1006,25,1100.00,1000.00),
	(26,1007,26,1200.00,1450.00),
	(27,1008,27,4100.00,3600.00),
	(28,1009,28,900.00,1100.00),
	(29,1010,29,1350.00,1200.00),
	(30,1002,30,4900.00,4500.00),
	(31,1005,31,4200.00,4500.00),
	(32,1008,32,3600.00,4200.00),
	(33,1002,33,4500.00,7500.00),
	(34,1002,34,7500.00,6500.00);

-- PROCEDIMIENTOS
	-- Ejercicio 3
DELIMITER //
	CREATE PROCEDURE VerCuentas()
	BEGIN
		SELECT * FROM cuentas;
	END
// DELIMITER ;

	-- Ejercicio 4
DELIMITER //
	CREATE PROCEDURE CuentasConSaldoMayorQue(IN limite DECIMAL(10,2))
	BEGIN
		SELECT * FROM Cuentas WHERE saldo > limite;
    END
// DELIMITER ;

	-- Ejercicio 5
DELIMITER //
	CREATE PROCEDURE TotalMovimientosDelMes(IN cuenta INT, OUT total DECIMAL(10,2))
	BEGIN
		SELECT 
			SUM(
				CASE 
					WHEN tipo = 'CREDITO' THEN importe
					WHEN tipo = 'DEBITO'  THEN -importe
					ELSE 0
				END
			)
		INTO total
		FROM Movimientos
        WHERE cuenta = numero_cuenta AND MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE());
	END //
// DELIMITER ;

	-- Ejercicio 6
DELIMITER //
	CREATE PROCEDURE Depositar(IN cuenta INT, IN monto DECIMAL(10,2))
	BEGIN
		-- No está permitido depositar monto no positivo
		IF monto > 0 THEN
			INSERT INTO Movimientos(numero_cuenta, fecha, tipo, importe)
			VALUES (cuenta, CURDATE(), 'CREDITO', monto);
			
            -- Comentado ya que el trigger se encarga de actualizar automáticamente el saldo luego de un movimiento
            -- UPDATE Cuentas
			-- SET saldo = saldo + monto
			-- WHERE numero_cuenta = cuenta;
		END IF;
	END
// DELIMITER ;

	-- Ejercicio 7
DELIMITER //
CREATE PROCEDURE Extraer(IN cuenta INT, IN monto DECIMAL(10,2))
	BEGIN
		-- Obtener saldo actual de la cuenta
		DECLARE var_saldo_actual DECIMAL(10,2);
		SELECT saldo INTO var_saldo_actual FROM Cuentas WHERE numero_cuenta = cuenta;
		-- Verificar si tiene fondos suficientes
		IF var_saldo_actual >= monto THEN
			INSERT INTO Movimientos (numero_cuenta, fecha, tipo, importe)
			VALUES (cuenta, CURDATE(), 'DEBITO', monto);
			
            -- Comentado ya que el trigger se encarga de actualizar automáticamente el saldo luego de un movimiento
            -- UPDATE cuentas
			-- SET saldo = saldo - monto
			-- WHERE numero_cuenta = cuenta;
		END IF;
	END
// DELIMITER ;

	-- Ejercicio 8
DELIMITER //
	CREATE TRIGGER ActualizarSaldoDespuesDeMovimiento
	AFTER INSERT ON Movimientos FOR EACH ROW
	BEGIN
		IF NEW.tipo = 'CREDITO' THEN
			UPDATE Cuentas
			SET saldo = saldo + NEW.importe
			WHERE numero_cuenta = NEW.numero_cuenta;
		ELSEIF NEW.tipo = 'DEBITO' THEN
			UPDATE Cuentas
			SET saldo = saldo - NEW.importe
			WHERE numero_cuenta = NEW.numero_cuenta;
		END IF;
	END
// DELIMITER ;
		-- Testing
CALL Depositar(1001, 2000);
SELECT saldo FROM cuentas WHERE id_cuenta = 101;
CALL Extraer(1001, 1000);
SELECT saldo FROM cuentas WHERE id_cuenta = 101;

	-- Ejercicio 9
		-- Eliminamos el trigger anterior
DROP TRIGGER IF EXISTS ActualizarSaldoDespuesDeMovimiento;
DELIMITER //
		-- Creamos el nuevo trigger
	CREATE TRIGGER ActualizarSaldoDespuesDeMovimiento
	AFTER INSERT ON Movimientos FOR EACH ROW
	BEGIN
		-- Declaramos nuestras variables para modificar 
		DECLARE var_saldo_anterior DECIMAL(10,2);
		DECLARE var_saldo_nuevo DECIMAL(10,2);
		SELECT saldo INTO var_saldo_anterior FROM cuentas WHERE numero_cuenta = NEW.numero_cuenta;
		-- Actualizamos el saldo según el tipo de movimiento
		IF NEW.tipo = 'CREDITO' THEN
			SET var_saldo_nuevo = var_saldo_anterior + NEW.importe;
		ELSEIF NEW.tipo = 'DEBITO' THEN
			SET var_saldo_nuevo = var_saldo_anterior - NEW.importe;
		END IF;

		UPDATE cuentas
		SET saldo = var_saldo_nuevo
		WHERE numero_cuenta = NEW.numero_cuenta;

		-- Registrar el cambio en el historial
		INSERT INTO Historial_movimientos(numero_cuenta, numero_movimiento, saldo_anterior, saldo_actual)
		VALUES (NEW.numero_cuenta, NEW.numero_movimiento, var_saldo_anterior, var_saldo_nuevo);
	END
// DELIMITER ;
		-- Testing
CALL Depositar(1001, 2000);
SELECT * FROM Historial_movimientos WHERE numero_cuenta = 101;
CALL Extraer(1001, 2000);
SELECT * FROM Historial_movimientos WHERE numero_cuenta = 101;

	-- Ejercicio 10
DELIMITER //
	CREATE PROCEDURE TotalMovimientosDelMesCursor(IN cuenta INT, OUT total DECIMAL(10,2))
	BEGIN
		DECLARE var_importe DECIMAL(10,2);
		DECLARE var_tipo ENUM('CREDITO','DEBITO');
		DECLARE finalizado BOOLEAN DEFAULT FALSE;
		DECLARE c CURSOR FOR
			SELECT importe, tipo
			FROM Movimientos
			WHERE numero_cuenta = cuenta AND MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE());
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = TRUE;
		SET total = 0;
        OPEN c;
		REPEAT
			FETCH c INTO var_importe, var_tipo;
			IF NOT finalizado THEN
				IF var_tipo = 'CREDITO' THEN
					SET total = total + var_importe;
				ELSEIF var_tipo = 'DEBITO' THEN
					SET total = total - var_importe;
				END IF;
			END IF;
		UNTIL finalizado END REPEAT;
		CLOSE c;
	END
// DELIMITER ;

	-- Ejercicio 11
DELIMITER //
	CREATE PROCEDURE AplicarInteresCursor(IN limite DECIMAL(10,2), IN porcentaje DECIMAL(10,2))
	BEGIN
		DECLARE var_id INT;
		DECLARE var_saldo DECIMAL(10,2);
		DECLARE finalizado BOOLEAN DEFAULT FALSE;

		DECLARE c CURSOR FOR
			SELECT numero_cuenta, saldo FROM Cuentas WHERE saldo > limite;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = TRUE;

		OPEN c;
		REPEAT
			FETCH c INTO var_id, var_saldo;
			IF NOT finalizado THEN
				UPDATE Cuentas
				SET saldo = var_saldo + (var_saldo * (porcentaje/100))
				WHERE numero_cuenta = var_id;
			END IF;
		UNTIL finalizado END REPEAT;
		CLOSE c;
	END
// DELIMITER ;
