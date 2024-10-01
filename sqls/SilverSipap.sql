/*fechas comerciales, proceso y trnasaccionales bepsa*/
SELECT * FROM  LIBDEBITO.EMPRESA0P;
SELECT * from gxfindta.tclfec; --reingeniería fecha tiene que ser fecant, fecpro, fecsig consecitivos.
--DRCONBEP
select * from LIBDEBITO.DRCONBEP WHERE substr(lerrnb, 1, 4) = '3018' and lfcotr <> 20230118
and lfectr <> 20230117 and lerrnb not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118');--31055
/*UPDATE LIBDEBITO.DRCONBEP SET LFCOTR = 20230118, LFECTR = 20230118 where substr(lerrnb, 1, 4) = '3018' and lfcotr <> 20230118
and lfectr <> 20230117 and lerrnb not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118')*/
--TSWAUT
select * from gxbdbps.tswaut where substr(AUTRRNBEP, 1, 4) ='3018' and AUTTRXFCHC<> 20230118 and AUTTRXFCHF<> 20230117
and AUTRRNBEP not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118');--30320
/*UPDATE GXBDBPS.TSWAUT SET AUTTRXFCHC='20230118', AUTTRXFCHF='20230118' WHERE substr(AUTRRNBEP, 1, 4) ='3018' and AUTTRXFCHC
<> 20230118 and AUTTRXFCHF<> 20230117 and AUTRRNBEP not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118')*/
--FLICOM1
select * from gxopera.flicom1 where LIFECHD='20230118' and licodtr<>010001 and LIFECREDI=20230118;--16 se debe corregir la columna LIFECREDI a fecha 20230119
/*UPDATE GXOPERA.FLICOM1 SET LIFECREDI='20230119' WHERE LIFECHD='20230118' and licodtr<>010001 and LIFECREDI=20230118*/
-------------------------------------------------------------------------------------------------------------------------------------
--OPLIQUI
select *  from gxopera.opliqui where substr(opcampoa, 41, 8)='20230118' and substr(opcampoa, 17,8)='20230118';--26
-----------------hOy
Select * from gxfindta.tcltsb where tsbidop in (5262279);
Update gxfindta.tcltsb set tsbesta = 'AC', tsbcome = '002', tsbdeme = 'ACREDITADO', tsbmotivo = 'ERROR NULL 20221004' where tsbidop in (5262279);
-----------------------------------------------------------------------------------------------------------------------------
/*Tareas #41347: SOLICITUD DE CAMBIO DE ESTADO DE INSERTADO A PENDIENTE
Actualiza Estado para reintento de Pendientes*/
Select * from gxfindta.tcltsb where date(tsbfege) >= '2022-11-01' and tsbcome = '091' and tsbidop < 5278339; --138 REGISTROS
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'REINTENTO POR CIERRE' where date(tsbfege) >= '2022-11-01' and tsbcome = '091' and tsbidop < 5278339;

