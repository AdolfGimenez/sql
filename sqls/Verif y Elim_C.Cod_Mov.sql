SELECT * FROM GXOPERA.TRXINST WHERE INSFECARGA='20230403';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.TRXINST where insPGENTID = '19794';
DELETE FROM GXOPERA.TRXINST where insPGENTID= '19794';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM WHERE LINRO ='19794';--WHERE LICOMER = '1302527' and LIFECHD='20220908';
delete FROM GXOPERA.FLICOM WHERE LINRO ='19794';  --where LICOMER = '1302527' and LIFECHD='20220908';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM1 WHERE LINROINS ='19794'; --WHERE LICOMER = '1302527' and LIFECHD='20220908';
delete from GXOPERA.FLICOM1 WHERE LINROINS ='19794';--WHERE LICOMER = '1302527' and LIFECHD='20220908';
----------------------------------------------------------------------------------------------
SELECT sum(INSFACTOT) FROM GXOPERA.TRXINST where insPGENTID = '19794';
SELECT sum(LIMONTO) FROM GXOPERA.FLICOM1 WHERE LINROINS ='19794';

-- si es bnf tambien ver
SELECT * FROM GXOPERA.OPAGO0P; --where PGUSER='U99KATERIN' PGCOME in('0702938','6900334')
SELECT * FROM GXOPERA.OPAGO1P; --where PGCOMER in('0701172','0701857','0702620','0702629','0702802')
--DELETE FROM GXOPERA.OPAGO1P;--WHERE PGCODMV IN ('459','959') AND PGIDUSR='U99TANIAA';
SELECT * FROM libdebito.OPAGO2P;-- where DTPGIDUSR='U99KATERIN', AND PGCOMER in('0703722', '8603396')
SELECT * FROM GXOPERA.OPAGO3p;
SELECT * FROM GXOPERA.OPAGO3tc;
SELECT * FROM GXOPERA.OPAGO1PHIS WHERE PGIDUSR='U99KATERIN' AND PGFECOM='20230530';
SELECT * FROM GXOPERA.COPAEN2PHS WHERE BNFIDUSR='U99KATERIN';
---------------------------------------------------------------------------------------------------------------------------
--------------ELIMINACION DE REGISTRO POR VENTA DE MINUTOS
SELECT * FROM GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' and CTANROBOL ='60323' --AND CTAFECHA='20221223' AND CTANRAS='12569';
and CTAMONTO='581000';

DELETE FROM GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' and CTANROBOL ='60323' --AND CTAFECHA='20221223' AND CTANRAS='12569';
and CTAMONTO='581000';
---------------------------------------------------------------------------------------------------------------------------
------CAMBIO DE COD. MOVIMIENTO Y MENSAJE DE REINTEGROS / CAMBIO DE COD. MOVIMIENTO #37549
select * from GXBDBPS.tdmov where MOVFECTR>='20220913' and MOVIMPORTE='62500.00';

select * from gxbdbps.tmoviaf where --MVIDUSR='U99IVANE' AND
MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569');--and CMCODIG='099' AND MVEMISO='021'

UPDATE gxbdbps.tmoviaf SET CMCODIG='016', MVNOMCO='DEBITO SALDO A FACTURAR' WHERE MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569');

update gxbdbps.tmoviaf set MVNOMCO='CREDITO PROMOCION-CONTI DESCUENTOS'
where MVIDUSR='U99IVANE' AND MVFEPRO='20220830' AND MVEMISO='021';
---------------------------------------------------------------------------------------------------------------------------
--------cambio de fecha de recibo--/*anulacion de recibo*/
select * from gxopera.fcobros where /*COMNRO='10030075009' AND*/ COMRECNRO='140114'; --and COMCOMER='7300018';

