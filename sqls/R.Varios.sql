---------------------------------------------------------------------------------------------------------------------------
----------------------------localidad reingenieria
select * from GXFINDTA.TCMRCI where RCINOMCIU like '%SAN ALBERTO%';
select * from GXTRJDTA.TDGCIU WHERE CIUDSCIUD  like '%SAN ALBERTO%';
select * from GXFINDTA.TCOCIU WHERE CIUDESCRI like '%SAN ALBERTO%' ;
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXFINDTA.TCMRCI
( RDECODDEP, RCICODCIU, RCICIUERP, RCINOMCIU, RCIUSULTUP, RCIFHULTUP)
VALUES
( 15, 9, '259', 'POZO COLORADO', 'U99ROJAS' , '2022-08-01 11:35:20.000');
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXTRJDTA.TDGCIU
( CIUIDCIUD, DEPIDDEPT, CIUDSCIUD, CIUUSULTUP, CIUFHULTUP)
VALUES
( 9, 15, 'POZO COLORADO', 'MIGRACION ', '2020-04-23 18:00:00.000');
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXFINDTA.TCOCIU
( DEPCOD, CIUCODNUE, CIUCODACT, CIUDESCRI, CIUUSULTUP, CIUFHULTUP)
VALUES
( 15, 9, '195', 'POZO COLORADO', 'U99ROJAS', '2022-08-01 11:42:07.000');
----------------------------------------------------------------------------------------------------------------
----------------------------Tareas #37073 ALQUILER DE POS - SETIEMBRE
/*Elimina facturas generadas de manera incorrecta*/
Select * from gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
Delete FROM gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*No se generaron detalles relacionadas*/
Select * from gxopera.factura1 where factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*El numerador de facturas no fue actualizado en el rango afectado*/
Select * from gxopera.factura2 where FACTURA2TIMBRADO = '15662553' and FACTURA2TIPO = 'NOR';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------tablas de comercios reing.
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLIRUC = '932416-0';
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLIDENCOM LIKE '%PETROCHA%'; -- tabla cliente reing.
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLICLICOD = 15168;
SELECT * FROM GXFINDTA.TCMSUC t WHERE CLICLICOD = 2905  and SUCDENCOM LIKE '%BIGGIE%';--CLICLICOD = 925; --tabla de sucursales relacion con tabla de cliente.
SELECT * FROM GXFINDTA.TCMSUC t WHERE CLICLICOD = 6268;
SELECT * FROM GXFINDTA.TCOCNA t WHERE COCOMER = '1302981';---tabla de relación actual y reing.
select * from gxfindta.tcocna where cliclicod = 19220;
SELECT * FROM GXFINDTA.TCOCNA WHERE CNADENCOM LIKE '%BANCO RIO%';
SELECT * FROM gxfindta.TCMSUC t WHERE SUCFECALT = '20220914';
--WHERE CLICLICOD=13110 AND SUCSUCCOD=1 AND COCOMER='8602540';
--------------sucursal que no migre
SELECT * FROM Gxfindta.tcmsuc WHERE CLICLICOD='14661' AND SUCSUCCOD='140';

UPDATE GXFINDTA.TCMSUC
    SET SUCTELEFO='0971437373', SUCTELMO1='0983568084'
WHERE CLICLICOD='14661' AND SUCSUCCOD='140';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from cliente where ClienteCodigo ='10937-1';
SELECT CLICLICOD, CLIRUC, CLIDENCOM, CLIRAZSOC FROM GXFINDTA.TCMCLI WHERE CLICLICOD = 126 ORDER BY CLICLICOD  FOR FETCH ONLY;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- Logs alta sucursal
SELECT b.SPRIDSEG, b.SDPSECUE, b.SDPDSPROCE , b.SDPFH FROM GXTRJDTA.TDSSPR a INNER JOIN GXTRJDTA.TDSSDP b
ON a.SPRIDSEG = b.SPRIDSEG
WHERE a.PRCIDPROCE = 'PCM026'
ORDER BY a.SPRFECHA DESC ;