/*Cambia Configuración para Reintento desde la pantalla de transmisiones, corregir el parametro para cuando reintenten de nuevo desde la pantalla por defecto quede con estado PE*/
sELECT * FROM GXFINDTA.TCLPFD WHERE PfdIdGrup = 'ESTADOS' and PFCIDPARM = 'PCLR221';
Update GXFINDTA.TCLPFD set PFDVALCHR1 = 'PE', PFDVALCHR2= '900', PFDDSCIMP1 = 'PENDIENTE DE TRANSMISION' WHERE PfdIdGrup = 'ESTADOS' and PFCIDPARM = 'PCLR221';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Habilita reintento Credito a Comercios
Select * from gxfindta.tcltsb where tsbfeac >= date('2022-11-08') and tsbtpop = '01' and tsbesta = 'IN';
Update gxfindta.tcltsb set tsbesta ='PE', tsbmotivo = 'HABILITA REINTENTO #40342' where tsbfeac >= date('2022-11-08') and tsbtpop = '01' and tsbesta = 'IN';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------Cambia estado para el reintento de Pagos SIPAP-----------------/*#35934- Insertado SIPAP pero no enviado*/--------/*Marca Pendiente SIPAP-20220906*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; --139 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20221005' where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; 
----con ids especificos
Select * from gxfindta.tcltsb where  tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Marca Pendiente Debitos*//*Envio de debitos masivos */
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 16:30:00'; --1.390 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220824' where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 08:30:00';
----------------------------------------/*
--con id especificos
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220823' where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
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
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
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
DELETE FROM gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');

/*20221220 - Transacciones afectadas*/
Select * from gxbdbps.tswaut where autrrnbep in 
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488','229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472','229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--Actualiza a Online en tclmov --32 registros
Update gxfindta.tclmov set movpgon = 'O' where movrrnbep in 
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488','229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472','229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Para el caso que se necesite habilitar la imputación  Actualizar estado para habilitar imputaciones
---error en el tablero de imputación SE CAMBIA LO QUE ES EJECUCIÓN QUE QUEDÓ EN ESTADO S A N
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM='PCLR154' AND PFDSECU='2';
SELECT PFCIDPARM,PFDIDGRUP,PFDVALCHR1 FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
UPDATE GXFINDTA.TCLPFD SET PFDVALCHR1 = 'N' WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Corrige el dato de la orden de pago pendiente en transmisiones #39632
Select * from gxfindta.tcltsb where tsbnref = '289100015728';
Update gxfindta.tcltsb set tsbtpop = '01', tsbdeop = 'CREDITO A COMERCIOS', tsbcodswd = 'BCNAPYPA', tsbbade = 1020, 
tsbctde = '0102184061', tsbesta = 'PE', tsbmotivo = 'redmine #39632',tsbtpde = 'CC', tsbcodswc = 'FICSPYPA', 
tsbbacr = 2080 where tsbnref = '289100015728';
--PARAMETRIZACIONES PARA LA REINGENIERIA  tarea 53786
--tabla de parametrizaciones de cuentas en conti
SELECT * from GXFINDTA.TCLVCT WHERE VCTNOMCLI='%%';
--Entidades Bancarias
Select * from contabilid.tatgene;
--Cambio de Banco Regional a Sudameris
select * from gxtrjdta.tdgenr ;
-- Cambio de codio swift
SELECT * FROM gxopera.CLPARF ;
--Asociar Cod de Banco Regional a Sudameris RI
SELECT * FROM gxtrjdta.TCOENC;
--Corrección de Nombre Legacy
SELECT * FROM gxbdbps.GENTIAF ;
-- Corrección de Nombres RI
SELECT * FROM gxtrjdta.tdgent;
--PARBCOPAI=5034 = LAMBARE - PARCSWIFT=CLAMPYPAXXXX (050)
Select * from gxtrjdta.tdgent where entcodent = 5034;
Select * from gxtrjdta.tcoenc where ENCENTANT = '050';
Select * from gxtrjdta.tdgenr where entcodent =5034;
--PARBCOPAI=2080 = FIC DE FINANZAS - PARCSWIFT=FICSPYPAXXXX (097)
--PARBCOPAI=2137 = CEFISA - PARCSWIFT=CRIFPYPEXXXX (098)
/*bancos reing -- clearing*/
Select * from gxtrjdta.tdgent where entcodent = 2137;
Update gxtrjdta.tdgent set ENTCODSWFT='CRIFPYPE' where entcodent = 2137;
/*relacion legacy-reing*/
Select * from gxtrjdta.tcoenc where encentrol = 213704;
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL)
VALUES (2137,'098',current user,current timestamp,213704);
/*entidad rol*/
Select * from gxtrjdta.tdgenr where entcodent =2137;
INSERT INTO GXTRJDTA.TDGENR
(ENTCODENT,ROLIDROL,ENRENTROL,ENRPERPAGO,ENRUSULTUP,ENRFHULTUP,ENRTIPOCON,ENRBCOPAGA)
VALUES (2137,4,213704,' ',current user, current timestamp,'IND',1020);
-----CAMBIO DE BBVA A BNB
/*Corrige BIC GNB*/
Select tsbidop, tsbdeop, tsbbade,  tsbcodswd,tsbbacr, tsbcodswc, tsbctcr, tsbcoco, tsbdene, tsbnref, tsbimpo,tsbesta, tsbdeme from gxfindta.tcltsb where tsbidop >  7338200 and tsbbacr = 1007;
Update gxfindta.tcltsb set TSBCODSWC = 'BGNBPYPX' where tsbidop >  7338200 and tsbbacr = 1007;
--REINGENIERIA
Select * from gxtrjdta.tdgent where entcodent = 1007;
Update gxtrjdta.tdgent set ENTCODSWFT = 'BGNBPYPX'  where entcodent = 1007;
--LEGACY
Select * from gxopera.clparf where PARCODBCO= '064';
Update gxopera.clparf set PARCSWIFT = 'BGNBPYPXXXX' where PARCODBCO= '064';
---ciontabilidad
Select * from contabilid.tatgene where tgalfa = 'BA' and tgcode = 'BB';
Update contabilid.tatgene set tgdesc = 'BANCO GNB' where tgalfa = 'BA' and tgcode = 'BB';
--entidad legacy
Select * from gxbdbps.gentiaf where enemiso = '064';
Update gxbdbps.gentiaf set ENNOMBR = 'BANCO GNB', ENNOMBC = 'GNB', ENNCTC1= 'BGNBPYPXXXX' where enemiso = '064';
/*Configura Banco Pagador para Trx BNF Online*/
Select * from gxtrjdta.tdgenr where entcodent = 1007;
Update gxtrjdta.tdgenr set ENRBCOPAGA = 1002 where entcodent = 1007;
/*cunado rechazo sipap*/ --ARCHIVO CLEARING PARAMETROS
 SELECT * FROM GXOPERA.CLPARF C2;
