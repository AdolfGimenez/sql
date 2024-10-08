SELECT * FROM GXBDBPS.COMAEAF WHERE CODENO LIKE '%SUPERSEIS%';
SELECT * FROM GXBDBPS.COMAEAF WHERE CORUCN='80016096-7' AND COSTAT='0';
SELECT * FROM GXWEB.GXLOUSU WHERE USUCOD IN ('1806','2009','3430');
SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD='2009';
--DELETE FROM GXWEB.GXLOUSUDET WHERE USUCOD='1843';
--INSERT INTO GXWEB.GXLOUSUDET (USUCOD,COCOMER,CORUCN) VALUES (2009,'5800005','80021764-0');
SELECT * FROM GXOPERA.OPMOVI WHERE OPCOMER IN ('0801381') AND OPFECOM BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.FLICOM WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.FLICOM1 WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.OPRECLE WHERE RECOMER='0801381' AND REFECH BETWEEN '20210424' AND '20210429';

SELECT * FROM GXWEB.OPMOVI WHERE OPCOMER='0801381' AND OPFECOM BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.FLICOM WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.FLICOM1 WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.OPRECLE WHERE RECOMER='0801381' AND REFECH BETWEEN '20210424' AND '20210429';

SELECT * FROM GXWEB.OPMOVI WHERE OPNOREF IN ('111455506987','111956910957','111956880525','111856385481')

INSERT INTO GXWEB.GXLOUSUDET (USUCOD,COCOMER,CORUCN) VALUES (2009,'0701125',NULL);

SELECT * FROM GXWEB.DEPCICO WHERE DEPCOM='0703307' AND DEPNROBOL='151';

SELECT * FROM LIBDEBITO.BST015 WHERE BS15CODCOM LIKE '%1000600%';
SELECT * FROM LIBDEBITO.BST021 WHERE BS21CODCOM like '%1000600%';

SELECT * FROM GXWEB.BST021W WHERE BS21CODCOM like '%1000600%';
UPDATE GXWEB.BST021W SET BS21MONSAL = 37738433.45 WHERE BS21CODPRO = 'CICOMONEY ' AND BS21CODCOM = '     1000600' AND BS21FECPRO = 20211007;


Select * from GXWEB.drcon180 where Alerrnb='125287925839'
UPDATE GXWEB.drcon180   SET ALFCOTR = 20211006,       ALESTTR = 'A' WHERE ALERRNB = '125287925839';


SELECT --*
LFCOTR FECHA_CIAL, LFECTR FECHA_REAL, LHORTR HORA, LIDCOM COD_COM, LCOMTR COMERCIO, SUBSTR(LNRTAR,1,6) || '******' ||SUBSTR(LNRTAR,13,4) TARJETA, LCODBC MARCA, LIMPGS IMPORTE, LCUOTA CUOTA, LCRETR RETORNO,
LESTTR ESTADO, LCAUTR AUTORIZACION, LERRNB REFERENCIA, LIDTRA ID_TRX, LCODTR COD_TRX, TXDTRX TIPO_TRX, LECA62 DISPOSITIVO, LACTFJ ACT_FIJO, LCORED RED, LCOTEL LINEA_ORIGEN, LNTOKE LINEA_DESTINO, LCTADE ID_TIGO, LENEMI EMISOR, COMADRE
FROM LIBDEBITO.DRCONBEP
INNER JOIN LIBDEBITO.TBCTRA0P ON (TXCTRX=LCODTR)
INNER JOIN GXBDBPS.COMAEAF ON CAST (COCOMER AS INTEGER) = LIDCOM
WHERE COMADRE='1000600' AND LFECTR='20211008' AND LCODTR IN ('370000','380000','390000')
ORDER BY LFECTR DESC, LHORTR DESC;

select * from gxweb.usucat where USUAIDCAT='4831042';
select * from gxweb.gxlousu where usucod='3383';
select * from gxweb.usucat where USUADMCAT='3383';

select * from libdebito.drconbep where lfectr='20211020' and lcodtr='370000' and  limpgs='150000' and lhortr between '110000' and '111000';

SELECT SUBSTR(COCOMER, 1, 2),COUNT(*) FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0' --CODENO LIKE '%RETAIL%';
GROUP BY SUBSTR(COCOMER, 1, 2);
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE COCOMER='4300009';
SELECT * FROM GXWEB.COMAEAF C2 WHERE COCOMER='4300009';
SELECT * FROM GXBDBPS.CORUBAF;

SELECT * FROM GXWEB.COMAEAF C2 WHERE TRIM(CORUCN) = '80022877-4';
SELECT * FROM GXWEB.GXLOUSU WHERE TRIM(USUCORUC) = '80000564-3';
SELECT * FROM GXWEB.GXLOUSU WHERE USUCOD='';
--SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD = 1433;
SELECT * FROM GXWEB.GXLOUSUDET WHERE COCOMER='1002363';

SELECT * FROM GXWEB.GXLOUSU G where USUAID LIKE '%49924411%';
SELECT * FROM GXWEB.GXLOPER G WHERE USUCOD='9206';

/*SELECT --FACLIEN,COUNT(*),
* FROM GXOPERA.FACTURA WHERE  FACLIEN IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND facfech BETWEEN '20230101' AND '20230203' AND FACSTATUS = 'C'
GROUP BY FACLIEN*/
SELECT F.* FROM GXWEB.FLICOM1 F1
INNER JOIN GXWEB.FLICOM F ON F1.LICOMER = F.LICOMER AND F1.LIfechH = F.LIfechH AND F1.LIfecHD = F.LIfecHD
AND F1.LICODTR = F.LICODTR
WHERE F1.LICOMER IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND F1.LIFECREDI BETWEEN '20230101' AND '20230203'
AND F.litidocu = 'LIQ' or F.litidocu = 'INS'
AND F1.litiptar = 'CRE' or F1.litiptar = 'DEB' or F1.litiptar = 'EFE'
GROUP BY F.*;

SELECT F.LICOMER,F.LINRO AS FACT_INI, F.LINROFIN AS FACT_FIN FROM GXWEB.FLICOM F
INNER JOIN GXWEB.FLICOM1 F1 ON F1.LICOMER = F.LICOMER AND F1.LIfechH = F.LIfechH AND F1.LIfecHD = F.LIfecHD
AND F1.LICODTR = F.LICODTR
WHERE F1.LICOMER IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND F1.LIFECREDI BETWEEN '20230101' AND '20230203'
AND F.litidocu = 'LIQ' or F.litidocu = 'INS'
AND F1.litiptar = 'CRE' or F1.litiptar = 'DEB' or F1.litiptar = 'EFE'
AND F1.linrofac > 100000000
GROUP BY F.LICOMER,F.LINRO, F.LINROFIN;