SELECT * FROM gxtrjdta.TDSPrc WHERE PRCIDPROCE = 'PCM026'; -- PROCESOS
SELECT * FROM gxtrjdta.TDSSPR WHERE PRCIDPROCE = 'PCM026'  ORDER BY SPRIDSEG desc;-- CABECERA LOG
SELECT * FROM GXTRJDTA.TDSSDP WHERE SPRIDSEG  = 2069629; -- DETALLE LOG
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Cambio de cuenta*/ --ADNUMCTA=cuenta credito
select * from gxbdbps.comaeaf where COCOMER ='8000002' and ADNUMCTA = '0626103507';

update gxbdbps.comaeaf set ADNUMCTA ='0626103507' where COCOMER ='0703051'
and ADNUMCTA = '10082480006';

SELECT CLICLICOD, LIQNOMTIT, LIQNROCUE FROM  GXFINDTA.tcmliq where CLICLICOD ='13613';
update GXFINDTA.tcmliq set LIQNROCUE ='1701015625' where CLICLICOD ='9258';

SELECT * FROM GXFINDTA.TCOCNA t WHERE COCOMER = '0705590';---tabla de relación actual y reing.
----sistema actual
SELECT * FROM gxbdbps.comaeaf c WHERE c.COCOMER in ('0801697', '0801698', '0802106');
SELECT c.ADNUMCTA, c.COCOMER, c.CODENO FROM gxbdbps.comaeaf c WHERE c.COCOMER in ('0801697', '0801698', '0802106');
UPDATE gxbdbps.comaeaf SET ADNUMCTA ='6328722116' WHERE COCOMER in ('0701635', '8102689', '8602178');
--------------------------------------------------------------------------------------------------------------------------------------------------------
----cambio de cuenta reing. c.debito
SELECT * FROM GXFINDTA.TCLSCT WHERE SERCODI = 'INSMANCRE';
update GXFINDTA.TCLSCT set SCTNRCT ='0101015664' where SERCODI='INSMANCRE';

SELECT * FROM GXFINDTA.TCLTSB --WHERE SERCODI = 'INSMANCRE'
WHERE TSBIDOP IN ('4665177','4665455');

UPDATE GXFINDTA.TCLTSB
   SET TSBCTDE = '0101015664',
       TSBESTA = 'PE'
WHERE TSBIDOP IN ('4665177','4665455');
--------------------------------------------------------------------------------------------------------------------------------------------------------
---cambio de estado de instructivo
SELECT * FROM GXFINDTA.TCLIMC WHERE IMCIDIMC = 7; --cabezera
UPDATE GXFINDTA.TCLIMC SET IMCEST ='P' WHERE IMCIDIMC = 7;

SELECT * FROM GXFINDTA.TCLIMD WHERE IMCIDIMC = 7; ----detalle el 4 es porque esta duplicado la REFERENCING en tcltsb
UPDATE GXFINDTA.TCLIMD SET IMDTRARET =0 WHERE IMCIDIMC = 7;
tclsci--
tcoenc--codigo de banco actual|
tdgenr--nuemro de cuenta segun el rol
tclcst--servicio-'insmancre'
--fabiana fretes.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----/*permisos reing*/
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99OVELAR';
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99HERNAN';
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99SILVANA';
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99LILIANA';
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99IVANA';
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99ADOLFO';
SELECT * FROM GXSEGDTA.TSGARU t WHERE SGUSRCOD IN (2892);--hernan
SELECT * FROM GXSEGDTA.TSGARU t2 WHERE SGUSRCOD IN (3826);--adolfo
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD, SGSISCOD, SGUSRCOD, SGARUEXP, SGARUUSMO, SGARUFCHMO, SGARUENTRJ) VALUES (194, 21, 3826, 'N', '          ', '0001-01-01 00:00:00.000000', ' ');
  
/*DELETE FROM GXSEGDTA.TSGARU WHERE SGROLCOD=87 AND SGSISCOD=1 AND SGUSRCOD=3880;*/
---http://localhost:8080/accesobepsa/servlet/seguridad.

UPDATE GXSEGDTA.TSGFUN
SET SGFUNURLOB=''
WHERE SGFUNCOD=3880 AND SGSISCOD=1;

