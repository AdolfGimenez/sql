
  select * from  libdebito.tbcret0p


----------------------------------------ATM CENTRE -------------------------------------------------------
																select lfectr as FECHA,lhortr as HORA,lnrtar AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO, LSALTR AS SALDO_TARJETA 
																from libdebito.drconbep
																where substr(lidtra,1,4) in
																('T375')
																and lfectr='20200904'
																order by lhortr desc
																
-----------------------------------VERIFICA POR BIN FE TARJETA-----****************OJOOO**************************************************************************************************************************
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,LECA62, LSALTR AS SALDO_TARJETA,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '488234%' order by lhortr desc --
---------------------------------*****************************************************************************************************************************************************************************************	
		
															-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '456976%' order by lhortr desc --
															
														-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '443078%' order by lhortr desc --
														
														-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '703002%' order by lhortr desc --
																		

												-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '502026%' order by lhortr desc --
															
SELECT lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lbinpr,LENEMI ENTIDAD, LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,--lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFERENCIA_BEPSA, lidcom COD_COMERCIO,lcomtr LOCAL_COMERCIO,lcautr COD_AUT,limpgs IMPORTE,lcodtr COD_TRX,LACTFJ,/*txdtrx DESC_TRX,*/leca62 VERSION--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep 
WHERE lfectr BETWEEN '20200904' AND '20200904' 
and lcretr='05' and SUBSTR(lnrtar,1,6)like '443078'
and substr(leca62,1,1) in ('T') --and lhortr > '211000' and lhortr < '235959'
--and lhortr > '115000' --and lcretr = '00' and substr (lcodtr,1,1) <> '3'
--orderb by leca62 desc
order by lfectr asc ,lhortr asc



SELECT*FROM libdebito.drconbep 


--Bucador de Consultas--
					select LECA62 NO_ATM, LCOMTR NOMBRE, COUNT(LECA62) CANT_TX
					from libdebito.drconbep
					where lfectr = '20200904'
					  and substr(LECA62,1,1)='T'
					--	and substr(lhortr,1,2) = HOUR(CURRENT_TIME)
						and lcodtr = '301000'-- Consulta de Saldo

					GROUP BY LECA62, LCOMTR
					ORDER BY CANT_TX DESC 
					
	--RECHAZOS BNF PROCARD-HORA Y CONTADOR
				select lfectr AS FECHA , lcodbc AS MARCA , lcretr AS RETORNO, lesttr AS ESTADO, COUNT(*) CANTIDAD
				from libdebito.drconbep 
				where lfectr='20200904' and lenemi='510' and lhortr between '122800' and '125823'
				and lcretr in ('91','92','93','05','00')  and lcodbc in ('MST','VSA','CRE','UNI')
				GROUP BY Lfectr, lcodbc, lesttr , lcretr
				

															select lfectr as Fecha,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lenemi='510'  and lcretr in ('91','92')--and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') and ,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta '4430761400004536'
															order by lhortr desc
															

SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lesttr ESTADO,lcretr COD_RETORNO,lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,substr(leca62,1,4) ATM,
lcodtr COD_TRX,lnfisc COD_ADQ_BPS,
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP'
WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
WHERE lfectr BETWEEN '20200904' AND '20200904'
and lcodbc='VSA'
and substr(lidtra,1,4)='T299'
order by lhortr desc


		--RECHAZOS Y CONTADOR MASTERCARD 
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20200904'  and lcodbc in 'MST'
--AND LHORTR BETWEEN '170000'  and '173000' 
and lcretr in ('92','91','88','00','96')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 
ORDER BY LCRETR DESC


--RECHAZOS Y CONTADOR VISA 
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20200904'  and lcodbc in 'VSA' 
and lcretr in ('92','91','88','00','96','19')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 
ORDER BY LCRETR DESC

--RECHAZOS Y CONTADOR  488234
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20200904'  and lnrtar like '488234%' 
and lcretr in ('92','88','00','96','14','04','05','91')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 
ORDER BY LCRETR DESC

--RECHAZOS Y CONTADOR  443078
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20200904'  and lnrtar like '443078%'-- and lhortr > '170600'
and lcretr in ('92','91','88','00','96','14','04','05','03')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 
ORDER BY LCRETR DESC


