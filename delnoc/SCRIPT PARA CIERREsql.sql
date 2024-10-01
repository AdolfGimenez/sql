/*******************************__COMANDO PARA RESTAURAR LOS DATOS__*****************************************

RSTOBJ OBJ(*ALL) SAVLIB(GXBDBPS) DEV(*SAVF) SAVF(VICTORLIB/BKTRJ09231) MBROPT(*ALL) STRJRN(*NO) ALWOBJDIF(*ALL) RSTLIB(cierrelib) RSTASPDEV(IASP1)

RSTOBJ OBJ(*ALL) SAVLIB(GXBDBPS) DEV(*SAVF) SAVF(VICTORLIB/BKTRJ10171) MBROPT(*ALL) STRJRN(*NO) ALWOBJDIF(*ALL) RSTLIB(cierrelib) RSTASPDEV(IASP1)

EN RESTAURAR EN DISPOSITIVO ASP PONER --> IASP1

******************************__CODIGO DE ENTIDADES MAS UTILIZADAS__*****************************************

BNF ----------------> 002 , 347
CONTINENTAL --------> 021
PATROL--------------> 354  */  

--**************CAMBIAMOS LA FECHA DE AFFECIE A LA FECHA QUE QUEREMOS CORRER EL CIERRE*******************--

select * from cierrelib.tcieraf WHERE ENEMISO IN('021') ORDER BY AFFECIE DESC; 

                                                                                                                                       
--**************VERIFICAR LA ENTIDAD Y QUE NO HAYA OTRA ENTIDAD QUE QUIERO*******************************--

select * from cierrelib.tcieraf where enemiso in('021','354','002','307','347') AND AFFECIE='20221017';
SELECT * from cierrelib.tcieraf WHERE AFFECIE='20221017';

--**************FIJARME QUE ESTE VACIO EN LA FECHA QUE QUIERO PROBAR*********************--

select * FROM cierrelib.TSPCIE WHERE PCFCH = '20221017' ORDER BY PROCCOD, SUBSEC;

select * FROM cierrelib.TPCIE WHERE PCFCH ='20221017';

SELECT  * FROM CIERRELIB.PRENUM; --BORRAR ANTES DE CORRER EL CIERRE

delete FROM CIERRELIB.prenum WHERE PREFCHA <'20221012' ;

--***LA FECHA EMFEPRO DEBE DE SER LA FECHA QUE QUIERO, LA FECHA EMFEANT EL ANTERIOR DIA HABIL Y LA FEHA EMFESIG EL DIA HABIL POSTERIOR**--

select * from cierrelib.GEMPRAF;


---***************************************BORRAR LA FECHA DEL BACKUP SI ES QUE YA CORRI**********************************************---

SELECT count(*) FROM cierrelib.tmpnum WHERE NUMFCH = '20221017';

DELETE  FROM CIERRELIB.TMPNUM WHERE  NUMFCH='20221012';


--*************************SE CORTA EL CIERRE Y EJECUTAMOS ESTE COMANDO**********************************--

UPDATE cierrelib.TSPCIE
SET SUBEST = 'S'
WHERE PCFCH = '20221017' --VERIFICAR LA FECHA
AND PROCCOD = 'PRPARTE1 '
AND SUBPRC = 'TIPOPROCESO ';

UPDATE cierrelib.TSPCIE
SET SUBEST = 'S'
WHERE PCFCH = '20221017' --VERIFICAR LA FECHA
AND PROCCOD = 'PRPARTE1 '
AND SUBPRC = 'JOURNAL ';

UPDATE cierrelib.TSPCIE
SET SUBEST = 'S'
WHERE PCFCH = '20221017' --VERIFICAR LA FECHA
AND PROCCOD = 'PRPOSTCIERRE'
AND SUBPRC = 'BKP-POST ';

--**********************************PARA VERIFICAR EN QUE PROCESO SE ENCUENTRA*************************************--

select *from cierrelib.tlogsaf where LSFECHA = '20221018' order by LSSECUE DESC;

select *from cierrelib.tlogsaf where LSFECHA = '20221018' order by LSSECUE ASC;

--**********************************PARA VER CUALES PROCESOS FALTAN O YA PASARON (N O S)*************************************--

select * from cierrelib.TSPCie where pcfch='20221012' and subest='N' order by PROCCOD, SUBSEC;
select * from cierrelib.TSPCie where pcfch='20220825' AND ProcCod = 'PRPINFOCIE' AND SubPrC = 'PRPINFOCIEX';

--***********Cambiar la fecha de especial a *NORMAL si es que sale que el proceso de cierre esta ejecutandose*********--

select * from cierrelib.gcontrp;

select * from gxbdbps.gcontrp;