SELECT * FROM GXSEGDTA.TSGUSR where SGUSRCOD IN (3826, 2942);
select * from gxsegdta.tsgsis where SGSISCOD = '21';
SELECT * FROM GXSEGDTA.TSGARU WHERE SGUSRCOD IN (3826, 2942);
SELECT * FROM GXSEGDTA.TSGROL WHERE SGROLCOD IN (87,91,194,278);--hf
SELECT * FROM GXSEGDTA.TSGROL WHERE SGROLCOD IN (87,136,91,586,194,278);--adolfo   586/136
SELECT * FROM GXSEGDTA.TSGROLDT;
SELECT * FROM GXSEGDTA.TSGROLDT WHERE SGROLCOD = '87' AND SGFUNCOD IN ('1001', '3880');
select * from GXSEGDTA.TSGFUN where SGFUNOBJ like '%WABM004%';
SELECT * FROM GXSEGDTA.TSGARU WHERE SGROLCOD = '203';
SELECT * FROM GXSEGDTA.TSGREX WHERE SGREXUSR IN ('3826','2942');
SELECT * FROM GXSEGDTA.TSGFUN;
select * from gxsegdta.tsggen;
select * from gxsegdta.tsgusr where SGUSRCOD='3826';
--DELETE FROM GXSEGDTA.TSGFUN WHERE SGFUNCOD=5273 AND SGSISCOD=1;

INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)VALUES(5273, 1, 'LISTADO DE CORTE', 'WABM004', 'N', 0, 'S', 'S', 'W', 'U99HERNAN ', '2021-06-12 12:06:06.991', 1000, 'http://portal.bepsa.com.py/accesobepsa/servlet/seguridad.', 'I');
--Agregar pantalla de Historico de bloqueo a liliana Conteiro
INSERT INTO GXSEGDTA.TSGROLDT
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(136, 1, 3990, 'S', 'N', 'N', 'N');

SELECT B.SGUSRCOD AS CODUSUARIO, B.SGUSRNOM AS USUARIO, A.SGSISCOD AS CODSISTEMA, D.SGSISDESC AS SISTEMA, A.SGROLCOD AS CODROL, C.SGROLDESC AS ROL, E.SGFUNCOD AS CODFUNCION, F.SGFUNDES AS FUNCION,
F.SGFUNOBJ AS OBJETOGX, E.SGRDTPDIS AS DISPLAY, E.SGRDTPUPD AS UPDATEE, E.SGRDTPINS AS INSERTT, E.SGRDTPDEL AS DELETEE FROM gxsegdta.TSGARU AS A
JOIN GXSEGDTA.TSGUSR AS B ON A.SGUSRCOD = B.SGUSRCOD
JOIN GXSEGDTA.TSGROL AS C ON A.SGROLCOD = C.SGROLCOD AND A.SGSISCOD = C.SGSISCOD
JOIN GXSEGDTA.TSGSIS AS D ON A.SGSISCOD = D.SGSISCOD
JOIN GXSEGDTA.TSGROLDT AS E ON A.SGROLCOD = E.SGROLCOD AND A.SGSISCOD = E.SGSISCOD
JOIN GXSEGDTA.TSGFUN AS F ON A.SGSISCOD = F.SGSISCOD AND F.SGFUNCOD = E.SGFUNCOD
--WHERE B.SGUSRNOM LIKE 'ADOLFO%'
WHERE B.SGUSRCOD = 2892
ORDER BY B.SGUSRCOD;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------portal
SELECT *FROM PORTAL.TPLROL;
SELECT *FROM PORTAL.TPLFNC;
SELECT *FROM PORTAL.TPLOBJF;
SELECT *FROM PORTAL.TPLURL;
SELECT *FROM PORTAL.TPLFNR;
SELECT *FROM PORTAL.TPLROL Where ROLNOM ='ADMINISTRADOR';
SELECT *FROM PORTAL.TPLFNC;
SELECT *FROM PORTAL.TPLOBJF;
SELECT *FROM PORTAL.TPLURL WHERE USERID = 'ADMINISTRA';
SELECT *FROM PORTAL.TPLFNR WHERE ROLID =1;
SELECT *FROM LOGIN.TPLMEN WHERE MENUITEMID BETWEEN 1 AND 17;
----------------------------------------------------------------------------------------------------------------
/*ajuste de saldo waled no facturado redmine41832*/
update gxbdbps.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa) where MCEMISO='176';
update gxbdbps.tmctaaf set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe) where MCEMISO='176';

