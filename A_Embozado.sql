--reimpresion de Pin desde entidad
************************************************************************************************
call libdebito/EMBRG001N5

select * from GXBDBPS.TDEMISnov  where  TDEMISNOV='5' and TDESTNOV='0';

update GXBDBPS.TDEMISnov set TDESTNOV='1'
where  TDEMISNOV='5' and TDESTNOV='0';
--para cmabiar novedad para reimpresion de pin
/*
  Tipos de Novedad de Embozado Actual
     1    Nueva tarjeta
     2    Regrab.Con Cambio Nro. y Sin Cambio Vto.
     3    Regrab.Sin Cambio Nro. y Sin Cambio Vto.
     4    Renovaci�n por Vto.
     5    Reimpresi�n de PIN
     6    Renov.esp.Con Cambio Nro. y Con Cambio Vto.
     7    Renov.esp.Sin Cambio Nro. y Con Cambio Vto.
  ---Reigenieria
  Alta            A
  Renovacion      R
  Regrabacion     P
  Reimpresion     I
  Todas           T
*/
UPDATE GXBDBPS.TMTARAF
SET MTNOVED='3'
WHERE MTNUMTA='5303990000002910';
************************************************************************************************
--para quitar mensaje desde el sitcevo, 
UPDATE GXBDBPS.TMTARAF
SET MTFECRE='20220429', MTESTHA=''
WHERE MTNUMTA='4594300000000016';

UPDATE GXTRJDTA.TTCTRJ
SET TRJIDMOTAU=4, TRJSITTRJ='A', TRJVIGENTE='S'
WHERE TRJNROTRJ='4594300000000016   ';
************************************************************************************************
/*Ayuda embozado
------------------------------------------------------------------------------------------------------------------------------------------
Ver menu de embozadosgo 
    mnumn100
3.- Verificar Asignacion ...........MNURG004
17 MENU EMBOSSING� 
19 EMBOSAR PLASTICO BIN 627431
------------------------------------------------------------------------------------------------------------------------------------------
Origen
TGEMBHAF 
Destino
embnov0d debitos (incluidas las de 16 y 17 digitos 040, 165, 166)
embnov0p (creditos y prepagas)
TGEMBNOV (BNF)
------------------------------------------------------------------------------------------------------------------------------------------
Solicitar e usuario de operaciones la entidad, quien proceso, fecha, si es debito de 16 o 17, credito o prepaga o BNF para saber donde depositar los registros.*/
************************************************************************************************************************************************************************
----tablas del actual
--tabla de afinidades del actual
SELECT * FROM GXBDBPS.TBLOQAF ;--TABLA DE CODIGO DE RESPUESTA DE BOLUQUEO O ESTADO
SELECT * FROM GXBDBPS.TAFINAF WHERE ENEMISO = '021';
SELECT * FROM GXBDBPS.TDCTA WHERE TDCTANRO='17901548';
SELECT * FROM GXBDBPS.TDCTAAD where TDADHNOMPLA like '%VICTOR ROBLES%';
SELECT * FROM GXBDBPS.TDEMIS where TDCTANRO= '179040015507';
SELECT * FROM GXBDBPS.TDEMISNOV where TDCTANRO= '13720103';
SELECT * FROM GXBDBPS.TDEMNOTAR where NENROTARJ='6274311790015538';
SELECT * FROM GXBDBPS.TDCTAREL where TDBINNRO= '627431'
SELECT * FROM GXBDBPS.TMTARAF WHERE MTNUMTA='6274311790015538'
SELECT * FROM GXBDBPS.TMTARAF WHERE MCNUMCT IN('179040015507','179040017701');
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCNUMCT='20130500004'--TABLA DE CUENTAS DE ACTUAL
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCNUMCT IN('179040015507','179040017701');
select * from libdebito.embnov0d
select * from libdebito.embnov0p
select * from gxdebito.TGEMBDAF
select * from libdebito.TGEMBDAF
select * from libdebito.TGEMBHAF WHERE CRDOCU in ('4083710')= CRFEEJ BETWEEN '20220801' and '20220831' and CRNOMB like 'ALEJANDRO ORTIZ A.%' and CRDOCU='6179918'
where CRTARJ = '4569760001132418'
where CRUSGE= 'U99ENRIQUE' and CRFEEJ='20220805' and CRENTI='040' and CRHOEJ ='132731'
-------------------------------
SELECT * FROM GXTRJDTA.TDGENP
SELECT * FROM GXTRJDTA.TDGPER
SELECT * FROM GXBDBPS.TDCLIENTE
SELECT * FROM GXBDBPS.GCLIEAF
SELECT * FROM LIBDEBITO.TGEMBHAF
------------------------------------------------------------------------------------------------------------------------------------------
--tablas re reing.
SELECT * FROM GXTRJDTA.TTCTRJ where TRJNROTRJ='5148480000000782'-- tabla tarjeta credito
SELECT * FROM GXTRJDTA.TTDEMI where eminrotrjd='6274311790015538' -- tabla tarjeta de debito
SELECT * FROM GXTRJDTA.TTDCAD where PERNRODOC='17901548'-- tabla adherente
SELECT * FROM GXTRJDTA.TTDCDB where CDBIDCTA='20130500004' -- tabla cuentas
SELECT * FROM GXBDBPS.TEMBSAF -- tabla de activacion de tarjetas
SELECT * FROM GXTRJDTA.TDGENP -- Entidad Persona
SELECT * FROM GXTRJDTA.TDGPER -- tabla de Persona
SELECT * FROM GXTRJDTA.TDSDTF -- Detalle de transmisiones
SELECT * FROM GXTRJDTA.TDSTFS -- tabla de cabecera de transmisiones
SELECT * FROM GXTRJDTA.TDSSPR -- tabla de trasmisiones pendientes
SELECT * FROM GXTRJDTA.TDSTFS -- tabla de transmisiones
SELECT * FROM GXTRJDTA.TDSSPR -- tabla de tarjeta de debito
select * from GXTRJDTA.TTCTRJ;--tabla de tarjeta de credito
select * from gxtrjdta.tcadec --tabla de corte reing.
Select * from libdebito.tgembhaf -- tabla de corte actual
select * from gxtrjdta.tcaaem -- tabla para ver lo depositado al chip centre
select * from gxtrjdta.ttccta where CTAIDCTA='20130500004';--tabla de cuenta credito
------------------------------------------------------------------------------------------------------------------------------------------
EMBNOV0P

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99ENRIQUE' AND        
CRFEEJ='20220802'
where and             
CRENTI in (                        
'176')               
and CRCODN<>'5' 
and CRNOMB like '%RICHARD GONZALEZ%'
--Luego
update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0
/*Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0P
Borrar registros duplicados en TGEMBHAF.
Sentencias realizadas poner en redmine por auditoria*/
************************************************************************************************************************************************************************
BNF TGEMBNOV 

  SELECT
  CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
  CRNROC, CRNCTA, CRNOMB, CRTDOC, CRDOCU, CRVENC, CRNEMP, 
  CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
  CRHOGE, CRFEGE, CRRETO, 
  CRUSEJ, CRHOEJ, CRFEEJ
  FROM libdebito.TGEMBHAF
  where CRUSEJ='U99ENRIQUE' AND        
  CRFEEJ='20220802'
  and             
  CRENTI in (                        
  '176')               
  and CRCODN<>'5'