--RECHAZOS Y CONTADOR  7030
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr = '20200904'  and lnrtar like '703002%'-- and lhortr > '170300'
and lcretr in ('92','91','88','00','96','14','04','05','55','83','16')
--and lcodbc='DIN'
--and  codmar = 'DIN'
--and  lcodbc = 'DIN'
GROUP BY Lfectr, lcodbc, lesttr , lcretr, loritr 
ORDER BY LCRETR DESC


SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) */
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,
--lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,
lcodtr COD_TRX,leca62 Version_Pos,LNFISC cod_adq_bepsa
from libdebito.drconbep
WHERE lfectr BETWEEN '20200904' AND '20200904'
and lcodbc='VSA'
and lnfisc='422745'
order by lhortr desc

													--PROCARD VISA MASTERCARD
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lenemi='510'  --and lcretr in ('XD') --and lhortr > '203000'
															order by lhortr desc
	
													--PROCARD MASTERCARD
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
															where lfectr between '20200904' and '20200904' 
															AND lcodbc IN 'MST'
															order by lhortr desc
			
													--PROCARD VISA
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
															where lfectr between '20200904' and '20200904' 
															AND lcodbc IN 'VSA'
															order by lhortr desc
	
															--MASTERCARD
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc,leca62 from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '516400%' order by lhortr desc --
			
														--VISA
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '443078%' order by lhortr desc --

											-- VERIFICA POR BIN FE TARJETA-----****************OJOOO**************************************************************************************************************************
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,LECA62, LSALTR AS SALDO_TARJETA,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200730' and '20200730' and lnrtar like '488234%' order by lhortr desc --
														--*****************************************************************************************************************************************************************************************	
		
															-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '479348%' order by lhortr desc --

															-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '459327%' order by lhortr desc --
			 
															-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '443078%' order by lhortr desc --
															
														-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '703002%' order by lhortr desc --
			
															-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '601639%' order by lhortr desc --
			
														--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
															select lfectr as Fecha,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lenemi='510'  and lcretr in ('92','19','00','05','91','57','96','19')and lhortr > '63000'--'91','XD','92')and lcretr in ('96','91','XD','92') and ,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta '4430761400004536'
															order by lhortr desc
														--ok


-------------------------------------------
--VISA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,LCODBC,LHISDE,LCODBC,LENEMI,LHISDE,LECA62,LORITR from libdebito.drconbep
where lfectr between '20200904' and '20200904'
and lnrtar like '488234%'
--AND LCRETR IN '91'
---and lhortr between '200857' and '220000'
--AND LNRTAR LIKE '488234%'
--AND  LCODBC IN ('VSA','MST')
order by lhortr desc 

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20200904' and '20200904' and lnrtar like '601638%' order by lhortr desc --

		
--RECHAZOS Y CONTADOR CABAL 
select  lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20200904'  and lcodbc in 'CAB' 
and lcretr in ('92','91','88','00')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 


--DESCRIPCIONES DE LAS TARJETAS
    select lfectr FECHA,lhortr HORA,lnrtar NUM_TARJETA,limpgs MONTO,lesttr ESTADO,lcretr RETORNO
,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj
from libdebito.drconbep
inner join libdebito.tbinproc on pbin=lbinpr
where lfectr in '20200904'                                                                                                                                                                                                                  
--and lnfact > 'PY'
 and lenemi in ('530','560','590','570')
--and lhortr between '' and '133400'
--AND LENEMI='571'
--and lcretr in '91'
order by lhortr desc


select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.vipannmbr tarje_visa,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,b.virol,b.vif044rmsg mensaje
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20200904' and '20200904'
--and lnrtar ='4882340010063886'
--and b.virrnbepsa='016278880939'
order by lhortr desc

