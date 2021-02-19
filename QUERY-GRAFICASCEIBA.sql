create database BaseGraficasCeiba;
use BaseGraficasCeiba;

--////////////////////////////////////////////////// TABLAS //////////////////////////////////////////////////////

create table Rol(
rol varchar(30) primary key not null
);

insert into Rol
Values('Farmaceutico'),
('Auxiliar');

create table Sexo (
	codigoSexo char(1) primary key not null,
	descripcion char(9)
);
insert into Sexo values('F','Fememino'),('M','Masculino');

CREATE TABLE Empleados(
	idEmpleado INT IDENTITY(1,1) primary key NOT NULL,
	Nombres VARCHAR(30) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	Tel VARCHAR(9) UNIQUE NOT NULL,
	Sexo char(1) NOT NULL, 
	Estado VARCHAR(20) NOT NULL,
	contrasenia NVARCHAR(30) NOT NULL,
	DNIEmpleado NVARCHAR(13) UNIQUE NOT NULL,
	rol VARCHAR(30) NOT NULL,

	CONSTRAINT FK_ROL FOREIGN KEY (rol) REFERENCES Rol(rol),	
);

create table categoria(
    idcategoria int identity(1,1) Primary key,
	nombre_categoria varchar(50) not null
);

create table producto(
idproducto int identity(1,1) Primary key,
idcategoria int not null,
nombre varchar (50) not null,
descripcion varchar (50) not null,
stock decimal (18,2),
precio_compra decimal (18,2) not null,
precio_venta decimal (18,2) not null,
fecha_vencimiento date not null,
imagen image 

constraint FK_IDcategoria foreign key (idcategoria) references categoria(idcategoria)
);

-- //////////////////////////////////////PROCEDIMIENTOS ALMACENADOS ////////////////////////////////////


--************************************************************** CATEGORIA****************************************************************
-- Mostrar Cargar categoria
create procedure mostrar_categoria
as
select idcategoria as 'Codigo Categoria',nombre_categoria as 'Nombre Categoria' from categoria order by idcategoria desc
go

-- insertar categoria
create procedure insertar_categoria
	@nombre_categoria varchar(50)
	as begin
		if exists (select nombre_categoria from categoria where nombre_categoria=@nombre_categoria )
		raiserror ('Ya existe esa categoria, porfavor ingrese uno nuevo',16,1)
		else
		insert into categoria values(@nombre_categoria) 
end

-- modificar categoria
create procedure editar_categoria
    @idcategoria int,
	@nombre_categoria varchar(50)
	as
    UPDATE categoria set nombre_categoria = @nombre_categoria
     where idcategoria = @idcategoria
go

-- Buscar categoria
create procedure buscarCategoria
@nombre_categoria varchar(50)
as
select idcategoria as 'Codigo Categoria',nombre_categoria as 'Nombre Categoria' from categoria
where nombre_categoria like '%' +@nombre_categoria+ '%'

--****************************************************************************PRODUCTO*************************
--mostrar productos
create procedure mostrar_producto
as
select pro.idproducto as 'Codigo producto', pro.idcategoria as 'Codigo categoria', cat.nombre_categoria as 'Categoria', pro.nombre as 'Producto',pro.descripcion as 'Descripcion',pro.stock as 'Stock',pro.precio_compra as 'Precio de compra',pro.precio_venta as 'Precio de venta',pro.fecha_vencimiento as 'Fecha de vencimiento',pro.imagen as 'Imagen'
from producto as pro inner join categoria as cat on pro.idcategoria = cat.idcategoria
order by pro.idproducto desc
go

-- Insertar producto
create procedure insertar_producto
@idcategoria int,
@nombre varchar (50),
@descripcion varchar (50),
@stock decimal (18,2),
@precio_compra decimal (18,2),
@precio_venta decimal (18,2),
@fecha_vencimiento date,
@imagen image
as
		insert into producto values(@idcategoria,@nombre,@descripcion,@stock,@precio_compra,@precio_venta,@fecha_vencimiento,@imagen) 
go

-- editar producto
create procedure editar_producto
@idproducto int,
@idcategoria int,
@nombre varchar (50),
@descripcion varchar (50),
@stock decimal (18,2),
@precio_compra decimal (18,2),
@precio_venta decimal (18,2),
@fecha_vencimiento date,
@imagen image
as
update producto	set idcategoria=@idcategoria, nombre=@nombre, descripcion=@descripcion, stock=@stock, precio_compra=@precio_compra,	precio_venta=@precio_venta, fecha_vencimiento=@fecha_vencimiento, imagen=@imagen
where idproducto=@idproducto
go

-- Buscar producto
create procedure buscarProducto
@nombre varchar (50)
as
select pro.idproducto as 'Codigo producto', pro.idcategoria as 'Codigo categoria', cat.nombre_categoria as 'Categoria', pro.nombre as 'Producto',pro.descripcion as 'Descripcion',pro.stock as 'Stock',pro.precio_compra as 'Precio de compra',pro.precio_venta as 'Precio de venta',pro.fecha_vencimiento as 'Fecha de vencimiento',pro.imagen as 'Imagen'
from producto as pro inner join categoria as cat on pro.idcategoria = cat.idcategoria
where pro.nombre like '%' +@nombre+ '%'