--Luego
update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0
/*Copiar los datos de auxiliar a tabla correspondiente, en este caso TGEMBNOV 
Borrar registros duplicados en TGEMBHAF.
Sentencias realizadas poner en redmine por auditoria*/
************************************************************************************************************************************************************************
embnov0d Debito 16 digitos

SELECT
CRENTI, CRSUCU, CRCLAT, 
CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, 
cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, 
CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200812 CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, 20200812 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND                 
CRFEEJ='20200812' and                         
CRENTI in ('020')
and crhoej>='150000'
and crbine='703020'
--Luego
update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0
/*Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0D
Borrar registros duplicados en TGEMBHAF.
Sentencias realizadas poner en redmine por auditoria*/
************************************************************************************************************************************************************************
embnov0d DEBITO 17 digitos de tarjeta

select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200518 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crfege='20200518'
and a.crhoej>'105223'
--Luego
update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0
/*Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0D
Borrar registros duplicados en TGEMBHAF.
Sentencias realizadas poner en redmine por auditoria*/
************************************************************************************************************************************************************************
--Temporales
select * from libdebito.embnovtmp
select * from libdebito.EMBNOVTMD
************************************************************************************************************************************************************************
select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200114 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from yapi.TGEMBHAFhf a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
************************************************************************************************************************************************************************
select * from libdebito.TGEMBHAF   
where CRUSEJ='U99ENRIQUE' AND        
CRFEEJ='20220802' and              
CRENTI in (                        
'176')               
and CRCODN<>'5' 
and CRDOCU='5930200'         
************************************************************************************************************************************************************************
update libdebito/embnov0d set CRUSEJ='', CRHOEJ=0, CRFEEJ=0
************************************************************************************************************************************************************************
select * from libdebito/TGEMBHAF              
where CRUSEJ='U99ENRIQUE' AND                 
CRFEEJ='20200114' and                         
CRENTI in ('107', '151', '155', '158', '162', 
'319', '040', '165', '166', '002')                                                          
and CRCODN<>'5'
************************************************************************************************************************************************************************
SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200120 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200120'
and             
CRENTI in (                        
'113', '151', '164',)               
and CRCODN<>'5'
************************************************************************************************************************************************************************
--Para generar archivo desde el historico
SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200120 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200120'
and             
CRENTI in (                        
'113', '151', '164',)              
and CRCODN<>'5'       
------------------------------------------------------------------------------------------------------------------------------------------
--Verificamos que la entidad remitio un pedido en fecha del mes de marzo, y el mismo no fue concluido, podr�an verificar por favor el motivo y ayudarnos a procesar el d�a de hoy. Adjunto tarjeta en cuestion.
SELECT * FROM GXBDBPS.TDEMIS where TDBINENTID='5166' and TDCTANRO= '13720103' and TDEMFECALT='20220310'