--verificar PERSONAL--
 select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc,lbcodb,lmcctr,loritr,leca62 from libdebito.drconbep
  where lfectr between '20200904' and '20200904'
   and lnrtar like '627431571%'-- AND LCOTEL = '0986724065'
 --  AND LCOTEL = '0994620381'
   --and lcretr = '84'
   --and limpgs>2000000
  order by lhortr desc
 
										---verificar trx tigo handlerWS--Sin Tarjeta
															select lfectr,lhortr,lerrnb,lidcom,lcotel,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr,loritr from libdebito.drconbep
															where lfectr between '20200904' and '20200904' 	and lcretr in ('91','96','01','93','00')-- and lcotel in '0982168509' 
														and lnrtar like '627431581%' 
													--AND LCOTEL = '0986797630' NUMERO DE TELEFONO
												--- and limpgs>2000000 MAYOR A UN MONTO
															order by lhortr desc


															--verificar tigo companion-- CON TARJETA
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr from libdebito.drconbep
															where lfectr between '20200904' and '20200904' --and lcotel in '0982168509' 
															and lnrtar like '627431152%'--AND LCOTEL = '0986724065' 
													--	and limpgs>2000000
														--	and lenemi='581'
											--	AND LCOTEL = '0986797630'
													 order by lhortr desc



													---------------370 carga , 380 retiro, 390 giro
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr codtrx, lcotel from libdebito.drconbep
															where lfectr between '20200904' and '20200904' 
															and lcodtr in  ('380000','370000','390000') 
															 -- and limpgs>5000000
															order by lhortr desc  

 select lfectr Fecha,lhortr Hora,lenemi Emisor
,lerrnb Cod_Ref,lnrtar N_Cu,lidcom Cod_Comercio
,lcomtr Comercio,(limpgs) importe,lcretr Retorno
,lesttr Estado,substr(lidtra,1,1) Origen,A.TXDTRX DETALLES,lctaor numero
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr in '20200904'
and lcodtr='000072'----Codigo de trx Claro
and Lenemi='591'--- emisor claro
and limpgs>1
and  codmar = 'BEPS'
order by lhortr desc


select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20200904'-- and lhortr > '180800'
and lcodtr in ('000052','567102','000072')
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr,cantidad desc 


select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20200904'-- and lhortr > '180800'
and lcodtr in ('000052','567102','000072')
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr,cantidad desc 

--Consulta de transacciones (37000-Carga),(38000-Giro),(39000-Retiro)
select lfectr Feha, lfcotr Fecha_Comer, lhortr Hora, lctaor C_I, lctade Num_Ref
, lcotel Nume_Tell, lidcom Cod_Comer, lcomtr Comercio, limpgs Monto
, lcodtr Transaccion, LCRETR Retorno from libdebito.drconbep
where lfectr between '20200904' and '20200904'
--and lctade like '%332978600'
and lcotel in '0961993735' 
--and lctade in ''
--AND LCOTEL = ''
and lcodtr in  ('370000','380000','390000') 
order by lhortr desc 

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcotel, lcodtr codtrx from libdebito.drconbep
where lfectr between '20200904' and '20200904'
and lcotel in '0985102738' 
and lcodtr in  ('370000','380000','390000') 
order by lhortr desc 

	---TRX DE UN COMERCIO EN ESPECÍFICO 
	select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lctade,lcotel,LCTAOR
	from libdebito.drconbep
	where lfectr between '20200904' and '20200904' 
	--and lctade like '%348128587'
	and lidcom='0703255'
	---and lnrtar like '%1620'
	--AND LERRNB='002473274986'
--	AND LIMPGS = 458000
---AND LCOTEL = '0985689450'
	order by lhortr desc 

	---TRX DE UN COMERCIO EN ESPECÍFICO 
	select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lctade,lcotel,LCTAOR
	from libdebito.drconbep
	where lfectr between '20200904' and '20200904' 
	--and lctade like '%348128587'
	and lidcom='0701699'
--	AND LIMPGS = 458000
---AND LCOTEL = '0985689450'
	order by lhortr desc 

----PARA ENVIAR REPORTES---
select lfectr FECHA,lhortr HORA,lerrnb NUM_BOL,lidcom COD_COMERCIO
,lcomtr COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs MONTO,lesttr ESTADO, LSALTR AS SALDO_TARJETA
,lcretr RETORNO,LCODBC MARCA,LHISDE EMISOR
,LORITR DISPOSITIVO,LNFACT PAIS from libdebito.drconbep
where lfectr between '20200904' and '20200904'
AND LBINPR IN ('488234','456976')
and limpgs > '4000000'
order by lhortr desc


