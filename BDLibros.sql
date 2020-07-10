-- CREACION DE LA BASE DE DATOS
------------------------------------------------------------------------------------------------------------
use master
go
------------------------------------------------------------------------------------------------------------
if exists(select name from sysdatabases where name in('BDLibros'))
	drop database BDLibros
go
------------------------------------------------------------------------------------------------------------
create database BDLibros
go
------------------------------------------------------------------------------------------------------------
use BDLibros
go
------------------------------------------------------------------------------------------------------------
-- CREACION DE TABLAS DE LA BASE DE DATOS
------------------------------------------------------------------------------------------------------------
create table TCliente(
 CodCliente			varchar(4) not null primary key,
 Apellidos			varchar(30)not null,
 Nombres 			varchar(30)not null,
 Direccion			varchar(50)not null,
 Telefono           varchar(10)not null
)
go

------------------------------------------------------------------------------------------------------------
create table TUsuario(
 CodUsuario		varchar(4) not null primary key,
 NomUsuario			varchar(30) not null,
 Contrasena			varchar(30)not null,
)
go

------------------------------------------------------------------------------------------------------------
create table TLibro(
 CodLibro		    varchar(4) not null primary key,
 Titulo 			varchar(50) not null,
 Autor 			    varchar(50) not null,
 Genero             varchar(50) not null,
 Resumen 		    varchar(100) not null,
 Precio 			decimal(4,2) not null, 
 Stock				int default 1 check (Stock >=0 ),
)
go
------------------------------------------------------------------------------------------------------------
create table TPedido(
 NroPedido			varchar(6) not null primary key,
 Fecha 				datetime not null,
 Anulado 			bit not null default 0,
)
go
------------------------------------------------------------------------------------------------------------
create table TDetalle(
 NroPedido			varchar(6) not null,
 CodLibro 			varchar(4) not null,
 CodCliente 		varchar(4) not null,
 Cantidad  			int not null,
 PrecioUnitario		decimal(4,2) not null,
 primary key 		(NroPedido,CodLibro),
 foreign key 		(CodCliente) references TCliente,
 foreign key 		(NroPedido) references TPedido,
 foreign key 		(CodLibro) references TLibro
)
go

-------------------------------------------------------------------------------------------------------------
---ingreso de datos
insert into TCliente values('C001', 'Paredes Loza', 'Javier', 'Av. Arequipa h-12','084-234546')
insert into TCliente values('C002', 'Caceres delgado', 'Gonzalo', 'Av. la cultura h-1244','084-334246')
insert into TCliente values('C003', 'Perez Garcia', 'Cecilia', 'Jr. Trujillo A-6','084-223425')
insert into TCliente values('C004', 'Leon Prada', 'Marta', 'Urb. Los sauces h-12','084-227854')
insert into TCliente values('C005', 'Rodriguez Perez', 'Jesus', 'Av. la cultura g-1234','084-243524')
insert into TCliente values('C006', 'Quispe Huaranca', 'Ernesto', 'Urb. Marcavalle h-12','084-567845')
insert into TCliente values('C007', 'Quispe Hurtado', 'Raul', 'Av. la cultura B-3425','084-223355')
insert into TCliente values('C008', 'Mamani Sanchez', 'Raul', 'Urb. Magisterio h-12','084-220089')
go

insert into TUsuario values('U001', 'admin', '1234')
go