update gxbdbps.tmctaaf set mcsfnve=917881    where mcnumct=40050000011;
update gxbdbps.tmctaaf set mcsfnve=579325    where mcnumct=40050000013;
------------------------------------------------------------------------------------------
/*CIERRE ENTIDADES PREPAGA*/
select * from gxbdbps.tcieraf where ENEMISO in ('153','164','168','176','178','181','179','183') and AFFECIE='20230102';
--Sentencia de actualizacion.
UPDATE GXBDBPS.TCIERAF
SET AFFECIE = '20221215', AFFEVTO = '20221216'
where ENEMISO in ('153','164','168','176','178','181','179','183') and AFFECIE='20230102';

INSERT INTO GXBDBPS.TCIERAF (  ENEMISO,  BIBINES,  AFAFINI,  AFFECIE,  AFFEVTO,  AFULTSC)
VALUES(  '168',  '627431',  '001',  '20221215',  '20221216',  1);

INSERT INTO GXBDBPS.TCIERAF(  ENEMISO,  BIBINES,  AFAFINI,  AFFECIE,  AFFEVTO,  AFULTSC)
VALUES(  '181',  '627431',  '001',  '20221215',  '20221216',  1);

UPDATE GXBDBPS.TMENSAF   SET AFFECIE = '20221215'
where ENEMISO in ('153','164','168','176','178','181','179','183') and AFFECIE='20230102';

INSERT INTO GXBDBPS.TMENSAF(  ENEMISO,  BIBINES,  AFAFINI,  AFFECIE,  MESECUE,  MELINEA)
VALUES(  '181',  '627431',  '001',  '20230102',  1,  ' ');

INSERT INTO GXBDBPS.TMENSAF (  ENEMISO,  BIBINES,  AFAFINI,  AFFECIE,  MESECUE,  MELINEA)
VALUES (  '168',  '627431',  '001',  '20230102',  1,  ' ');
--------------------------------------------------------------------------------------------
/*CAMBIO DE TASA % PARA LA REFINANCIACION - SISTEMA DE REINGENIERIA*/
UPDATE GXTRJDTA.TDGAMC
   SET AMCTASMAX = 16.80
