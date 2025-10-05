CREATE DATABASE gabinete_abogados;
USE gabinete_abogados;

CREATE TABLE Clientes (
	dni VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Asuntos (
	numero_expediente INT PRIMARY KEY,
    dni_cliente VARCHAR(10) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    estado VARCHAR(10) NOT NULL,
    CONSTRAINT chk_estado CHECK (estado IN ('Abierto', 'Cerrado')),
    CONSTRAINT fk_asunto_cliente FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

CREATE TABLE Procuradores (
	id_procurador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Asuntos_Procuradores (
	numero_expediente INT NOT NULL,
    id_procurador INT NOT NULL,
    PRIMARY KEY (numero_expediente, id_procurador),
    CONSTRAINT fk_asuntosProcuradores_asuntos FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
    CONSTRAINT fk_asuntosProcuradores_procuradores FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
);