insert into TLibro values('L001', '100 años de Soledad', 'Gabriel García Márquez', 'drama','la familia...',15.50,7)
insert into TLibro values('L002', 'Crimen y castigo', 'Fedor Dostoievski', 'misterio','un joven...',16.00,9)
insert into TLibro values('L003', 'Las almas muertas', 'Nicolai Gogol', 'terror','una vez...',24.00,7)
insert into TLibro values('L004', 'Cumbres borrascosas', 'Emily Bronte', 'drama','una vez...',35.50,12)
insert into TLibro values('L005', 'La muerte de Artemio Cruz', 'Carlos Fuentes', 'misterio','una vez...',12.50,3)
insert into TLibro values('L006', 'Fahrenheit 451', 'Ray Bradbury', 'aventura','una vez...',12.50,8)
insert into TLibro values('L007', 'El extranjero', 'Albert Camus', 'misterio','una vez...',15.00,8)
insert into TLibro values('L008', 'Drácula', 'George Orwell', 'terror','una vez...',19.50,12)
insert into TLibro values('L009', '1984', 'Gabriel García Márquez', 'aventura','una vez...',30.00,11)
insert into TLibro values('L010', 'Ensayo sobre la ceguera', 'Jose Saramago', 'drama','una vez...',15.50,14)
insert into TLibro values('L011', 'La divina comedia', 'Dante Alighieri', 'clasica','una vez...',15.50,10)
insert into TLibro values('L012', 'Don Quijote de la mancha', 'Miguel de Cervantes', 'clasica','una vez...',24.50,12)
insert into TLibro values('L013', 'El gran Gatsby', 'Scott Fitzgerald', 'drama','una vez...',32.00,10)
insert into TLibro values('L014', 'La metamorfosis', 'Franz Kafka', 'reflexion','una vez...',25.50,7)
insert into TLibro values('L015', 'Fausto', 'Goethe', 'clasica','una vez...',23.00,7)
insert into TLibro values('L016', 'Un mundo feliz', 'Aldous Huxley', 'drama','una vez...',35.50,8)
insert into TLibro values('L017', 'Estudio en escarlata', 'Arthur Conan Doyle', 'misterio','una vez...',24.00,8)
insert into TLibro values('L018', 'Fuenteovejuna', 'Lope de Vega', 'drama','una vez...',34.50,10)
insert into TLibro values('L019', 'Madame Bovary', 'Flaubert', 'drama','una vez...',23.00,11)
insert into TLibro values('L020', 'Grandes esperanzas', 'Charles Dickens', 'misterio','una vez...',21.00,9)
insert into TLibro values('L021', 'Frankenstein', 'Mary Shelley', 'terror','una vez...',35.50,9)
insert into TLibro values('L022', 'Demian', 'Hermann Hesse', 'clasica','una vez...',16.50,12)
insert into TLibro values('L023', 'La Eneida', 'Virgilio', 'epopeya','una vez...',15.00,13)
insert into TLibro values('L024', 'Hamlet', 'William Shakespeare', 'clasica','una vez...',18.00,11)
insert into TLibro values('L025', 'Lolita', 'Vladimir Nabokov', 'drama','una vez...',15.50,12)
insert into TLibro values('L026', 'Guerra y paz', 'Lev Tolstoi', 'clasica','una vez...',15.50,13)
insert into TLibro values('L027', 'Los viajes de Gulliver', 'Jonathan Swift', 'aventura','una vez...',25.00,10)
go


SET DATEFORMAT DMY
insert into TPedido values('P00001', '12/08/2008', 0)
insert into TPedido values('P00002', '13/08/2008', 0)
insert into TPedido values('P00003', '14/08/2008', 0)
insert into TPedido values('P00004', '15/08/2008', 0)
insert into TPedido values('P00005', '16/08/2008', 0)
go

insert into TDetalle values('P00001', 'L001', 'C003', 1,15.50)
insert into TDetalle values('P00002', 'L001', 'C003', 1,15.50)
insert into TDetalle values('P00003', 'L001', 'C003', 1,15.50)
insert into TDetalle values('P00004', 'L001', 'C003', 1,15.50)
insert into TDetalle values('P00005', 'L001', 'C003', 1,15.50)

---------------------------------------------------------------------------------------
----------procedimientos almacenados-----------------------------------------------
------------------LOGIN-------------------------------------------------------------
if OBJECT_ID('spLoginUsuarioE') is not null
	drop proc spLoginUsuarioE
go
create proc spLoginUsuarioE
@NomUsuario varchar (30),@Contrasena varchar(30)
as
begin
	if exists (select NomUsuario from TUsuario where NomUsuario=@NomUsuario)
	begin
		----Desncriptar la contrase
		declare @ContrasenaD varchar (30)
		set @ContrasenaD = (select CAST(DECRYPTBYPASSPHRASE('contra',Contrasena)as varchar (30))
		from TUsuario where NomUsuario=@NomUsuario)
		---Comparar contrases
		if (@Contrasena=@ContrasenaD)
		begin
			select CodError=0,Mensaje='Usuario correctamente logueado'
		end
	end
	else
		select CodError=1, Mensaje='Error: Usuario no existe'
end
go


--exec spLoginUsuarioE 'admin','1234'
--go

----------------------------------------------------------------------------------
---------------------------LIBRO--------------------------------

-- Listar LIBRO
if OBJECT_ID ('spListarLibro') is not null
   drop proc spListarLibro
go
create proc spListarLibro
as
begin
    select CodLibro, Titulo, Autor, Genero, Resumen, Precio, Stock from TLibro
end
go


-- PA para Agregar Usuario
if OBJECT_ID('spAgregarLibro') is not null
   drop proc spAgregarLibro
go
create proc spAgregarLibro
 --@CodLibro varchar(4),
 @Titulo varchar(50),
 @Autor varchar(50),
 @Genero varchar(50),
 @Resumen varchar(100),
 @Precio decimal(4,2), 
 @Stock int

 