----------------------Multiclearing. credito y debito.!
--Transferir Credito a Comercios=             COMCL110 le llama al  COMRG110
--Transferir Clearing MULTIENTIDADES=         COMCL144 le llama al  COMRG144
--Verificar Credito Comercios=                COMRG116
/*Paso 1 hacer bk del opago1P a Adolfolib*/
select * from gxopera.opago1p;
/*Paso2 hacer bk del historico en la fecha solicitadoa EN ADOLFOLIB y restaurar al opago1p*/
select sum(pgimpor),  PGCODMV from GXOPERA.OPAGO1PHIS where PGFECOM=20230526  ---siempre tienen que ser iguales.
group by PGCODMV; --Tiene que coincidir con la pantalla que envían EN PANTALLA!
select * from GXOPERA.OPAGO1PHIS where PGFECOM=20230526;/*PARA BK*/
/*Paso 3 clrnpfm a opago1p*/
/*Paso 4 cpyf de historico al 1p con ADD de opción y verificar que coincida con la pantalla nuevamente*/
select sum(pgimpor), PGCODMV from GXOPERA.OPAGO1P where PGFECOM=20230526
group by PGCODMV;
/*Paso 5 eliminar del historico la fecha efectuada para evitar duplicaciones.*/
delete from GXOPERA.OPAGO1PHIS where PGFECOM=20230526;
/*RESTAURAR NUEVAMENTE EL BK DE OPAO1P DE ADOLFOLIB A OPAGO1P*/
------------------------------------------------------------------------------------------------------------------
/*Reproceso Clearing*/
select * from gxopera.OPMOVI where opferea ='20161202' and opuser = 'U99BERNAL';
select * from gxopera.OPCOMIS where opcofec ='20160826';
select * from gxopera.OPSEREX where SEFECO ='20160826';
SELECT * FROM GXOPERA.OPRECLE WHERE REFECH ='20181121' and reuser = 'U99BERNAL';
SELECT * FROM GXOPERA.FCTACOM WHERE ctafecha = '20161013';
SELECT * FROM GXOPERA.FLICOM WHERE  LIFECHD = '20161202' AND LIUSER = 'U99BERNAL';
SELECT * FROM GXOPERA.FLICOM1 WHERE  LIFECHD LIKE '20161202' AND LIFECHH = '20160713';
SELECT * FROM GXOPERA.OPAGO0P WHERE PGFCOM= '2016-12-02'; --Clearing Parte 1 Resumen Transferencias
SELECT * FROM GXOPERA.OPAGO1P; -- Clearing Parte 2 Débito Crédito
SELECT * FROM GXOPERA.OPAGO3P;
SELECT * FROM GXOPERA.OPAGO3TC;
SELECT * FROM GXOPERA.OPAGO5P;
SELECT * FROM GXOPERA.MAILS;
-------------------------------------------------------------------------------------------------------------------
DELETE from gxopera.opmovi where opfecom = '20161202';
Delete from gxopera.opcomis where opcofec ='20161202';
Delete from gxopera.OPSEREX where SEFECO ='20160826';
DELETE FROM GXOPERA.OPRECLE WHERE REFECH = '20161202';
DELETE FROM GXOPERA.FCTACOM WHERE CTAFECHA = '20161202';
DELETE FROM GXOPERA.FLICOM WHERE  LIFECHD = '20161202';
DELETE FROM GXOPERA.FLICOM1 WHERE  LIFECHD ='20161202';
/*DELETE FROM GXOPERA.OPAGO0P;
DELETE FROM GXOPERA.OPAGO1P;
DELETE FROM GXOPERA.OPAGO3P;
DELETE FROM GXOPERA.OPAGO3TC;
DELETE FROM GXOPERA.OPAGO5P;
DELETE from gxopera.mails;*/
-----------------------------------------------------------------------------------
---inconveniente con el clearing red de pagos.! el archivo es cnb en la 55
/*COMCL146    CLP         Clearing de Adelanto de BNF  04/10/2017
       BNF_ADELAN  BEPSA       BCH     0,0  PGM-COMCL146     MSGW */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|--AS/400 RPG  |-- BEPSA                 |-- BNF                 |-- CLEARING         |-- HISTORICO          |-- DESCRIPCION                                                               |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|--COMRG110    |-- LIBDEBITO/COPAGO0PDM  |-- LIBDEBITO/COPAGO0P  |-- GXOPERA/OPAGO0P  |--                    |-- Total de Acreditaciones del Emisor BNF a Bepsa                            |
|--COMRG144    |-- LIBDEBITO/COPAEN0PDM  |-- LIBDEBITO/COPAEN0P  |-- GXOPERA/OPAGO1P  |-- GXOPERA/OPAGO1PHIS |-- Acreditaciones de Bepsa a Comercios BNF                                   |
|--COMCL146    |-- LIBDEBITO/COPAEN2PDM  |-- LIBDEBITO/COPAEN2P  |-- GXOPERA/OPAGO3P  |-- GXOPERA/COPAEN2PHS |-- Acreditaciones por  BNF a Entidades con cuenta en BNF                     |
|--COMCL146    |-- LIBDEBITO/OPAGO3TCDM  |-- LIBDEBITO/OPAGO3TC  |-- GXOPERA/OPAGO3TC |-- GXOPERA/OPAGO3TCH  |-- Compensación entre entidades con cuenta en BNF                            |
|--COMCL146    |-- LIBDEBITO/OPAGO5PDM   |-- LIBDEBITO/OPAGO5P   |-- GXOPERA/OPAGO5P  |-- GXOPERA/OPAGO5PH   |-- Archivo de pago a Comercios BNF por transacciones de Red de Pagos (CNB)   |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO3P WHERE BNFFECOM = '20230526';
SELECT * FROM GXOPERA.COPAEN2PHS WHERE BNFFECOM = '20230526';
-----------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO3TC WHERE TCFECOM = '20230526';
SELECT * FROM GXOPERA.OPAGO3TCH WHERE TCFECOM = '20230526';
-----------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO5P WHERE PGFECOM5 = '20230526';
SELECT * FROM GXOPERA.OPAGO5PH WHERE PGFECOM5 = '20230526';
-----------------------------------------------------------------------------------
----------------red de pagos bnf
select * from GXOPERA.OPAGO3P;
--DELETE from GXOPERA.OPAGO3P WHERE BNFFEPRO='20230112';
select * from GXOPERA.COPAEN2PHS where BNFFECOM>='20230502';
--delete FROM GXOPERA.COPAEN2PHS where BNFFECOM='20230124';

select * from ADOLFOLIB.OPAGO3P;
-------------------------------------
select * from GXOPERA.OPAGO3TC;
--DELETE FROM GXOPERA.OPAGO3TC WHERE TCFEPRO='20230112';
select * from GXOPERA.OPAGO3TCH where TCFECOM='20230321';
--delete FROM GXOPERA.OPAGO3TCH where TCFECOM='20230314';

select * from ADOLFOLIB.OPAGO3TC;

select * from GXOPERA.OPAGO5P;
--DELETE FROM GXOPERA.OPAGO5P WHERE PGFECOM5='20230112';
select * from GXOPERA.OPAGO5PH where PGFECOM5>='20230321';
--delete FROM GXOPERA.OPAGO5PH where PGFECOM5='20230124';

