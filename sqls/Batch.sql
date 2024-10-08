SELECT a.*, B.TSBIDOP,B.TSBIMPO,B.TSBDEME, ACTUAL-B.TSBIMPO  AS DIFERENCIA_NO_PAGADA FROM (
select PAGO,MOVIDLT,sum(NETO) as ACTUAL ,sum(MOVNETO) as Reingeneria from
(SELECT A.*, B.MOVIDLT,B.MOVNETO
FROM (SELECT OPNOREF,
             NETO,
             CASE
               WHEN SECCOTRX IS NULL THEN 'BATCH'
               ELSE 'OLINE'
             END AS PAGO
      FROM (SELECT A.OPNOREF, A.OPCODTRN, SUBSTR(OPTARJ, 1 , 6) AS BIN, B.ENEMISO, A.OPENEMI, (OPMONTO - OPCOMI - OPRENTA - OPREIVA) AS NETO
            FROM GXOPERA.OPMOVI AS A
              INNER JOIN GXBDBPS.COMAEAF AS B ON A.OPCOMER = B.COCOMER
            WHERE OPCOMER ='0801577' AND OPFECOM BETWEEN '20220812' AND '20221001') AS a
        LEFT JOIN gxopera.TCLSEC AS B
               ON B.SECCOTRX = OPCODTRN AND Substr (B.SECENBIN, 1 , 6) = bin AND B.SECCOBCO = A.ENEMISO AND B.SECCOEM = OPENEMI) as A
              INNER JOIN GXFINDTA.TCLMOV AS B ON A.OPNOREF = B.MOVRRNBEP)
 Group by PAGO,MOVIDLT) AS A
             LEFT JOIN GXFINDTA.TCLTSB AS B ON A.MOVIDLT = B.TSBNREF;
---------------------------------------------------------------------------------------------
Select LCODTR from libdebito.drconbep where LERRNB='301740891395';
Select * from gxopera.opmovi where opcomer='0301557' and OPFECOM ='20221228'AND opnoref = '236234920564';
Select * from gxopera.OPMOVI WHERE OPCOMER='0301557' AND OPFECOM ='20221228';
select * from gxopera.flicom1 where licomer='0301557' and LIFECREDI='20221209';
select * from gxbdbps.comaeaf where cocomer in ('8605605','8605574');
SELECT * FROM gxfindta.tcltsb where TSBNREF='960900127199'; --TSBCOCO='0301557';
select * from gxopera.opliqui where opncomer='1200178';
select* from contabilid.tatgene where tgalfa='BA';
SELECT * from GXBDBPS.TSWAUT WHERE AUTRRNBEP IN ('235732969853','236234920564');
--la transaccijon se proceso desde el menu de compras en el pos cuando si se trata de red de pago tendria que entrar  en menu diferente, por ende al pasarse como una compra se le calculo comision como compra y ademas se le pag� en linea,
---------------------------------------------------------------------------------------------
SELECT opfecom, opliqde, substr(OPTARJ, 1, 6), openemi, count(*), sum(OPMONTO - OPCOMI - OPRENTA-OPREIVA)
FROM GXOPERA.OPMOVI WHERE OPLIQDE='20221207' AND OPCOMER='0301557' --AND OPFEREA='20221207'
GROUP BY opfecom, opliqde,substr(OPTARJ, 1, 6), OPENEMI;
Select * from gxfindta.tcltsb where tsbnref in ('222800010703979'); 35356.00
---------------------------------------------------------------------------------------------
select * from GXOPERA.OPLICRE where OPCRECOM='0703127' and OPCREFLI = '20221010';
--where OPCREREF=221990010800743
------------------------------x       
-----------CORRECCION
---oplicre tabla de acreditaciones
SELECT *--MOVPGON
FROM gxfindta.tclmov WHERE MOVFTRX >='20221001' AND MOVRRNBEP IN ('222600168939','222500168345');
--AND   MOVCOMER = '0302328'
--AND   MOVIDLT = '221990010302328';
------------------------------------------------------
--para elcaso de oplicre en caso que ya est� hay diferencia se copia la refe. y el importe, y se quita el cero del comercio y se pasa al final.
--OPCREREF=221990010701237 
------------------------------------------------------      
select * from GXOPERA.OPLICRE where OPCREREF=223210010701441; --OPCRECOM=0701555 and OPCREFCOM ='20220720'
/*222020010701555
22202 -- a�o y dia juliano
001 --servicio 
0701555 -- codigo comercio*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO GXOPERA.OPLICRE
(OPCREID,OPCREREF,OPCRECOM,OPCREFLI,OPCREHLI,OPCRECBA,OPCRECTD,OPCRETCD,OPCRECTC,OPCRETCC,OPCREIMPB,OPCREIMPN,OPCRECTRX,OPCRESTAT,OPCREMEN,OPCREFCOM,OPCREFACR,OPCRECREI,OPCRENCOM,OPCREUSUA,OPCREFECH)
VALUES
(221990010800743,221990010800743,'0800743',20220718,23100,59,102184061,'K',1153870,'K',19780.00,19780.00,3,'91','Pendiente de Acreditaci�n                         ',20220718,0,1,0,CURRENT USER,'20220719');

select * from GXOPERA.OPLICRE WHERE OPCREID = 222800010703979;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----tabla de 
--se cambia el servicio por 999 y el importe en el mismo caso de mas arriba
select * from GXFINDTA.TCLIMB where IMBIDOP = 222800010703979; --and SUBSTR(IMBIDOP,9,7)=0701555;
--eliminar de imputaciones la diferencia.
delete FROM GXFINDTA.TCLIMB where IMBIDOP = 222800010703979;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from GXFINDTA.TCLIMB where SUBSTR(IMBIDOP, 9 , 7)= 0702640 and IMBFCH>='20230530';
--and IMBIDOP='221990010800743'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO GXFINDTA.TCLIMB
(IMBIDOP,IMBLOT,IMBTIP,IMBSER,IMBPRE,IMBBCO,IMBBPA,IMBSUC,IMBCLI,IMBFCH,IMBIMPN,IMBIMPB,IMBFCHC,IMBCNTO,IMBESTS,IMBUSU,IMBCDR,IMBOBS)
VALUES
(221990010800743,'2022719023100  ','CR ','PAGOCOM   ','PACO',1028,1020,2,10436,'20220718',19780.00,19780.00,'20220719',3,'PE',CURRENT USER,0,'PENDIENTE DE TRANSMISIONES');

select * from GXFINDTA.TCLIMB where IMBIDOP = 222800010703979;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT sum(IMBIMPN) FROM GXFINDTA.TCLIMB WHERE IMBFCH='20220926' and IMBESTS='PE' and IMBBCO <>'1007' AND IMBIDOP = 222690010901956;
-------------------------------------------
UPDATE GXFINDTA.TCLIMB
   SET IMBIDOP = 221999990700534
WHERE IMBIDOP = 22199999700534;
UPDATE GXFINDTA.TCLIMB
   SET IMBESTS = 'PE',
       IMBUSU = User
WHERE IMBIDOP = 221940010700694;
-------------------------------------------
UPDATE GXFINDTA.TCLIMB
SET IMBESTS = 'PE',
IMBUSU = USER
WHERE IMBIDOP = 222000010701733;
-------------------------------------------