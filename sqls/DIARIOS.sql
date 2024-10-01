--231290010802051--lote anulado para no pagar
--------------------------------------------------------------------------
select mcdisco saldo,  mcnumta tarjeta,   T.* from gxbdbps.tmctaaf T where mcnumta='6274311550006321';
select * from CONTABILID.SJ90LIQ WHERE LINOMB LIKE '%JOEL%';
--------------------------------------------------------------------------
SELECT opfecom,   opliqde,   substr(OPTARJ, 1, 6),   openemi,   count(*),   sum(OPMONTO - OPCOMI - OPRENTA-OPREIVA)
FROM GXOPERA.OPMOVI WHERE OPLIQDE='20230508' AND OPCOMER='0703127' AND OPSTATUS='A'
GROUP BY opfecom,   opliqde,  substr(OPTARJ, 1, 6),   OPENEMI;
--------------------------------------
SELECT * FROM GXFINDTA.TCLMOV T WHERE MOVRRNBEP IN ('365904230951', '305955700366',  '305956204417',  '305956468205',  '305956509441',  '305956578024');
SELECT * FROM GXOPERA.OPMOVI O WHERE OPCOMER='0100195' AND OPLIQDE='20230228' AND OPTIPTAR='DEB';
--ver liquidaciones
SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECHD='20230228' AND LICOMER='0100195';
SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECREDI='20230302' AND LICOMER='0100195';
--
SELECT * FROM GXFINDTA.TCLIMB T WHERE IMBFCHC='20230302' and substr(IMBIDOP, 9, 7)=0100195;
-----------------------
--total flicon1 - opliqui total para bathc    P/ OPLIQUI /*MOVCDBCC 1002 /* no bbva,  rio,  bnf*/
SELECT * FROM GXOPERA.OPLICRE WHERE OPCRECOM='0301557' AND OPCREFCOM='20221228';
SELECT * FROM GXOPERA.OPLIQUI WHERE OPNCOMER='0100195' AND substr(OPCAMPOA, 41, 8)='20230228';
SELECT * FROM GXFINDTA.TCLMOV WHERE MOVIDLT='223570010301557';
-------------------caso pagos tc
/*Agendado== SGTCENVIO,  BEPSA,  CALL PGM(GXBDSGTC/DDM001PM);
        DDM001PM  ,  Envia Archivos a BNF MATRIZ
Archivo fuente . . . . . . . . . . . . . . . . :   QCLSRC
  Biblioteca . . . . . . . . . . . . . . . . . :     GXBDSGTC
Miembro fuente . . . . . . . . . . . . . . . . :   DDM001PM*/
SELECT * FROM GXBDBPS.GEMPRAF GF;
------------------------------------------------------------------
/*    Genera y envia el arhivo de Resumen diario
Archivo fuente . . . . . . . . . . . . . . . . :   QRPGSRC
  Biblioteca . . . . . . . . . . . . . . . . . :     GXBDSGTC
Miembro fuente . . . . . . . . . . . . . . . . :   TR201R*/
SELECT * FROM GXBDBPS.RSDIARIO R;
------------------------------------------------------------------
/*       DDM200P   ,  Envia Pagos de tarjetas PAGOSTC a BNF *PGM
Archivo fuente . . . . . . . . . . . . . . . . :   QRPGSRC
  Biblioteca . . . . . . . . . . . . . . . . . :     GXBDSGTC
Miembro fuente . . . . . . . . . . . . . . . . :   TR200R*/

------------------------------------------------------------------
  TR200R    ,  Transferencia de pagos                            */
------------------------------------------------------------------
            /*TR200R      *PGM      GXBDSGTC    RPGLE*/
--Archivo fuente . . . . . . . . . . . . . . . . :   QRPGSRC
--  Biblioteca . . . . . . . . . . . . . . . . . :     GXBDSGTC
--Miembro fuente . . . . . . . . . . . . . . . . :   TR200R
------------------------------------------------------------------
SELECT DISTINCT  WHPNAM,  WHTEXT FROM YAPI.BRELACPROD WHERE WHFNAM LIKE '%PAGOSTC%';
--DDM GXBDSGTC/GEMPRAFDM
SELECT SCHEDULED_TIME HORA,  SCHEDULED_JOB_NAME NOMBRE,  USER_PROFILE_FOR_SUBMITTED_JOB USUARIO_EJEC,  COMMAND_STRING COMANDO,
DESCRIPTION,  LAST_SUCCESSFUL_SUBMISSION_JOB ULTIMA_EJEC,  LAST_ATTEMPTED_SUBMISSION_STATUS AS STATUS
FROM QSYS2.SCHEDULED_JOB_INFO SJI
    WHERE STATUS='SCHEDULED'
ORDER BY SCHEDULED_TIME ASC;
Select * from gxbdbps.tmoviaf where mvfepro >= '20230721' and cmcodig = '510' and mvemiso in ( '002','317','321','324','325')
and MTNUMTA in ('6274310020122635','6274310020139084','6274310020138755');

SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBNREF IN ('316091679155','316091721028','316191864430');