select * from ADOLFOLIB.OPAGO5P;
/*CASO NO CARGA OPAGO3P*/
select * from gxopera.opmovi where opfecom = '20230526' and optiptar = 'DEB'
and (OPCOMER LIKE '80%' OR OPCOMER LIKE '90%')
and (OPCODTRN = '011000' or OPCODTRN = '012000' or OPCODTRN = '013000');
---GENEXUS EVO 2 Clearing Repuesto / Prepagbnf2014 volver a correr
--comentar tal cual abajo
/*//Parm(&entidad, &refech);

&entidad = ask('Entidad');==002
&refech  = ask('Fecha');==20230526*/
/*-----------------------------------------------------------------------------------*/
/*para ver los montos creditos y debitos caso bnf de comercio que no está en el excel pero si en el registro enviado
por ddm tarea http://10.1.254.18/issues/47891*/
/*bk previo antes de cada trabajo*/
select PGTIPO5, sum(pgimpor5) from GXOPERA.OPAGO5PH where PGFECOM5>='20230321'--and PGCOMER5='8605686'
GROUP BY PGTIPO5;
/*verificar monto directo en opmovi*/
SELECT sum(opmonto), count(*) from GXOPERA.opmovi where OPCODTRN='014000' and substr(OPTARJ, 1, 6)='703002' and OPFECOM='20230321';
/*sentencias para regularizar*/
/*se ajusta el monto del totalizador(final de la tabla) tiene que coincidir D con C*/
UPDATE GXOPERA.OPAGO5PH set pgimpor5='42242818' WHERE PGCOMER5='4500001' and PGFECOM5>='20230321'; --esos son los comercios que tienen cuenta en bnf
/*se elimina el comercio que no tiene que estar*/
DELETE from GXOPERA.OPAGO5PH where PGFECOM5>='20230321' and PGCOMER5='8605686';
/*luego se pasa a un axiliar y se vuelve a enviar el agendado*/
/*-----------------------------------------------------------------------------------*/
/*-----inofo-----------*/
--ddms afectados
--LIBDEBITO/COPAEN2PDM -- OPAGO3P
--LIBDEBITO/OPAGO3TCDM --OPAGO3TC
--LIBDEBITO/OPAGO5PDM -- OPAGO5P
/*La conexión utiliza el puerto 5246 del sistema local. La conexión utiliza la dirección IP 10.1.254.233,
puerto 446 del comserver y el ID de usuario BEPSA en el sistema remoto. Ahora se cambió y se apunta directo a
as_bnf '192.168.0.2' puerto 446*/
---------------------------------------------------------------------------------------------------------------------------
--Para cuando Rolando de BNF reclame diferencia
/*-- Ver control CNB para dividir despues cnb cnb cnb  si pasa  30.000*/
select count(*), lfcotr, sum(limpgs) from libdebito.drconbep where lfcotr >='20230320' and lcodtr='014000' and lesttr='A' and lcretr='00' group by lfcotr;
-- BNF SOLICITA EXCEL REPORTE INCOMPLETO DE TRX POR CANT DE LINEAS EN EXCEL GENERADO POR CLEARING
Select substr(OPIDTRA, 5, 4) "Secu", (substr(OPFEREA, 7, 2)||'/'
||substr(OPFEREA, 5, 2)||'/'||substr(OPFEREA, 1, 4)) "F.Real",
substr(OPFECOM, 7, 2)||'/'||substr(OPFECOM, 5, 2)
||'/'||substr(OPFECOM, 1, 4) "F.Comercial",
substr(digits(OPHOTRN), 3, 2)||':'
||substr(digits(OPHOTRN), 5, 2)||':'
||substr(digits(OPHOTRN), 7, 2) as "Hora",
substr(optarj,1,6)||'XXXXXX'
||substr(optarj,13,4) "Nro.Tarjeta",opcomer "Comercio",
opmonto "I.Compra", opcomi "Comisión", opcoment "Com.Entidad",
opivaent "IVA s/C.Ent", opcombps "Com.Bepsa",
opivabps "IVA s/C.Bps", opmonto "Neto", opcodaut
"Cod.Aut.", substr(opidtra,1,8) "Origen"
from gxopera.opmovi where opfecom = '20230324'
and substr(opidtra,1,1) <> 'T'
and OPTIPTAR = 'DEB'
and opcodtrn = '014000'  -- Adelanto CNB
and SUBSTR(OPCOMER,1,2) = '86'
order by opfecom, opcomer, optarj;
/* formato de la RED DE PAGOS DINELCO.
//------------------------------------------------------------------------------------------------------------------------------------------------------------//
// SECU  | FREAL | FCOMERCIAL | HORA  | TARJETA | COMERCIO | ICOMPRA  | COMISION | COMENTIDAD | IVAENTIDAD | COMBEPSA | IVABPS   | NETO     | CODAUT | ORIGEN //
// Texto | Texto | Texto      | Texto | Texto   | Texto    | Numérico | Numérico | Numérico   | Numérico   | Numérico | Numérico | Numérico | Texto  | Texto  //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*97 al 93 .xls, quitar desimales nombre: 20230324RdetalAdeEfectivoCNBXLS.xls*/
---------------------------------------------------------------------------------------------------------------------------
/*GXFINDTA.TCLCSP
GXFINDTA.TCLCPC
GXFINDTA.TCLTPC
Esos son las tablas que indican el clearing RI. Que llama a los main para la carga de las comisiones
CSP es la cabecera y CPC detalle Osea clearing RI se carga por pantalla, y en ella se va marcando cada proceso que ya se " comisiono" osea,
que todos los servicios estan por separado "La idea es que clearing RI sea un poco más independiente y se pueda correr solo el servicio necesario"
Entonces esas son las tablas que carga y deja registro "que y en donde mismo se encuentra el procedimiento de clearing" TCLTPC es la carga
temporalAutorizador carga TSWAUT y de allí se carga el temporal primero "revisiones y control" y luego carga TCLMOV
Todo esto tambien dentro del proceso clearing y estan especificados en las tablas mencionadas anteriormente */
---------------------------------------------------------------------------------------------------------------------------
/*Generación de Debito a Emisores con cuenta en COntinental*/
sELECT MVFEPRO, CMCODIG, SUM(MVIMPO2)FROM GXBDBPS.TMOVIAF WHERE MVEMISO = '021' AND mvfepro = '20221129' and mvcodre = 0 and
CMCODIG IN ( '005','010','020','040','042','091') GROUP BY MVFEPRO, CMCODIG
UNION
SELECT CUFECOM, CMCODIG, SUM(CUIMPOR) FROM GXBDBPS.TCUOTAF WHERE CUEMISO = '021' AND CUFECOM = '20221129' AND
CMCODIG IN ('006','007') GROUP BY  CUFECOM, CMCODIG;

