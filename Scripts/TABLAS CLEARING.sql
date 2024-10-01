--Tabla de Autorizaciones
select COUNT(*) from gxbdbps.tswaut where  AUTTRXFCHC='20210113' AND AUTESTCLE  <>'N';
select * from gxbdbps.tswaut where  AUTTRXFCHC='20210113'; --and AUTCODSER='PAGFAC' AND AUTCODPRE='PFTA';

update gxbdbps.tswaut set AUTESTCLE = 'P' where  AUTTRXFCHC='20210113' AND AUTESTCLE = 'C' ;--//and AUTCODSER='PAGFAC' AND AUTCODPRE='PFTA'

--Tabla de fecha
select * from GXFINDTA.TCLFEC;
--UPDATE GXFINDTA.TCLFEC SET FECANT = '20200903',FECPRO = '20210113',FECSIG = '20200907' WHERE FECID = '002';

--Tablas de procesos
select * from GXFINDTA.TCLCSP where cpcfec='20210113'; --detalle
delete from GXFINDTA.tclcsp where cpcfec='20210113';
select * from GXFINDTA.TCLCPC where cpcfec='20210113'; --Cabecera
delete from GXFINDTA.TCLCPC where cpcfec='20210113';

--Tabla Temporal
select * FROM GXFINDTA.TCLTPC WHERE TPCFPRO='20210113';
DELETE FROM GXFINDTA.TCLTPC WHERE TPCFPRO='20210113';

--Tabla Movimientos
SELECT  * from GXFINDTA.TCLMOV WHERE MOVFPRO  ='20210113' AND SERCODI = 'REDPAG '; 

SELECT  * from GXFINDTA.TCLMOVWHERE    MOVFPRO='20210113'; 
DELETE  GXFINDTA.TCLMOd;



--Cabecera
select * from GXFINDTA.tclmod where movidmov in (3842739,3842741) --detalle

SELECT * FROM GXFINDTA.CCASI21 ;

SELECT * FROM  GXTRJDTA.TDGECO  WHERE ENSIDSERV='COMPRA'; SET ECOIVAINCL='N'

  GXTRJDTA.TDGECO WHERE ENTCODENT=1020; SET ECOVALCOMI=0.73

SELECT * FROM gxfindta.tclprc where prcparm in ('CAIN','CAOU','GIRO');  SET PRCCOD = 'PCLR054'



select T.ecccderrcc ,E.ECCDSERRCC ,T.TPCESCLE, count(*)FROM
GXFINDTA.TCLTPC T INNER JOIN GXFINDTA.tclecc E
ON T.ecccderrcc = E.ecccderrcc
where T.TPCFPRO='20210113' group by
 T.ecccderrcc, T.TPCESCLE,E.ECCDSERRCC ;
 

SELECT * FROM GXTRJDTA.TDGTSA; 


SELECT * FROM GXTRJDTA.TMOMEP;


SELECT  * from LIBCLEA.TCLMOV WHERE MOVFPRO  ='20210113' AND SERCODI = 'DINEFE'; 








