
--Crear Base de Datos

create database Ejercicio1_Envio;

use Ejercicio1_Envio;
go
 
--Creación de Tablas

create table DIM_Destino(
    Id_Destino			int primary key identity,
    Pais				varchar(150) not null,
    TarifaExportacion	decimal(6,2) not null
);

create table DIM_Tiempo(
    Id_Tiempo			int primary key identity,
    Mes					int not null,    
	Año					int not null
);

create table DIM_CentroDeCostos(
    Id_CentroCosto		int primary key identity,
    CentroCosto			varchar(140) not null,
    Responsable			varchar(120) not null,
    GrupoCentroCosto	varchar(150) not null
);

create table DIM_ModoTransporte(
    Id_ModoTransporte	int primary key identity,
    ModoTransporte		varchar(100) not null
);

create table DIM_Lote(
    Id_Lote				int primary key identity,
    Lote				varchar(100) not null,
    TarifaExportacion	decimal(6,2) not null,
    Peso				decimal(6,2) not null,
    Grupo_Lote			varchar(100) not null
);

create table FACT_ENVIO(
    Id_FactEnvio		int primary key identity,
    Id_Destino			int,
    Id_CentroCosto		int,
    Id_Modotransporte	int,
    Id_Tiempo			int,
    Id_Lote				int,
    Costo				decimal(6,2),
      FOREIGN KEY (Id_Destino) REFERENCES DIM_Destino(Id_Destino),
      FOREIGN KEY (Id_Tiempo) REFERENCES DIM_Tiempo(Id_Tiempo),
      FOREIGN KEY (Id_CentroCosto) REFERENCES DIM_CentroDeCostos(Id_CentroCosto),
      FOREIGN KEY (Id_Modotransporte) REFERENCES DIM_ModoTransporte(Id_ModoTransporte),
      FOREIGN KEY (Id_Lote) REFERENCES DIM_Lote(Id_Lote)
);