SELECT MVFEPRO , COUNT(*), SUM(MVIMPO2) AS Total, CMCODIG FROM GXBDBPS.TMOVIAF t WHERE MVEMISO= '183' AND MVCODRE =0
AND MVFEPRO = '20221104'AND MVCODCO>'0100030' and MVCODCO < '9200000'
AND CMCODIG in('005' , '010' ,'020' , '040', '042', '091')GROUP BY MVFEPRO,MVEMISO, CMCODIG ;
--- arroja un valor en fecha comercial 20221107 - 93.614.477 gs
SELECT * FROM GXBDBPS.TMOVIAF t WHERE MVEMISO= '183'AND MVCODCO>'0100030' and MVCODCO < '9200000'AND MVCODRE =0
AND MVFEPRO = '20221104' --AND MVCODSC <> '000' ---
AND CMCODIG in('005' , '010' ,'020' , '040', '042', '091'); --replica del de arriba

SELECT * FROM GXBDBPS.TCUOTAF t --transacciones a cuotas
WHERE CUFECOM = '20221104'
AND CUEMISO = '183'AND CUCODCO>'0100030' AND CUCODCO < '9200000'
AND CMCODIG IN('006', '007')
AND CUSTATS <> 'R' --para este NO arroja resultados en esa fecha comercial

SELECT * FROM GXBDBPS.THMOVAF t--- HISTORICO DE MOVIMIENTOS
WHERE HMFEPRO = '20221104'AND HMCODRE = 0 AND HMEMISO= '183'AND HMCODCO>'0100030' and HMCODCO< '9200000'
AND HMCODIG IN ('005' , '010' ,'020' , '040', '042', '091') ; --REPLICA DEL DE ABAJO

SELECT HMFEPRO , COUNT(*), SUM(HMIMPO2) AS TOTAL FROM GXBDBPS.THMOVAF t--- HISTORICO DE MOVIMIENTOS
WHERE HMFEPRO = '20221104'
AND HMCODRE = 0AND HMEMISO= '183'AND HMCODCO>'0100030' and HMCODCO< '9200000'
AND HMCODIG IN ('005' , '010' ,'020' , '040', '042', '091')
GROUP BY HMFEPRO , HMEMISO ; ---NO se encuentran transacciones en el histórico, todas las trx están en TMOVIAF

--Para verificar lo que se cargó en transmisiones, filtrar por el cocomer y fecha proc
Select *
--deletefrom gxfindta.tclimb where imbfch = '20221104' AND IMBIDOP= 223080074500189; --Imputaciones de pago
--Select *
--deletefrom gxopera.oplicre where opcrefcom = '20221104' AND OPCRECOM= '4500189';
--------------------------------------------------------------------------------------------------------------
--Según lo acordado, se provee los querys necesarios para el repair y para la generación del reporte.
/*##PAGO RETAIL CADA 48 HS. POR ACREDITACIONES BATCH##*/

--Repair(Ejecutar el 26/11/2022 luego del proceso New Clearing)

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221125' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221125' and imbests = 'PE';

