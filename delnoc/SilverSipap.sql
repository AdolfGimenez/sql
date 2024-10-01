-----------------hOy
Select * from gxfindta.tcltsb where tsbidop in (4797280)
Update gxfindta.tcltsb set tsbesta = 'AC', tsbcome = '002', tsbdeme = 'ACREDITADO', tsbmotivo = 'ERROR NULL 20221004' where tsbidop = (4810747);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*CAMBIO ESTADO TRX ONLINE
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'AN',
       TSBDEME = 'REDMINE #35367'
WHERE TSBIDOP = 3705684;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------Cambia estado para el reintento de Pagos SIPAP-----------------/*#35934- Insertado SIPAP pero no enviado*/--------/*Marca Pendiente SIPAP-20220906*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; --139 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20221005' where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; 
----con ids especificos
Select * from gxfindta.tcltsb where  tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384)
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Marca Pendiente Debitos*//*Envio de debitos masivos */
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 16:30:00'; --1.390 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220824' where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 08:30:00';
----------------------------------------/*
con id especificos
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220823' where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select * from gxfindta.tcltsb where tsbesta = 'PE'  and tsbfeac >= '2022-08-19 08:30:00';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*/*CUENTAS INTERNAS NO TRANSMITIDAS*/
Select * from gxfindta.tcltsb where tsbbacr = '1020' and tsbesta = 'IN' and  tsbfege <= '2022-09-06 08:00:00'; --3043 REGISTROS
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'INTERNA (IN) NO TRANSMITIDO 20220906' where tsbbacr = '1020' and tsbesta = 'IN' and  tsbfege <= '2022-09-06 08:00:00';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
----------------------------------------/*/*Corrige Nro de Cuenta Dèbito (le falto un cero delante y poner en PE)*/
Update gxfindta.tcltsb set tsbctde = '0104913400', tsbesta = 'PE' where tsbmotivo = 'REDMINE NRO 36786' and tsbcome = '008'; --4.725
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*/*Marca para Envio Pagos SIPAP (Batch)*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B'; --1339 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------Para cambiar fecha de CLEaring
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N' WHERE PFCIDPARM = 'CIERRECLEARING ';

select * from GXFINDTA.TCLPFC WHERE PFCIDPARM = 'CIERRECLEARING ';

UPDATE GXFINDTA.TCLFEC SET FECANT = '20221005',
       FECPRO = '20221006',
       FECSIG = '20221007'
WHERE FECID = '002';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------DIFERENCIA CLEARING MULTIENTIDADES
Select * from gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');
DELETE gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');

/*20221220 - Transacciones afectadas*/

Select * from gxbdbps.tswaut where autrrnbep in 
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488'
,'229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472'
,'229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--Actualiza a Online en tclmov --32 registros

Update gxfindta.tclmov set movpgon = 'O' where movrrnbep in 
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488'
,'229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472'
,'229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