as
begin
     declare @CodLibro varchar(4)
	 declare @numero int = (select COUNT(*) from TLibro) + 1

  if not exists(select CodLibro from TLibro where CodLibro=@CodLibro)
  begin
     
	 set @CodLibro = ('L' + RIGHT ('000' + CONVERT (varchar(3),@numero),3))
     insert into TLibro values (@CodLibro,@Titulo,@Autor,@Genero,@Resumen,@Precio,@Stock)
	 select CodError = 0,Mensaje ='libro ingresado'
  end
     else select CodError = 1,Mensaje ='Error: Usuario duplicada en TUsuario'
end 
go

exec spAgregarLibro 'Dias de sombra','anonimo','drama','era see',13.50,8
--go
--select * from TLibro

-- PA para Agctualizar libro
if OBJECT_ID('spActualizarLibro') is not null
   drop proc spActualizarLibro
go
create proc spActualizarLibro
 @CodLibro varchar(4),
 @Titulo varchar(50),
 @Autor varchar(50),
 @Genero varchar(50),
 @Resumen varchar(100),
 @Precio decimal(4,2), 
 @Stock int
as
begin

  --Validacion que la Usuario no se duplique
  if exists(select CodLibro from TLibro where CodLibro=@CodLibro)
  begin
     update TLibro set Titulo=@Titulo,Autor=@Autor,Genero=@Genero,Resumen=@Resumen,Precio=@Precio,Stock=@Stock where CodLibro= @CodLibro
	 select CodError = 0,Mensaje ='libro actualizado'
  end
     else select CodError = 1,Mensaje ='Error: no existe libro'
end 
go


-- PA para Eliminar libro
if OBJECT_ID('spEliminarLibro') is not null
   drop proc spEliminarLibro
go
create proc spEliminarLibro
 @CodLibro varchar(4)
as
begin

  --Validacion que la Usuario no se duplique
  if exists(select CodLibro from TLibro where CodLibro=@CodLibro)
  begin
     delete from TLibro where CodLibro=@CodLibro
	 select CodError = 0,Mensaje ='libro eliminado con exito'
  end
     else select CodError = 1,Mensaje ='Error: el libro no se elimino correctamente'
end 
go

----------------------------------------------------------------------------------------------------
------------   CLIENTES--------------------------------------------------


-- Listar clientes
if OBJECT_ID ('spListarClientes') is not null
   drop proc spListarClientes
go
create proc spListarClientes
as
begin
    select CodCliente, Apellidos, Nombres,Direccion, Telefono from TCliente
end
go


-- PA para Agregar clientes
if OBJECT_ID('spAgregarCliente') is not null
   drop proc spAgregarCliente
go
create proc spAgregarCliente
 --@CodCliente varchar(4),
 @Apellidos varchar(30),
 @Nombres varchar(30),
 @Direccion varchar(50),
 @Telefono varchar(10)
as
begin

     declare @CodCliente varchar(4)
	 declare @numero int = (select COUNT(*) from TCliente) + 1
  --Validacion
  if not exists(select CodCliente from TCliente where CodCliente=@CodCliente)
  begin
     set @CodCliente = ('C' + RIGHT ('000' + CONVERT (varchar(3),@numero),3))
     insert into TCliente values (@CodCliente,@Apellidos,@Nombres,@Direccion,@Telefono)
	 select CodError = 0,Mensaje ='cliente ingresado'
  end
     else select CodError = 1,Mensaje ='Error: cliente duplicada'
end 
go

--exec spAgregarCliente 'Dias Montes','Pedrito','las malvianas j-3','084-234222'
--select * from TCliente

-- PA para Agctualizar libro
if OBJECT_ID('spActualizarCliente') is not null
   drop proc spActualizarCliente
go
create proc spActualizarCliente
 @CodCliente varchar(4),
 @Apellidos varchar(30),
 @Nombres varchar(30),
 @Direccion varchar(50),
 @Telefono varchar(10)
as
begin

  --Validacion
  if exists(select CodCliente from TCliente where CodCliente=@CodCliente)
  begin
     update TCliente set CodCliente=@CodCliente,Apellidos=@Apellidos,Nombres=@Nombres,Direccion=@Direccion,Telefono=@Telefono
	 select CodError = 0,Mensaje ='cliente actualizado'
  end
     else select CodError = 1,Mensaje ='Error: no existe cliente'
end 
go


-- PA para Eliminar cliente
if OBJECT_ID('spEliminarCliente') is not null
   drop proc spEliminarCliente
