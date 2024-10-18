USE [Biblioteca]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[InsertarUsuario](
@NombreUsuario varchar(20),
@Cuenta varchar(20),
@Contrase�a varchar(20)
)
as
begin
insert into Usuarios (NombreUsuario,Cuenta,Contrase�a)
values (@NombreUsuario,@Cuenta,@Contrase�a)
end



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[InsertarLibro](
@Titulo varchar(200),
@Autor varchar(50),
@Categoria varchar(50),
@NumeroPaginas int,
@Editorial varchar(50),
@FechaEdicion date,
@FechaPublicacion date,
@Edicion varchar(200),
@Idioma varchar(50),
@NumeroEjemplares int)
as
begin
insert into Libros 
(Titulo,Autor,Categoria,NumeroPaginas,Editorial,FechaEdicion,FechaPublicacion,Edicion,Idioma,NumeroEjemplares)
values
(@Titulo,@Autor,@Categoria,@NumeroPaginas,@Editorial,@FechaEdicion,@FechaPublicacion,@Edicion,@Idioma,@NumeroEjemplares);
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[NuevoLector](
@CedulaLector bigint,
@NombreLector varchar(100),
@TelefonoLector bigint,
@DireccionLector varchar(200)
)
as
begin
insert into Lectores (CedulaLector,NombreLector,TelefonoLector,DireccionLector)
values (@CedulaLector,@NombreLector,@TelefonoLector,@DireccionLector) 
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GuardarPrestamo](
@IdLibro1 int,
@FechaSalida date,
@FechaDevolucion date,
@IdLector1 int
)
as
begin
insert into Prestamo (IdLibro1,FechaSalida,FechaDevolucion,IdLector1)
values (@IdLibro1,@FechaSalida,@FechaDevolucion,@IdLector1);
update Libros set NumeroEjemplares = NumeroEjemplares - 1 where IdLibro = @IdLibro1
end


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[ModificarLector](
@IdLector integer,
@CedulaLector bigint,
@NombreLector varchar(100),
@TelefonoLector bigint,
@DireccionLector varchar(200)
)
as
begin
update Lectores
set
CedulaLector = @CedulaLector,
NombreLector = @NombreLector,
TelefonoLector = @TelefonoLector,
DireccionLector = @DireccionLector
where IdLector = @IdLector
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[ModificarLibro](
@IdLibro integer,
@Titulo varchar(200),
@Autor varchar(50),
@Categoria varchar(50),
@NumeroPaginas int,
@Editorial varchar(50),
@FechaEdicion date,
@FechaPublicacion date,
@Edicion varchar(200),
@Idioma varchar(50),
@NumeroEjemplares int)
as
begin
update Libros
set 
Titulo = @Titulo,
Autor = @Autor,
Categoria = @Categoria,
NumeroPaginas = @NumeroPaginas,
Editorial = @Editorial,
FechaEdicion = @FechaEdicion,
FechaPublicacion = @FechaPublicacion,
Edicion = @Edicion,
Idioma = @Idioma,
NumeroEjemplares = @NumeroEjemplares
where IdLibro = @IdLibro
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[ActualizarUsuario](
@IdUsuario int,
@NombreUsuario varchar(20),
@Cuenta varchar(20),
@Contrase�a varchar(20)
)
as
begin
update Usuarios
set
NombreUsuario = @NombreUsuario,
Cuenta = @Cuenta,
Contrase�a = @Contrase�a
where IdUsuario = @IdUsuario
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[BuscarLibro]
@Titulo varchar (200)
as
begin
select *from Libros
where Titulo = @Titulo
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[BuscarPrestamo](
@IdPrestamo int
)
as
begin
select * from Prestamo where IdPrestamo = @IdPrestamo
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[BuscarUsuario](
@NombreUsuario varchar(20)
)
as
begin
select *from Usuarios where NombreUsuario = @NombreUsuario
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[DevolverLibro](
@IdPrestamo1 int,
@IdLibro2 int,
@FechaDevolucion date,
@ObservacionDevolucion varchar(200)
)
as
begin
insert into Devolucion(IdPrestamo1,FechaDevolucion,ObservacionDevolucion,IdLibro2)
values (@IdPrestamo1,@FechaDevolucion,@ObservacionDevolucion,@IdLibro2);
delete from Prestamo where IdPrestamo = @IdPrestamo1;
update Libros set NumeroEjemplares = NumeroEjemplares + 1 where IdLibro = @IdLibro2;
end


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EliminarLector]
@IdLector int
as
begin
delete from Lectores
where IdLector = @IdLector
end


E [Biblioteca]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EliminarLibro]
@IdLibro int
as begin
delete from Libros
where IdLibro = @IdLibro
end 


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EliminarPrestamo](
@IdPrestamo1 int
)
as
delete from Prestamo where IdPrestamo = @IdPrestamo1



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EliminarUsuario](
@IdUsuario int
)
as
begin
delete from Usuarios where IdUsuario = @IdUsuario
end