WHERE ENTCODENT = 1020 AND   AFICODAFI = 507 AND   MONIDMONED = 600 AND   TCAIDTCARG = 63 AND   AMCSECUE = 1;
--------------------------------------------------------------------------------------------
--portal
SELECT * FROM GXWEB.drcon180 WHERE ALIDCOM=100267 AND ALFECTR BETWEEN '20230101' AND '20230109';
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LIDCOM=100267 AND LFECTR BETWEEN '20230101' AND '20230109';
SELECT * FROM GXWEB.GXLOUSU WHERE USUAID='2937900';--usuario
SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD='10147';--detalle usuario
--------------------------------------------------------------------------------------------
/*Tareas #44785  BASE DE DATOS PARA ALTA DE PROVEEDORES COMERCIOS*/
SELECT B.CLICLICOD, B.SUCSUCCOD, A.CLIRAZSOC, A.CLIRUC, B.SUCCORREO, d.COCOMER, D.ENEMISO BANCO, ENNOMBR B_NOMBRE, d.ADNUMCTA cuenta, d.ADTICTA tipocuenta, B.SUCDIRECC
FROM GXFINDTA.TCMCLI A
JOIN GXFINDTA.TCMSUC B ON A.CLICLICOD = B.CLICLICOD
JOIN GXFINDTA.TCOCNA C ON C.CLICLICOD = B.CLICLICOD AND C.SUCSUCCOD = B.SUCSUCCOD
join GXBDBPS.COMAEAF d ON D.COCOMER = C.cocomer
JOIN gxbdbps.Gentiaf E ON D.ENEMISO = E.ENEMISO
WHERE SUBSTRING(C.COCOMER, 1, 2) < '79' OR SUBSTRING(C.COCOMER, 1, 2) = '81' or SUBSTRING(c.COCOMER, 1, 2) = '86'
ORDER BY B.CLICLICOD ASC, B.SUCSUCCOD ASC;
--1-caja de ahorro
--0-cta corriente.
---------------------------------------------------------------------------------------------
SELECT * from GXFINDTA.TCOCNA COCOMER
SUBSTRING(COCOMER, 1, 2) < '79';
SUBSTRING(COCOMER, 1, 2) = '81';
SUBSTRING(COCOMER, 1, 2) = '86';
SELECT * FROM
GXBDBPS.COMAEAF;
----------------------------------------------------------------------------------------------
Select * from gxbdbps.corubaf;-- Lista de Rubros
Select * from gxbdbps.Gentiaf;-- Entidades
--Actualiza datos del comercio COMAEAF
Select TIPACODI,ENEMISO,ENEMISO,ADNUMCTA,CONOCTA from gxbdbps.comaeaf where cocomer in ('0705742','8106656','8606099');
Update gxbdbps.comaeaf set TIPACODI = '3', ENEMISO = '146' ,ADTICTA = 1 , ADNUMCTA = '6274311460201681' ,CONOCTA = 'MARCELINO ALVAREZ SOSA' where cocomer in ('0705742','8106656','8606099');
--Actualiza datos del titular TCODPP
Select DPPTDC,DPPNDC,DPPNYA from gxbdbps.tcodpp where cocomer in ('0705742','8106656','8606099');
Update gxbdbps.tcodpp set DPPTDC = 'CI' ,DPPNDC = '2147311', DPPNYA = 'MARCELINO ALVAREZ SOSA' where cocomer in ('0705742','8106656','8606099');
/*Descripción Campo — [Valor por defecto Obs
  COMAEAF
TIPO DE PAGO: TARJETA PREPAGA [TIPACODI 3|Tarjeta prepaga
ENTIDAD PAGADORA: BEPSA PAGO COMERCIOS ENEMISO Depende del valor que esta en el redmine
TIPO DE CTA: CAJA AHORRO 'ADTICTA |(0)Cta Corriente/(1)C Ahorro
CTA. COMERCIO: 6274311460201681 'ADNUMCTA Depende del valor que esta en el redmine
NOMRBE DE CTA: MARCELINO ALVAREZ SOSA CONOCTA Depende del valor que esta en el redmine
      TCODPP
TIPO DE DOCUMENTO: CEDULA DE IDENTIDAD DPPTDC RUC/CI Depende del valor que esta en el redmine
NRO DE DOCUMENTO: 2147311 DPPNDC Depende del valor que esta en el redmine
NOMBRE Y APELLIDO: MARCELINO ALVAREZ SOSA |DPPNYA Depende del valor que esta en el redmine*/
--------------------------------------------
--codigo de procesadora
select COCOMER, COPRSEC2, PRCODI, COPRCODI from GXBDBPS.COMA1AF  where COCOMER='6001163';

INSERT INTO GXBDBPS.COMA1AF
(COCOMER, COPRSEC2, PRCODI, COPRCODI)
VALUES('6001163', 1, '512', '269193');

INSERT INTO GXBDBPS.COMA1AF
(COCOMER, COPRSEC2, PRCODI, COPRCODI)
VALUES('6001163', 2, '508', '13300363224');
-----------------------------------------------------------------------------
----rubros
SELECT * FROM GXBDBPS.CORUBAF WHERE RUCODI='29';
UPDATE GXBDBPS.CORUBAF T
   SET T.RUDESC = 'UTILIDADES ELECTRICIDAD AGUA GAS',
       T.RUTRCC = 'R'
 WHERE T.RUCODI LIKE '29';