UPDATE GXBDBPS.TDEMIS SET TDEMEST = 'I', TDESTID = '2', TDFECHEMB = '00000000'
where TDBINENTID='5166' and TDCTANRO= '13720103' and TDEMFECALT='20220310'

SELECT * FROM GXBDBPS.TDEMISNOV where TDBINENTID='5166' and TDCTANRO= '13720103' and TDFECHENT='20220310'

UPDATE GXBDBPS.TDEMISNOV SET TDESTNOV = '0', TDFECHPROC = '00000000'
where TDBINENTID='5166' and TDCTANRO= '13720103' and TDFECHENT='20220310'
------------------------------------------------------------------------------------------------------------------------------------------
--Favor verificar inconveniente para reimpresion de PIN, la entidad solicit� una reimpresion de pin pero Operaciones no registra para su proceso
select * from GXBDBPS.TDEMISnov  where  TDEMISNOV='5' and TDESTNOV='0'

          call libdebito/EMBRG001N5

update GXBDBPS.TDEMISnov set TDESTNOV='1'
where  TDEMISNOV='5' and TDESTNOV='0'
-------
--tarea 54634
--embozado01
SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
 where CRFEEJ='20230711' and CRENTI='002'

CPYF FROMFILE(HERNANLIB/EMBOZADO01) TOFILE(LIBDEBITO/TGEMBNOV) MBROPT(*ADD)

delete
FROM libdebito.TGEMBHAF
 where CRFEEJ='20230711' and CRENTI='002'

--embozado02
 SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20230711 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
 from libdebito.tgembhaf where CRFEEJ='20230711'
  and CRENTI='021' and CRCLAT='507'

CPYF FROMFILE(HERNANLIB/EMBOZADO02) TOFILE(LIBDEBITO/EMBNOV0P) MBROPT(*ADD) FMTOPT(*MAP *DROP)                                                            

delete
 from libdebito.tgembhaf where CRFEEJ='20230711'
  and CRENTI='021' and CRCLAT='507'

--embozado03
 SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20230711 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ 
from libdebito.tgembhaf 
where CRFEEJ='20230711' 
and CRENTI in ('101', '107', '146', '155',
 '168', '319', '332')
 and CRHOEJ<'160000'

CPYF FROMFILE(HERNANLIB/EMBOZADO03) TOFILE(LIBDEBITO/EMBNOV0P) MBROPT(*ADD FMTOPT(*MAP *DROP) 

delete
from libdebito.tgembhaf 
where CRFEEJ='20230711' 
and CRENTI in ('101', '107', '146', '155',
 '168', '319', '332')
 and CRHOEJ<'160000'                                                           

--embozado04
select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20230711 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta 
on tdctanro=decimal(substr(CRTARJ,7,10)) 
 where CRFEEJ='20230711' 
 and CRENTI in ('020', '165', '172') and CRCLAT='DIN'
  and CRHOEJ<'160000'

CPYF FROMFILE(HERNANLIB/EMBOZADO04) TOFILE(LIBDEBITO/EMBNOV0D) MBROPT(*ADD) FMTOPT(*MAP *DROP)               

delete
from LIBDEBITO.TGEMBHAF a 
 where CRFEEJ='20230711' 
 and CRENTI in ('020', '165', '172') and CRCLAT='DIN'
  and CRHOEJ<'160000'                                           