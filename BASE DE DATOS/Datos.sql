--Datos

insert into Roles
Values('Gerente'),
('Dependiente');

execute insertar_Empleado 'Jonathan Alexis','Aleman Linares','1998-05-09','96693357','M','Activo','Y8msdnxDm9U=','0101199804248','Gerente'
execute insertar_Empleado 'Hugo Geovany','Murillo Urbina','2000-02-17','96693300','M','Activo','Y8msdnxDm9U=','1807200000429','Dependiente'

execute insertar_cliente 'GENERAL','GENERAL','GENERAL@hotmail.com','GENERAL','00000000','0000000000000'
execute insertar_cliente 'Luis Jose','Martinez Oseguera','ljom17@hotmail.com','Colonia la conquista','96857423','0101199600235'
execute insertar_cliente 'Mario Dario','Soto Funez','marso03@gmail.com','Colonia la esperanza','96857424','1807200000253'
--D


execute editar_venta 1,1,'2021-03-12','01011958001101',''