SHOW FULL PROCESSLIST;
/*En la columna "State" tiene que decir = "Locked" si está bloqueado y en la columna "Info" muestra la query que está ejecutando-.*/
SELECT * FROM information_schema.processlist;/*--Esto muestra casi lo mismo...*/
SHOW INDEX FROM k2b_prod.asientocontable; /*--muestra los índices creados sobre la tabla que quieras consultar...*/
--
select now();/*ver la hora de la db*/
SET global general_log = 1; /*activar log*/
SELECT version(); -- ver version mysql
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Sentencia para actualización de fechas de Activo Fijo K2B*/
UPDATE bienactivofijo SET bienactivofijofechaactivacion = bienactivofijofechaadquisicion WHERE bienactivofijofechaadquisicion >= '2021-01-01' AND bienactivofijofechaadquisicion > bienactivofijofechaactivacion;
/*k2b cambio de estado para email*/
SELECT WFPrcId, WFTaskCod, WFTaskName, WFTaskDsc, WFTaskEMail from wftask where WFPrcId =5 AND WFTaskCod=22;
UPDATE wftask SET WFTaskEMail ='Y' WHERE WFPrcId =5 AND WFTaskCod=22;
---------------------------------------------------------------------------------------------------------------
SELECT * FROM BIENACTIVOFIJO WHERE BienActivoFijoId='2761';
select * from producto where ProductoId = 3642;
SELECT * FROM CENTROALMACENAJE WHERE CENTROALMACENAJEID='16';
SELECT * FROM IMPBEPSAOTTIPOCONEXION;
select * from deposito where CentroAlmacenajeId = 16;
SELECT * FROM IMPBEPSAOTMARCADISPOSITIVO;
/*---k2b*/
select WFTaskEMail, WFTaskName, WFPrcId from wftask where WFTaskEMail = 'Y';
select * from wftask where WFTaskName like '%Orden de Compra%';
/*----------------------*/
select * from cliente where ClienteCodigo='14655-6';
select * from persona where PersonaDocumento='1005399-9';
/*----UPDATE para corregir configuración módulo de planificación K2B*/
update ItemAfectacionAfectable set itemafectablemodoafectacion = 'DIRECTO' where itemafectablemodoafectacion = 'INDIRECTO'
and tipoafectacioncodigo = 'PRESUPUESTAL'; UPDATE ItemCostoRestriccion SET itemcostorestitemafectablemodo = 'DIRECTO'
where itemcostorestitemafectablemodo = 'INDIRECTO' and itemcostoresttipoafectacioncod = 'PRESUPUESTAL';
/*--Actualización de datos de proveedores en el ambiente producción de K2B*/
INSERT INTO `k2b_prod`.`imppytimbradoproveedor`
    (`ImpPYTimbradoProvID`,
    `ImpPYTimbradoK2BProveedorID`,
    `ImpPYTimbradoProvCodTimb`,
    `ImpPYTimbradoProvSuc`,  `ImpPYTimbradoProvPuntoExped`,
    `ImpPYTimbradoProvFechaDesde`,
    `ImpPYTimbradoProvFechaHasta`
    )
    VALUES (2,20546,15662555,'001','001','2021-12-31','2022-12-31');
--
INSERT INTO `k2b_prod`.`imppytimbradoproveedortiposdoc`
    (`ImpPYTimbradoProvID`,
    `ImpPYTimbradoK2BProveedorID`,
    `ImpPYTipoDocSETCodigo`,
    `ImpPYTimbradoComprHasta`,
    `ImpPyTimbradoComprDesde`
    )
    VALUES(762,2007,'1','1','1000000');
