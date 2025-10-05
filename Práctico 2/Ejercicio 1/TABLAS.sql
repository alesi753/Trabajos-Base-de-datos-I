CREATE DATABASE club_nautico;
USE club_nautico;

CREATE TABLE Socios (
	id_socio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Barcos (
	matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    numero_amarre INT NOT NULL,
    cuota DECIMAL(10, 2) NOT NULL,
    id_socio INT NOT NULL,
    CONSTRAINT fk_barco_socio FOREIGN KEY (id_socio) REFERENCES Socios(id_socio)
);

CREATE TABLE Salidas (
	id_salida INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    fecha_salida DATE NOT NULL,
    hora_salida TIME NOT NULL,
    destino VARCHAR(100) NOT NULL,
    patron_nombre VARCHAR(100) NOT NULL,
    patron_direccion VARCHAR(255) NOT NULL,
    CONSTRAINT fk_salida_barco FOREIGN KEY (matricula) REFERENCES Barcos(matricula)
);

    