go
create proc spEliminarCliente
 @CodCliente varchar(4)
as
begin

  --Validacion que la Usuario no se duplique
  if exists(select CodCliente from TCliente where CodCliente=@CodCliente)
  begin
     delete from TCliente where CodCliente=@CodCliente
	 select CodError = 0,Mensaje ='cliente eliminado con exito'
  end
     else select CodError = 1,Mensaje ='Error: el cliente no se elimino correctamente'
end 
go



----------------------------------------------------------------------------------------------------
------------   VENTAS--------------------------------------------------

-- Listar ventas
if OBJECT_ID ('spListarVentas') is not null
   drop proc spListarVentas
go
create proc spListarVentas
as
begin
	--declare @NroPedido varchar(6) 
	--set @NroPedido = (select NroPedido from TDetalle where CodCliente = @CodCliente)
	select D.NroPedido,D.CodCliente,L.CodLibro, C.Nombres,C.Apellidos, L.Titulo,D.Cantidad, L.Precio, ( D.Cantidad * L.Precio ) as 'Total', P.Fecha
	from TDetalle D inner join TCliente C  on D.CodCliente = C.CodCliente inner join TLibro L  on D.CodLibro = L.CodLibro inner join TPedido P  on D.NroPedido = P.NroPedido
	
end
go

--exec spListarVentas

if OBJECT_ID ('spBuscarLibro') is not null
   drop proc spBuscarLibro
go
create proc spBuscarLibro
@variable varchar(50)
as
begin
	select CodLibro, Titulo, Autor, Genero, Resumen, Precio, Stock  from TLibro where Titulo like '%'+@variable+'%' or Autor like '%'+@variable+'%'
end
go
--exec spBuscarLibro 'crimen'

if OBJECT_ID ('spBuscarCliente') is not null
   drop proc spBuscarCliente
go
create proc spBuscarCliente
@variable varchar(50)
as
begin
	select CodCliente, Apellidos, Nombres, Direccion, Telefono  from TCliente where Apellidos like '%'+@variable+'%' or Nombres like '%'+@variable+'%'
end
go

--exec spBuscarCliente 'jes'



if OBJECT_ID ('spidLibro') is not null
   drop proc spidLibro
go
create proc spidLibro
as
begin
     declare @CodLibro varchar(4)
	 declare @numero int = (select COUNT(*) from TLibro)
	 set @CodLibro = ('L' + RIGHT ('000' + CONVERT (varchar(3),@numero),3))
end
go
exec spidLibro
select * from TLibro

-- PA Seguimiento Academico filtrado
if OBJECT_ID('spSacarGenero') is not null
	drop proc spSacarGenero
go
create proc spSacarGenero
as
begin
	
	select Genero 
	from TLibro 
	group by Genero	
	order by Genero ASC 
end
go

--exec spSacarGenero
--select * from TLibro



if OBJECT_ID('spRealizarVenta') is not null
   drop proc spRealizarVenta
go
create proc spRealizarVenta
 @CodCliente varchar(4),
 @CodLibro varchar(4),
 @Cantidad int
as
begin
	--validar cliente existe
	if exists ( select CodCliente from TCliente where CodCliente  = @CodCliente )
	begin
		-- validar si existe stock de libros
		declare @stockAtualLibro int = ( select Stock from TLibro where CodLibro = @CodLibro )
		if @Cantidad > @stockAtualLibro
		begin
			select CodError = 1,Mensaje ='Error: No existe stock suficiente'  		
		end
		else
		begin
			--Registramos pedido		
			--Generamos numeroPedido		
			declare @IdNroPedido varchar(6) 
			declare @tamanoPedido int = (select COUNT(*) from TPedido) + 1
			set @IdNroPedido = ('P' + RIGHT ('00000' + CONVERT (varchar(5),@tamanoPedido),5))
			insert into TPedido values ( @IdNroPedido, getdate(), 0 )

			--Ingresar venta den detalle
			declare @PrecioLibreo decimal = ( select Precio from TLibro where CodLibro = @CodLibro )
			insert into TDetalle values ( @IdNroPedido, @CodLibro, @CodCliente, @Cantidad, @PrecioLibreo )

			--Actualizar Stock del libro
			update TLibro set Stock = Stock - @Cantidad where CodLibro = @CodLibro

			select CodError = 0,Mensaje ='Se registro venta exitosa'  
		end		
	end
	 else
	
	begin
		select CodError = 1,Mensaje ='Error: El Cliente no existe' 
	end
end 
go


--exec spListarVentas
--exec spRealizarVenta 'C002', 'L004', 1
--select * from TLibro