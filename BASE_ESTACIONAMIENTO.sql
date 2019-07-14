USE tempdb
GO

CREATE DATABASE Estacionamiento
GO

USE Estacionamiento
GO

CREATE TABLE Vehiculo
(
	Num_Placa NVARCHAR(7) NOT NULL
	CONSTRAINT PK_Vehiculo_Num_Placa PRIMARY KEY CLUSTERED,
	Hora_Ingreso DATETIME DEFAULT GETDATE() NOT NULL,
	Hora_Salida DATETIME,
	Tipo_Vehiculo INT NOT NULL
)
GO

CREATE TABLE Tipo_Vehiculo
(
	Id INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Tipo_Vehiculo_Id PRIMARY KEY CLUSTERED,
	Tipo NVARCHAR (10) NOT NULL
)
GO

CREATE TABLE Cobro
(
	Id INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Cobro_Id PRIMARY KEY CLUSTERED,
	Monto MONEY NOT NULL
)
GO

ALTER TABLE Vehiculo
	ADD CONSTRAINT FK_Vehiculo_Tipo_Vehiculo$Tipo_Vehiculo_Id
	FOREIGN KEY (Tipo_Vehiculo) REFERENCES Tipo_Vehiculo(Id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

INSERT INTO Tipo_Vehiculo(Tipo)
VALUES ('Liviana'),
		('Pesada'),
		('Particular')
GO

SELECT * FROM Tipo_Vehiculo
GO

INSERT INTO Vehiculo(Num_Placa,Tipo_Vehiculo)
VALUES ('HND1234',1)
GO

SELECT * FROM Vehiculo
GO


--UPDATE Vehiculo 
--SET Hora_Salida = GETDATE() WHERE Num_Placa = '123456' 
--GO


--SELECT Hora_Ingreso , DATEDIFF(mi,Hora_Ingreso,Hora_Salida) AS Fecha
--FROM Vehiculo WHERE Num_Placa = 'Em456' 
--GO

/*
USE tempdb
GO
DROP DATABASE Estacionamiento
GO
*/