/*realizamos un cambio con el proveedor Repair-SMD #43969*/
update itemafectacionafectable set ItemAfectablePresupuestoHabili = 1 where ItemAfectablePresupuestoHabili = 0 and TipoAfectacionCodigo = 'PRESUPUESTAL';
/*para validar una solución a un error de POS*/
select * FROM MOVIMIENTOSTOCK m, MOVIMIENTOSTOCKDETALLE d, MOVIMIENTOSTOCKINVENTARIO mi
where mi.MovStockId = d.MovStockId
and mi.MovStockDetId = d.MovStockDetId
and d.MovStockId = m.MovStockId
and MovStockEstadoProcesoIngreso = 'NoCompletado';
/*--Habilitacion de notificaciones por correo: solicitudes de fondos*/
SELECT WFPrcId, WFTaskCod, WFTaskName, WFTaskDsc, WFTaskEMail from wftask where WFPrcId =5 AND WFTaskCod=22;
UPDATE wftask SET WFTaskEMail ='Y' WHERE WFPrcId =5 AND WFTaskCod=22;
--
SELECT WFPrcId, WFTaskCod, WFTaskName, WFTaskDsc, WFTaskEMail from wftask where WFPrcId =47 AND WFTaskCod IN (22,29,184,204);
UPDATE wftask SET WFTaskEMail ='Y' where WFPrcId =47 AND WFTaskCod IN (22,29,184,204);
/*---Sentencia para actualización de fechas de Activo Fijo K2B*/
UPDATE bienactivofijo SET bienactivofijofechaactivacion = bienactivofijofechaadquisicion WHERE bienactivofijofechaadquisicion >= '2021-01-01' AND bienactivofijofechaadquisicion > bienactivofijofechaactivacion;
/*---Con referencia al problema con el deposito Lo que se debe hacer para solucionar esto es modificar por BD el tipo de depósito*/
UPDATE deposito SET tipodepositocodigo = 'TRANSITO' WHERE depositoid = 56 AND depositonombre LIKE 'Transito%';
/*Y  lo que me pidieron recalcar es : El depósito de tipo Transito sirve para mostrar que el material está en viaje desde CA origen a uno de destino. No se debe permitir cambiar el tipo o eliminar depósitos en Tránsito
Todos los CA deben tener un solo depósito de tipo Tránsito.*/
/*-------------------------------------------------------------------------------------------*/
/*Con este cambio la misma dejará de reservar stock cada vez que se realice un movimiento utilizando la misma.*/
/*1.*/	update tipotransaccionstock set tipotrnstktipostkreservacodigo = null  where tipotrnstkcodigo ='TRANSFERENCIA';
/*2.*/	update tipotransaccionstock set TipoTrnStkReserva = 0 where tipotrnstkcodigo ='TRANSFERENCIA';
/*-------------------------------------------------------------------------------------------*/
SET GLOBAL general_log = 1;
SET GLOBAL LOG_OUTPUT = 'TABLE';
set global slow_query_log = 'ON';

SELECT * FROM CLIENTE C;

SELECT * FROM MYSQL.GENERAL_LOG GL;
TRUNCATE MYSQL.GENERAL_LOG;
#----
SELECT * FROM USUARIO U;
SELECT * FROM ASIENTOCONTABLE WHERE ASIENTONUMERO='32481'ASIENTOFECHA='20230619' #AND ASIENTOESTADO='INI'
AND TipoAsientoCodigo='POSCLEARPAGDINEBCONT';

SELECT * FROM ASIENTOCONTABLE A WHERE ASIENTOFECHA>='20230701';
SELECT * FROM NUMERADOR N;

SELECT ASIENTOESTADO, ASIENTOESTADOPROCESO, TIPOASIENTOCODIGO FROM ASIENTOCONTABLE A WHERE ASIENTOFECHA>='20230606'
GROUP BY ASIENTOESTADO, ASIENTOESTADOPROCESO, TIPOASIENTOCODIGO;

SELECT * FROM TIPOASIENTOCONTABLE T;
SELECT * FROM TIPOASIENTOCONTABLEDETALLE T;
SELECT * FROM TIPOASIENTOCONTABLEDETALLEPE T;
/*tipo de documento*/
SELECT * FROM TIPODOCUMENTO T WHERE TIPODOCUMENTOID='32';
SELECT * FROM NUMERADOR N WHERE NUMERADORCODIGO='ASIENTOCODIGO';
SELECT `NumeradorNivelId`, `NumeradorSerieEstado`, `NumeradorCodigo`, `SerieId`, `NumeradorSecuencialVigenciaId`
FROM `NumeradorSecuenciaNexo` WHERE (`NumeradorCodigo` = 'AsientoCodigo                           ')
AND (`NumeradorNivelId` IS NULL) AND (`NumeradorSerieEstado` = 'Activo') ORDER BY `NumeradorCodigo`;
SELECT * FROM `Numerador` WHERE (`NumeradorCodigo` = 'AsientoCodigo                           ')
AND (Not (LENGTH(TRIM(`NumeradorCalificador1`))=0)) ORDER BY `NumeradorCodigo`  LIMIT 1;