/*Query para generación de reporte luego de ejecución del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221125' and IMBCLI =10937;
--Repair(Ejecutar el 29/11/2022 luego del proceso New Clearing)

/*HABILITA IMPUTACIÓN*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221125' and imbests = 'IR';
Update gxfindta.tclimb set imbests = 'PE', imbobs = 'PENDIENTE DE IMPUTACION' where IMBCLI =10937 and imbfch = '20221125' and imbests = 'IR';

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221128' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221128' and imbests = 'PE';

/*Query para generación de reporte luego de ejecución del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221125' and IMBCLI =10937;
--Repair(Ejecutar el 30/11/2022 luego del proceso New Clearing)

/*HABILITA IMPUTACIÓN*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221128' and imbests = 'IR';
Update gxfindta.tclimb set imbests = 'PE', imbobs = 'PENDIENTE DE IMPUTACION' where IMBCLI =10937 and imbfch = '20221128' and imbests = 'IR';

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221129' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221129' and imbests = 'PE';

/*Query para generación de reporte luego de ejecución del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221128' and IMBCLI =10937;
--Esta misma lógica se debe mantener para los días posteriores, hasta que se tenga una modificación de las aplicaciones propiamente

--tabla para ver el CIERRE
select * from gxbdbps.tlogsaf where LSFECHA = '20230325' AND LSTIPRO = 'CIER' order by LSHORA desc;---VERIFICAR LOGS PRODUCCION
--tabla para ver el clearing
select * from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20220119' order by lshora desc;
------------------------------------
---cambiar fecha para que lo tome cuponamiento
update GXBDBPS.tswaut
set AUTFECINC = '2023-01-03 00:00:00.000'
where AUTFECINC = '2022-12-30 00:00:00.000';
------------------------------------
select * from GXBDBPS.gferiaf WHERE FEFERIA='20230227';---Tabla de feriados
select * from gxtrjdta.tdscal where CALFECHA>'20230000';--tablas de dias de reing.
SELECT * FROM PUBLIC.FERIADO WHERE FECHA>='2023-03-28'; --EMPES
----------------------------------------------------------------------------------------------
--codigo 86 and 81
Select opferea, opfecom, opliqde, sum(opmonto) from gxopera.opmovi where opcomer = '8600240' and opliqde = '20221202' group by opferea, opfecom, opliqde; --detalle de movimiento
Select * from gxopera.flicom1 where licomer = '8600240' and lifechd = '20221202'; --Liquidación
Select * from gxopera.opago5ph where pgcomer5 = '8600240' and pgfecom5 = '20221202'; -- orden de pago en BNF
-----------------------------------------------------------------------------------------------
--no llego a correr instructivo y se vacía
SELECT --SUM(INSFACTOT)
* FROM GXOPERA.TRXINST where INSFECARGA = '20230112' AND INSTATUS='P';
DELETE FROM GXOPERA.TRXINST where INSFECARGA = '20230112' AND INSTATUS='P';
----------------------------------------------------------------------------------------------
-------------------------/*caso tigo-tigo money*/-------------------------------------------------------
SELECT sum(LIMPGS), LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1) FROM LIBDEBITO.DRCONBEP WHERE
GROUP BY LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1);
-----------------------------------------------------------------------------------------------------
SELECT sum(OPMONTO), COUNT(*), OPFECOM, OPFEREA, OPCODTRN, OPENEMI FROM GXOPERA.OPMOVI WHERE OPFECOM ='20230117' AND OPENEMI IN (152, 581) AND OPADMIN<>581
GROUP BY OPFECOM, OPFEREA, OPCODTRN, OPENEMI;
-----------------------------------------------------------------------------------------------------
SELECT sum(OPMONTO), COUNT(*), OPFECOM, OPFEREA, OPCODTRN, OPENEMI, OPSTATUS FROM GXOPERA.OPMOVI WHERE OPNOREF;
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR='20230118' AND LFCOTR='20230118' AND LENEMI='581'
/*SELECT sum(LIMPGS), COUNT(*), LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1) FROM LIBDEBITO.DRCONBEP WHERE LFECTR>='20230117'*/AND LERRNB IN
('301841125145',
'301841125165');--GROUP BY LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1);
GROUP BY OPFECOM, OPFEREA, OPCODTRN, OPENEMI,OPSTATUS;
-----------------------------------------------------------------------------------------------------
 --DWAREBNF --  PROMOBNF = ENVIO ARCHIVO DATAWARE PARA EL BANCO
--CALL PGM(LIBDEBITO/PROMOBNF)
  /*  CPYF  FROMFILE(GXDEBITO/PROMOBNF) TOFILE(GXDEBITO/PROMOBNFDM) MBROPT(*REPLACE) CRTFILE(*NO) FROMFILE(LIBDEBITO/MOVDINEL)
TOFILE(LIBDEBITO/MOVDINEDDM) MBROPT(*ADD) CRTFILE(*YES) */
SELECT * FROM GXDEBITO.PROMOBNF;
SELECT * FROM LIBDEBITO.MOVDINEL;
-----------------------------------------------------------------------------------------------------
--caso clearing
---VER SI CARGA OPMOVI
select count(*) from gxopera.opmovi
where opfecom='20230327';
---VER LO QUE HAY QUE TIEN QUE CARAR
select count(*) from libdebito.drconbep
where lfcotr='20230327' and LCRETR='00'
and LESTTR='A' and lcodtr IN
('000054', '011000', '012000', '013000', '014000', '000052','370000', '380000', '390000','011000','012000','013000',
'015000','000054','000052','567101','567102','000072','530004','340000','000048','000049','000050','710000');
------------------------------------------------------
--tarea http://redmine2.bepsa.com.py/issues/45684
/*parar cerrar clearing*/
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N'WHERE PFCIDPARM = 'CIERRECLEARING';
/*para reprocesar clearing batch reing*/
SELECT * FROM GXFINDTA.TCLFEC WHERE fecid = 2;
UPDATE GXFINDTA.TCLFEC SET FECANT = '20230207', FECPRO = '20230208', FECSIG = '20230209' WHERE FECID = '002';
-------------------------------------------------------------------------------------------------------------------
/*parar cerrar clearing*/
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N'WHERE PFCIDPARM = 'CIERRECLEARING';
/*para reprocesar clearing batch reing*/
SELECT * FROM GXFINDTA.TCLFEC WHERE fecid = 2;
UPDATE GXFINDTA.TCLFEC SET FECANT = '20230207', FECPRO = '20230208', FECSIG = '20230209' WHERE FECID = '002';
-------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCPC WHERE CPCFEC ='20230207';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCPC SET CPCEST = 'P',CPCOBS = '', CPCDESC = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR001     ' AND   CPCPARM = 'ATM       ';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCPC SET CPCEST = 'P', CPCOBS = '', CPCDESC = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ';
-------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCFEC ='20230206';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR001     ' AND   CPCPARM = 'ATM       ' AND   CSPCOD = 'PCLR003     'AND   CSPSECU = 1;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     'AND   CSPSECU = 1;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 2;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 3;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P',CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 4;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 5;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 6;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 7;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 8;
-------------------------------------------------------------------------------------------------------------------
/*para poner en error para marcar hasta donde procesar*/
UPDATE GXFINDTA.TCLCPC SET CPCEST='C' WHERE (CPCFEC='20230206' AND PRCCOD='PCLR007     ' AND CPCPARM='VTAMIN    ' AND CPCSECU=13 );
UPDATE GXFINDTA.TCLCSP SET CSPEST='C' WHERE (CPCFEC='20230206' AND PRCCOD='PCLR007     ' AND CPCPARM='VTAMIN    ' AND CSPCOD='PCLR015     ' AND CSPSECU=1 AND CSPPARM='VTEP      ');
-------------------------------------------------------------------------------------------------------------------
---------------------------------------703020 - 703020 COMPRA
Select opnroref from gxopera.opliqui where opcodbco = 57 and substr(opcampoa,1,6) = '703002' and substr(opcampoa,41,8) = '20230207' and opstat = '00' AND OPSTATOB='00'
except
Select tsbnref from gxfindta.tcltsb where tsbfpro = '20230207';