SELECT * FROM GXFINDTA.TCMRUB t ; --- el campo de MCC del rubro es MCCCODIGO
SELECT * FROM GXFINDTA.TCMMCC t ; --- el campo de TCC es MCCTCC
-----------------------------------------------------------------------------
/*para generar reporte de saldo de entidad credimax*/
select cuenta,mcdisco+mcdiscu disponible_actual,MCSTATS,sum(sumatoria) disponible_real from (
select hmnumct cuenta, sum(hmimpo2) sumatoria
from gxbdbps.thmovaf where hmemiso='164' and HMCODIG in ('515','510','529','501') and hmcodre='00'
group by hmnumct
union
select hmnumct cuenta, sum(hmimpo2*-1) sumatoria
from gxbdbps.thmovaf where hmemiso='164' and HMCODIG in ('002','010','005','020','070','090','001','060','040') and hmcodre='00' --and HMORIGE<>'A'
group by hmnumct
union
select mvnumct cuenta, sum(MVIMPO2) sumatoria
from gxbdbps.tmoviaf where mvemiso='164' and CMCODIG in ('515','510','529','501') and mvcodre='00'
group by mvnumct
union
select mvnumct cuenta, sum(MVIMPO2*-1) sumatoria
from gxbdbps.tmoviaf where mvemiso='164' and CMCODIG in ('002','010','005','020','070','090','001','060','040') and mvcodre='00' --and MVORIGE<>'A'
group by mvnumct
)
inner join
gxbdbps.tmctaaf on cuenta=mcnumct
group by cuenta,mcdisco+mcdiscu,MCSTATS;
----
--Ajuste Fecha de emision de tarjetas migradas enviadas en el pbtarjeta banco continental
UPDATE GXBDBPS.TMTARAF x
SET (MTFEPED) = (
SELECT t.TJTFECEMI
FROM GXBDBPS.TMTARAF s INNER JOIN GXTRJDTA.TMITJT t ON trim(t.TJTNROTJT)= trim(s.MTNUMTA) AND SUBSTRING(CAST(s.AFAFINI+1000 AS char(4)),2,3) = s.AFAFINI
WHERE t.TJTCODAFI IN (2,5,6,10,11,100,32,35,37,44,46,91,126)
AND CASE WHEN s.MTFEPED = t.TJTFECEMI THEN 'IGUALES' ELSE 'APLICAR REPAIR' END = 'APLICAR REPAIR' AND s.MTNUMTA = x.MTNUMTA)
WHERE x.MTNUMTA IN (SELECT s.MTNUMTA
FROM GXBDBPS.TMTARAF s INNER JOIN GXTRJDTA.TMITJT t ON trim(t.TJTNROTJT)= trim(s.MTNUMTA) AND SUBSTRING(CAST(s.AFAFINI+1000 AS char(4)),2,3) = s.AFAFINI
WHERE t.TJTCODAFI IN (2,5,6,10,11,100,32,35,37,44,46,91,126)
AND CASE WHEN s.MTFEPED = t.TJTFECEMI THEN 'IGUALES' ELSE 'APLICAR REPAIR' END = 'APLICAR REPAIR');

UPDATE GXTRJDTA.TTCTRJ w SET
(TRJFECEMI, TRJUSULTUP ,TRJFHULTUP ) = (SELECT t.TJTFECEMI, 'MIGRABAU', CURRENT timestamp
FROM GXTRJDTA.TTCTRJ x INNER JOIN GXTRJDTA.TMITJT t ON trim(t.TJTNROTJT)= trim(x.TRJNROTRJ) AND t.TJTCODAFI= x.TRJCODAFI
WHERE t.TJTCODAFI IN (2,5,6,10,11,100,32,35,37,44,46,91,126)
AND CASE WHEN x.TRJFECEMI = t.TJTFECEMI THEN 'IGUALES' ELSE 'APLICAR REPAIR' END = 'APLICAR REPAIR' AND x.TRJNROTRJ = w.TRJNROTRJ)
WHERE w.TRJNROTRJ IN (SELECT  x.TRJNROTRJ
FROM GXTRJDTA.TTCTRJ x INNER JOIN GXTRJDTA.TMITJT t ON trim(t.TJTNROTJT)= trim(x.TRJNROTRJ) AND t.TJTCODAFI= x.TRJCODAFI
WHERE t.TJTCODAFI IN (2,5,6,10,11,100,32,35,37,44,46,91,126)
AND CASE WHEN x.TRJFECEMI = t.TJTFECEMI THEN 'IGUALES' ELSE 'APLICAR REPAIR' END = 'APLICAR REPAIR');

UPDATE GXTRJDTA.TCOAUX SET AUXEST = 'P' WHERE  AUXEST = 'N' AND AUXTBL = 'TMTARAF' AND AUXFEHO >= '2023-06-29 22:04:00.000' AND AUXFEHO <= '2023-06-29 22:05:00.000';
--------caso set tarea 53781 y 53852
--VISUALIZA
SELECT
A.AUTRRNBEP,'5',A.AUTCOMMCC,A.AUTMARTAR,A.AUTTIPTAR,A.AUTPROTAR,A.AUTCODSER,A.AUTCODPRE,A.AUTMONTORI,A.AUTCOMRAZ,A.AUTMONTCOT,
A.AUTMONTDES,A.AUTMONTDES,A.AUTPAISORI,B.PAIISOALF2,B.PAIDSPAIS,A.AUTMONORI,A.AUTENTROL,C.PERNRODOC,C.CADNOMPLAS,'P',
    CURRENT USER,
    A.AUTTRXFCHF,
    VARCHAR_FORMAT(CURRENT TIMESTAMP,'YYYYMMDD'),
    ROUND(A.AUTMONTDES*0.1),
    ROUND(A.AUTMONTDES*0.1),
    0