--DELETE FROM GXOPERA.FCOBROS WHERE COMRECNRO='1194770';--obs: para eliminar recibmos hay que ajustar las fact. relacionadas al recibo, poner en P, y ajustar los saldos
update gxopera.fcobros set COMSTATUS='P', COMFEREAL='20220913' where COMRECNRO='0138623';
----------pantalla de impresión de recibos
SELECT * FROM GXOPERA.RECIBOS WHERE RID='1194778' AND RCONCEPT like'%10030021458%';/*AND RFECH='20230106' AND RID='140101';*/ --Can. Fact. Nº 10030064913(05/12/22) y Can. Fact. Nº 10030080018(06/01/23)#
select * from gxopera.recibos where RTOTFACT='50000.00' and RFECH='20220919';
select * from gxopera.RECIBO where COMIMPOR='50000.00';
--facturas     /*si se ponde en P hay que ajustar el SALDO == que la FACTURA TOTAL
Select * from gxopera.factura where FACTNRO = 10030017315  and FACLIEN = '0704089';
update gxopera.factura set FACSTATUS='P', FACSALDO=FACTOTAL where FACTNRO ='10030082959'and faclien='7300018';
--para igualar factura y recibo tiene que estar igual el timbrado y el comercio de la factura al recibo
Select * from gxopera.factura where FACTNRO = 10030052993;
select * from gxopera.fcobros where /*COMNRO='10030052266' AND*/ COMRECNRO='1091051';
/*custodio-talonario*/
SELECT * FROM GXOPERA.CUSTOS;--cabezara
SELECT * FROM GXOPERA.CUSTODE WHERE CUSTOREC='140116' AND CUSTOUSRD='U99LUCIA';-- AND CUSTOFCHD='20230306' -- detalle
UPDATE GXOPERA.CUSTODE T SET T.CUSTOEST = 'P',T.CUSTOMOT = 'Pendiente'WHERE CUSTOREC='140114'; --dejar en pendiente para volver a usar
--para pasar a cerrado los custorios de talonarios.
SELECT * FROM GXOPERA.CUSTOS WHERE TALOID='47';
UPDATE GXOPERA.CUSTOS C2 SET CUSTOCAN='1', CUSTODEV='20230504' WHERE CUSTOID='51' AND TALOID=47;
SELECT * FROM GXOPERA.TALONA T WHERE TALODESDE>='138601' AND TALOHASTA='138650';

DELETE FROM GXOPERA.CUSTODE WHERE CUSTOUSRD='U99LUCIA' AND CUSTOREC='140371';
SELECT * FROM GXOPERA.CUSTODE WHERE CUSTOREC>='140370';
-----------------------------------------------------
SELECT * FROM GXOPERA.FACTURA1;
SELECT * FROM GXOPERA.FACTURA2;
SELECT * FROM GXOPERA.FACTURAAN;
SELECT * FROM GXOPERA.FACTURAJ;
SELECT * FROM GXOPERA.FACTURAL1;
SELECT * FROM GXOPERA.FACTURAZ;
------------------------------------------------------------------------------------------------
----cambio de zona.
select * from GXBDBPS.COMAEAF where COCOMER IN ('8101211','8600618');
UPDATE GXBDBPS.COMAEAF SET ZONACODI ='34' WHERE COCOMER IN ('8101211','8600618');
UPDATE GXBDBPS.COMAEAF SET ZONACODI='03', COCHZONA='03' WHERE COCOMER='0100037';
-------------------------------------------------------------------------------------------------
--marca excedido
select * from gxbdbps.tmtaraf where MCNUMCT='020120500143';
update gxbdbps.tmtaraf set MTESTEX='' where MCNUMCT='020120500143';
-------------------------------------------------------------------------------------------------
----rendición
select * from GXOPERA.FCOBROS where COMNRORND='22943' AND COMCOMER IN ('0802083','0802316');

UPDATE GXOPERA.FCOBROS SET COMFECHA = '00000000', COMNROASI = 0, COMNRORND = 0, COMFECRND = '00000000'
where COMNRORND='20586';

DELETE FROM GXOPERA.FCOBROS where COMNRORND='22734';
--PARA BANCO DE RENDICION
SELECT * FROM CONTABILID.TATGENE WHERE TGENTI='064';
-------------------------------------------------------------------------------------------------
/*no puede trasaccionar con cico*/
INSERT INTO gxweb.BST015W
(  BS15CODPRO,  BS15CODCOM,  BS15ESTADO,  BS15MONLIM,  BS15FECLIM,  BS15MONSAL,  BS15PORGIR,  BS15USUUPD,  BS15FHOUPD)
VALUES
(  'CICOMONEY ',  '0702508', 'A', 0.00,  20221025,  414000.00,  0.05,  'U99KEVINF ',  '2022-10-25 11:58:27.000');
update gxweb.BST015W set  BS15CODCOM ='     0702508' where BS15CODCOM='0702508';
------------------------------------------------------------------------------------------------
--modificar el costo de alquiler DE POS
SELECT * FROM GXBDBPS.COAFMAF WHERE AFCOMER='1900404';
UPDATE GXBDBPS.COAFMAF SET AFMONTO =90909 WHERE AFCOMER = '1900404';
------------------------------------------------------------------------------------------------
--usuario sin comercio portal
SELECT a.USUCOD USU_COD, a.USUAID USUARIO, USUNOM NOMBRE, a.TUSRID TIPO,a.USUADM ADMIN,a.USUCORUC RUC, USUUAL USUARIO_ALTA, USUFAL FECHA_ALTA
from gxweb.gxlousu a
where a.TUSRID in ('1','9')
and a.usucod not in (select usucod from gxweb.gxlousudet)
ORDER BY USUFAL DESC;