-----------------------------------------------------------------------------------------------
SELECT LERRNB, LFECTR FROM LIBDEBITO.DRCONBEP WHERE LFECTR>='20230101' AND LCRETR='00' AND LESTTR='A' AND LBINPR='703020' AND LCODTR='000054'
EXCEPT
SELECT OPNOREF, OPFEREA FROM GXOPERA.OPMOVI WHERE OPFEREA>='20230101'; --AND substr(OPCAMPOA, 1, 6 )='703020'--contra opliqui, opfechliq

SELECT OPNCOMER FROM GXOPERA.OPLIQUI WHERE OPNROREF IN ('303748535330','303548126900');

----OPLIQUI QUE NO ESTÁN EN TCLTSB
Select * from gxopera.opliqui where opcodbco = 57 and substr(opcampoa,1,6) = '703002' and substr(opcampoa,41,8) = '20230206' and opstat = '00' --and opstatob = '00' 
and opnroref not in (Select tsbnref from gxfindta.tcltsb where tsbfpro = '20230206');
------------------------------
/* NUMERO DE CUENTA NULO- se elimina del tablero la CUENTA DÉBITO*/
Select * from gxfindta.tcltsb where tsbcoco = '0705590'and tsbtpop = '01' and tsbbacr = 1007 and tsbesta <> 'AC' and tsbtpoacr = 'O'
and tsbctde = ''; --92 REGISTROS
Update gxfindta.tcltsb set tsbctde = '0102184061', tsbesta = 'PE', tsbmotivo = 'REDMINE #47207' where tsbcoco = '0705590'
and tsbtpop = '01' and tsbbacr = 1007 and tsbesta <> 'AC' and tsbtpoacr = 'O';
---------------------------------
/*Imputación indebida comercios BBVA*/
Select * from gxfindta.tcltsb where tsbnref in ('301139503566','301139512151','301139528759','301139543782','301139569892');
-----------------------------------
/* Para verificar los codigos de transaccion del anterior con los servicios (000054 = 'COMPRA')*/
SELECT * FROM GXFINDTA.TCLPRE;
Select txctrx, txdtrx from libdebito.tbctra0p; -- Legacy
Select prematrx, sercodi, precodi, predesc from gxfindta.tclpre where preclea = 'TRA';--Reingenieria
--para lenemi
Select * from gxopera.opentid1;
-----------------------------------
---para traer la cuenta B o Online
SELECT * FROM gxfindta.TCLSCT t WHERE t.SERCODI = 'DEBITOEN' AND t.PRECODI = 'DEEN' AND t.SCTCOBA = 1020 and T.SCTCTAP = 1;
--0104913400    --siempre que sea batch y para en linea 0102184061
-------------
/*objetos para bepsainfo*/
select * from GXBDCON.GXLOFUN where SISCODI='BI';
-----------------------------------------------
/*-- Actualizar fecha de GEMPRAF antes del clearing
UPDATE GXBDBPS.GEMPRAF
SET EMFESIG='20230329',EMFEPRO='20230328',EMFEANT='20230327'
WHERE EMCODIG='001';
-- Actualizar fecha de GEMPRAF despues del clearing
UPDATE GXBDBPS.GEMPRAF
SET EMFESIG='20230328',EMFEPRO='20230327',EMFEANT='20230324'
WHERE EMCODIG='001';
------------------------------------------------------*/
-- Tabla donde se registran los procesos que serán ejecutados durante el cierre
SELECT * FROM gxfindta.tclcpc t WHERE t.CPCFEC = '20230601';

-- Tabla  donde se registran los subprocesos que serán ejecutados durante el cierre
SELECT * FROM gxfindta.TCLCSP t WHERE t.CPCFEC = '20230531';
--cuando empieza el proceso del cierre vas a encontrar datos en esa tabla con el campo CPEST = 'P', luego va actualizando a 'C' a medida que se vaya completando..
--Movimientos de TC sin valor de renta e ivarenta para rol ISA -- tarea 50628
SELECT
    o3.*,
    (opmonto-opcoment-opcombps-opivaent-opivabps-oprenta-opreiva) neto_opmovi,
    t.MOVNETO ,
    (t.MOVNETO - (opmonto-opcoment-opcombps-opivaent-opivabps-oprenta-opreiva)) diferencia
FROM
    GXOPERA.OPMOVI o3
LEFT JOIN GXFINDTA.TCLMOV t ON
    o3.OPNOREF = t.MOVRRNBEP
WHERE
    o3.OPNOREF IN (
    SELECT
        adq.OPNOREF
    FROM
        GXOPERA.OPMOVI adq
    INNER JOIN GXOPERA.OPMOVI emi ON
        adq.OPNOREF = emi.OPNOREF
    WHERE
        SUBSTRING(adq.OPCOMER , 1, 2) <> '69'
            AND SUBSTRING(emi.OPCOMER , 1, 2) = '69'
                AND adq.OPRENTA = 0
                AND adq.OPREIVA = 0
                AND emi.OPRENTA > 0
                AND emi.OPREIVA > 0
                AND adq.OPFECOM >= '20230426');