FROM GXBDBPS.TSWAUT A
    INNER JOIN GXTRJDTA.TDGPAI B
        ON B.PAIIDPAIS = A.AUTPAISORI
    INNER JOIN GXTRJDTA.TTDCAD C
        ON C.CDBIDCTA = A.AUTCTAOPE
        AND C.CADADHERE = A.AUTPANADH
        AND C.CDBCODENT = SUBSTR(A.AUTENTROL,1,4)
WHERE A.AUTCOMMCC
        IN    ('4814','4816','4899','5734','5735','5815','5816','5817','5818','5968','7311','7372','7399','7829','7994','7995','8220','8244','8249','8299')
    AND A.AUTPAISORI <> 600
    AND A.AUTTIPTAR IN('D')
    AND A.AUTTRXESTF = 'A'
    AND A.AUTCODRET = '00'
    AND A.AUTTRXFCHF BETWEEN '20230601' AND '20230630'
    AND A.AUTMONTDES > 0
    AND A.AUTRRNBEP NOT IN(SELECT SETRRNBEP FROM GXFINDTA.TCLSET);

--INSERTA EN TCLSET PARA BANCO CONTINENTAL
INSERT INTO GXFINDTA.TCLSET (SETRRNBEP,SETIMPCOD,SETCODMCC,SETMARCA,SETTIPTAR,SETPROTAR,SETCODSER,SETCODPRE,SETMONTO,SETRZNPRV,SETCTZAUT,
SETLImpIn,SETMBRUTO,SETMOVPAI,SETMVCOPA,SETMVDSPA,SETMDAORI,SETCODEM,SETCICLIE,SETNOMPLA,SETRETSTA,SETUSUAC,SETFECPRO,SETFECAC,SETMRETEN,SETIMPIVA,SETIMPREN)
SELECT
A.AUTRRNBEP,'5',A.AUTCOMMCC,A.AUTMARTAR,A.AUTTIPTAR,A.AUTPROTAR,A.AUTCODSER,A.AUTCODPRE,A.AUTMONTORI,A.AUTCOMRAZ,
A.AUTMONTCOT,A.AUTMONTDES,A.AUTMONTDES,A.AUTPAISORI,B.PAIISOALF2,B.PAIDSPAIS,A.AUTMONORI,A.AUTENTROL,C.PERNRODOC,C.CADNOMPLAS,'P',
    CURRENT USER,
    A.AUTTRXFCHF,
    VARCHAR_FORMAT(CURRENT TIMESTAMP,'YYYYMMDD'),
    ROUND(A.AUTMONTDES*0.1),
    ROUND(A.AUTMONTDES*0.1),
    0
FROM GXBDBPS.TSWAUT A
    INNER JOIN GXTRJDTA.TDGPAI B
        ON B.PAIIDPAIS = A.AUTPAISORI
    INNER JOIN GXTRJDTA.TTDCAD C
        ON C.CDBIDCTA = A.AUTCTAOPE
        AND C.CADADHERE = A.AUTPANADH
        AND C.CDBCODENT = SUBSTR(A.AUTENTROL,1,4)
WHERE A.AUTCOMMCC
        IN    ('4814','4816','4899','5734','5735','5815','5816','5817','5818','5968','7311','7372','7399','7829','7994','7995','8220','8244','8249','8299')
    AND A.AUTPAISORI <> 600 --para dijitales tiene que ser distinto a 600
    AND A.AUTTIPTAR IN('D')
    AND A.AUTTRXESTF = 'A'
    AND A.AUTCODRET = '00'
    AND A.AUTTRXFCHF BETWEEN '20230601' AND '20230630'
    AND A.AUTMONTDES > 0
    AND A.AUTRRNBEP NOT IN(SELECT SETRRNBEP FROM GXFINDTA.TCLSET);
