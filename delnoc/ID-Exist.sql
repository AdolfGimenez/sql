---Aldo Ayala
SELECT *
FROM GXFINDTA.TCLTSB
WHERE DATE (TSBFEGE) = '2022-08-03'
AND TSBCOME NOT IN ('002')
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE '

SELECT TSBCOME,
TSBDEME
 FROM GXFINDTA.TCLTSB
WHERE DATE(TSBFEGE) = '2022-08-13' GROUP BY TSBCOME,
TSBDEME

--Aldo Ayala
SELECT PFDVALCHR1 AS TSBCOME FROM  GXFINDTA.ITCLPFD WHERE PFDIDGRUP = 'RTNDTLITEM';
************************************************************************************************************************
----tabla de codigos retorno trasmisiones
SELECT * FROM GXFINDTA.TDSCOE
Select coecodent,coecodein, COEEINDES, COEESTADO from gxfindta.tdscoe where COECODENT = 1020;
************************************************************************************************************************
---verificación
SELECT * --TSBIDOP
FROM gxfindta.TCLTSB
WHERE DATE (TSBFEGE) in( '2022-08-09')--,'2022-06-20', '2022-06-28', '2022-06-30', '2022-07-03', '2022-07-04', '2022-08-09')
AND TSBCOME = '040'
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE '
and tsbidop IN (
4365561,
4365560,
4365607,
);
-----------------------------------------------------------Pasar a Anulado
/*Controla estado de trx*/
Select * from gxfindta.tcltsb where tsbnref in (  
'222560204500115',
'222560204500127')

/*Se anula como se solicita*/
UPDATE gxfindta.tcltsb
   SET tsbesta = 'AN',
       tsbdeme = 'ANULADO',
       tsbmotivo = 'P.MANUALMENTE-#37638'
WHERE tsbnref IN ('222560204500115','222560204500127');
-----------------------------------------------------------------------------------
--pasar a pendiente para reintento ya que según estracto no aparece como acreditado.!
UPDATE gxfindta.tcltsb
   SET tsbesta = 'PE',
       tsbmotivo = 'Redmine#37080 - 20220905'
WHERE tsbesta = 'AC'
AND   tsbcome = '002'
AND   tsbidop IN (
4368635
);
-------verificar por fechas
SELECT DATE (TSBFEGE),TSBESTA,TSBDEME,count(*)
FROM gxfindta.TCLTSB
WHERE DATE (TSBFEGE) >= '2022-07-27'
and TSBCOME = '040'
Group by DATE (TSBFEGE),TSBESTA,TSBDEME;

--lsito si es gnb por paquete de 25
--updates para pasar a pendientes y que se reintenten
UPDATE gxfindta.tcltsb
   SET tsbesta = 'PE',
       tsbmotivo = 'REINTENTO NROR #35953 - 20220808'
WHERE DATE (TSBFEGE) in( '2022-08-06', '2022-08-07')
AND TSBCOME = '040' 
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE '
and  tsbidop IN (
4292944,
4298630,
4297574,
4292432)

-------update para pasar a acreditados
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'AC',
       TSBCOME   = '002',
       TSBDEME   = 'ACREDITADO',
       TSBMOTIVO = 'REDMINE#36003'
WHERE DATE (TSBFEGE) in( '2022-08-09')--, '2022-08-07')
AND TSBCOME = '040'
--and TSBESTA <> 'PE' -- de forma masiva
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE '
and   tsbidop IN (
4327098,
4327097
);