/*Validación de retenciones que se volvieron a pagar en linea*/
Select a.movidmov,movrrnbep, movftrx, movneto, rtdnrortam, RTDMONAMRT,RTDMONMOV,tsbnref, tsbimpo, tsbdeme, tsbfege
from gxfindta.tclmov a left join gxfindta.tclrtd b on a.movidmov = b.movidmov
left join gxfindta.tcltsb on movrrnbep = tsbnref where a.movidmov in (
Select movidmov from gxfindta.tclrtd where  RTDFCHCOB = '20230410');

/*Verificación de liquidación Vs Declaración impositiva tarea 51915, se agega una linea mas con fecha 29 en la cabezera y en detalle(flicom1)
se cambia la fecha de una de las trx del 26 para que salga con la otra factura lo que corresponde*/
Select * from gxopera.flicom where licomer = '0801505' and lifechd > '20221220';
Select * from gxopera.flicom1 where licomer = '0801505' and lifechd > '20221220';
Select a.*,(licoent+licobps), (liivaent+liivabps) from gxopera.flicom1 a where linrofac in ( '10020092046','10020100868') and substr(lifecredi, 1, 6) = '202212';
Select * from contabilid.CCLFACT where lfsitu = 2 and lftpdo = 'LI' and lfcocl = '0801505' and lfnrfa in ( '10020092046','10020100868');
-- tiene que ser igual al campo LFIMGR las suma de=LICOENT+LICOBPS e igual a LFIMIM=LIIVAENT+LIIVABPS
-------------------------------
/*Validación de retenciones que se volvieron a pagar en linea*/
Select a.movidmov,movrrnbep, movftrx, movneto, rtdnrortam, RTDMONAMRT,RTDMONMOV,tsbnref, tsbimpo, tsbdeme, tsbfege
from gxfindta.tclmov a left join gxfindta.tclrtd b on a.movidmov = b.movidmov
left join gxfindta.tcltsb on movrrnbep = tsbnref where a.movidmov in (
Select movidmov from gxfindta.tclrtd where  RTDFCHCOB = '20230410');
--------------
/*Cambio de Parámetros Continental - configuraciòn del servicio de pago a comercios - disminuir la cantidad de trx a 180 por minuto - tarea 54537*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set PFDVALCHR2 = '0 */3 * * * *', PFDVALIMP2 = 180, PFDVALFEC2 = '1', PFDVALIMP1 = 300000
WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
/*Cambio de Parámetros Continental - Aumenta cantidad de Hilos*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set  PFDVALFEC2 = '3' WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
/*Cambio de Parámetros Continental - Aumenta cantidad de Hilos*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set  PFDVALIMP2 = 536 WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
  /*Análsis CICO - 20230728*/
Select cofactu, BS15CODCOM,count(*), sum(opmonto),BS15MONSAL from gxopera.opmovi inner join gxbdbps.comaeaf on opcomer = cocomer inner join libdebito.bst015 on substr(BS15CODCOM,6,7) = cofactu and BS15CODPRO = 'CICOMONEY'
where opfecom between '20230329' and '20230726' and opcodtrn in ('370000','380000','390000')
group by  cofactu, BS15CODCOM, BS15MONSAL;
/*Resumen Anual CICO - Opmovi/Deposito/Otros*/
Select '1-MOVIMIENTO' Operacion,  substr(opferea,1,4) periodo, opcodtrn transaccion, a.cofactu CtaMadre,b.codeno, count(*) cantidad, 0 saldOperativo,
(Case when opcodtrn = '370000' then sum(opmonto) else 0 end )carga, (Case when opcodtrn = '390000' then sum(opmonto) else 0 end ) giro, (Case when opcodtrn = '380000' then sum(opmonto) else 0 end ) retiro, 0 deposito, 0 INSTMANUAL
from gxopera.opmovi inner join gxbdbps.comaeaf a on opcomer= a.cocomer inner join gxbdbps.comaeaf b on a.cofactu = b.cocomer
where a.cofactu = '1000414' and substr(opferea,1,4) ='2023'  and opcodtrn in ('370000','380000','390000')
group by substr(opferea,1,4), opcodtrn, a.cofactu, b.codeno
union
Select '2-DEPOSITO' , substr(depfecha,1,4), 'DEPO', depcom, codeno,count(*),0, 0 , 0, 0 , sum(depmonto), 0
from gxweb.depcico inner join gxbdbps.comaeaf on depcom = cocomer
where depcom = '1000414' and substr(depfecha,1,4) = '2023' and depestado in ('P','L') AND depforpag <> 'IMA'
group by substr(depfecha,1,4), depcom, codeno
UNION
Select  '3-INSTMANUAL', substr(depfecha,1,4),  'IMA', depcom, codeno,count(*),0, 0 , 0, 0 , 0, sum(depmonto)
from gxweb.depcico inner join gxbdbps.comaeaf on depcom = cocomer
where depcom = '1000414' and substr(depfecha,1,4)='2023' and depestado in ('P','L') AND depforpag = 'IMA'
group by substr(depfecha,1,4), depcom, codeno
UNION
Select '4-SALDO', BS15CODPRO,saldoperativo,BS15CODCOM,codeno,0, BS15MONSAL,0,0,0,0,0
from libdebito.bst015 inner join gxbdbps.comaeaf on substr(BS15CODCOM,6,7)= cocomer
where BS15CODCOM like '%1000414%'
order by 4,3,1
/*=======================================*/