--Monitoreo Adquirencia Mastercard
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20200904' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
--AND LHORTR BETWEEN '170000'  and '173000'
--and lenemi='510'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc
 
--ADQ CONTINENTAL
select lenemi emisor, ennombr ENTIDAD,lcretr cod_retorno,count(*) cantidad,sum(limpgs)
from libdebito.drconbep INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
WHERE lfectr BETWEEN '20200904' AND '20200904'
and lenemi='540'
group by lenemi,lcretr,ennombr
ORDER BY CANTIDAD DESC


--VISA ADQ
    select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20200904' and lcodbc='VSA' and  codmar = 'VISA'
and lnfisc='422745' and lenemi in ('500') 
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc


--Usar este es con las condiciones Visa de Emisor
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20200904'
and lcodbc='VSA'
and  codmar = 'VISA'
and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc


    select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20200904' and '20200904'
--and lcodtr in ('567102')
and substr(lidtra,1,1) = 'T'
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc


    ------------------mst Bepsa
select lfectr Fecha, lhortr Hora, lcodbc Marca, lenemi Emisor, lbinpr Bin, lnrtar Tarjeta
,lcretr Retorno, lesttr Estado, loritr,leca62,limpgs from libdebito.drconbep
--where lhortr between '175506' and '191548'
where lfectr in '20200904'
and lbinpr in '443078'
--and lnrtar like '%0221'
order by lhortr desc
--and lenemi='530'
--and lcretr in '14'
--and lfectr in '20200518'
--and lbinpr like ('502026%','601638%')
--and lbinpr like '443078%' --and lcretr = '05'
--and lbinpr like '%0221'
--and lbinpr like '601637%'
--and lbinpr like '606257%'
--and lbinpr like '606372%'
--and lbinpr like '541863%'
--and lbinpr like '230671%'

    select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lbinpr bin,d.pdescricion descrip_marca, b.mcpannmbr tarje_mast,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399')
where lfectr between '20200904' and '20200904' and lcretr='81'


						-- VERIFICA POR BIN FE TARJETA-----
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
															where lfectr between '20200904' and '20200904' and lnrtar like '443078%'
															and lcretr in ('92','91','88','96') 
															AND LHORTR BETWEEN '143000'  and '183000'
															order by lhortr desc --
															


			select lfectr fecha_real,lcretr cod_retorno,count(*)cantidad,lbinpr bin,pdescricion MARCA
from libdebito.drconbep  inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20200904' AND '20200904'
and lcretr='81' --and lactfj='13756136' --and lidcom ='8600862'
group by lfectr ,lcretr,lbinpr,pdescricion


select lfectr FECHA,lhortr HORA,lnrtar NUM_TARJETA,limpgs MONTO,lesttr ESTADO,lcretr RETORNO
,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj
from libdebito.drconbep
inner join libdebito.tbinproc on pbin=lbinpr
where lfectr in '20200904'                                                                                                                                                                                                                  
--and lnfact > 'PY'
 and lenemi in ('530','560','590','570')
--and lhortr between '' and '133400'
--AND LENEMI='571'
--and lcretr in '91'
order by lhortr desc

    select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20200904' and lcodbc='VSA'
and lnfisc='443078' and lenemi in ('500')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

    INSERT INTO GXBDBPS.ATMCTXDEST (  ATMCID,  ATMCCOPE,  ATMCPGMO,  ATMCPGMD,  ATMCPGMLD)
VALUES
('T0020370',  13000,  'TRANSQDVIS',  'VIADQ001A',  'VISA'),
('T0020370',  12000,  'TRANSQDVIS',  'VIADQ001A',  'VISA'),
('T0020370',  11000,  'TRANSQDVIS',  'VIADQ001A',  'VISA'),
('T0020370',  301000, 'TRANSQDVIS',  'VIADQ001A',  'VISA'),
('T0020370',  302000, 'TRANSQDVIS',  'VIADQ001A',  'VISA'),
('T0020370',  303000, 'TRANSQDVIS',  'VIADQ001A',  'VISA');

    SELECT*FROM GXBDBPS.ATMCTXDEST
WHERE ATMCID='T0020373'
