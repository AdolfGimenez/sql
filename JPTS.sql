--JPTS-295, 296, transacciones en POS para Verifone V240m y Spectra T1000 GPRS

select * from libdebito.drconbep where lfectr = '20210210' order by lhortr desc;-- in(select max(LERRNB) from libdebito.drconbep where );

select * from gxbdbps.tswaut where AUTTRXFCHF = '20201005' and AUTRRNBEP IN (select max(LERRNB) from libdebito.drconbep where lfectr = '20201005');

AUTCODRET, AUTESTREV, AUTTRXESTI, AUTTRXESTF ;


SELECT *
FROM libdebito.drconbep
WHERE lfectr = '20201015'
ORDER BY lhortr DESC;

SELECT *
FROM gxbdbps.tswaut
WHERE AUTTRXFCHF = '20201015'
ORDER BY AUTTRXHORF DESC;

SELECT *
FROM libdebito.tbcret0p
WHERE CODNRO = '00';

select * from libdebito.drconbep where lfectr = '20201117' order by lhortr desc;
and lcotel = '0991631648'  order by lhortr desc;

select lctaor CTA_ORIGEN, lctade CTA_DESTINO, lidcom COD_COM, lcomtr COMERCIO, lfectr FECHA_TRX, limpgs IMPORTE, lcodtr COD_TRX, lcodtr TIPO_TRX, lcretr COD_RETORNO, lesttr ESTADO_TRX,
lerrnb NRO_REF, lenemi ENTIDAD, lcotel NRO_TEL from libdebito.drconbep where lfectr = '20201106' and substr (lidtra,1,1)= 'P' and LHORTR > '134000'
and lcotel = '0991631648'  order by lhortr desc;



select * from gxbdbps.tswaut where AUTRRNBEP in ('029400071859')
'29300071550',
'29300071551',
'29300071554',
'29300071570',
'29300071571',
'29300071575',
'29300071581',
'29300071586',
'29300071593',
'29300071596',
'29300071597',
'29300071598',
'29300071599',
'29300071600',
'29300071601',
'29300071602',
'29300071603',
'29300071606',
'29300071607',
'29300071610',
'29300071619',
'29300071625',
'29300071628',
'29300071637',
'29300071641',
'29300071643',
'29300071653',
'29300071656',
'29300071659',
'29300071662',
'29300071665',
'29300071668',
'29300071672',
'29300071673',
'29300071674',
'29300071675',
'29300071684',
'29300071687',
'29300071690'
)

select * from gxbdbps.

select * from gxbdbps.tswaut where 

select * from gxweb.usucat;


select * from libdebito.drconbep where lfectr = '20201028' and lhortr > '104000' and limpgs = '123456' order by lhortr desc;

select * from libdebito.drconbep where lfectr = '20201105' and substr(lidtra,1,1) = 'P'  order by lhortr desc;

select * from gxbdbps.TSWAUT where AUTRRNBEP in 
(select lerrnb from libdebito.drconbep where lfectr = '20201105' and substr(lidtra,1,1) = 'P' AND LCODBC = 'DIN' and lcretr = '00' and lesttr = 'A');

select * from libdebito.drconbep where lnrtar = '4569769999990069' and substr(lidtra,1,1) = 'P';

select * from gxbdbps.comms;

values DAYOFYEAR(CURRENT_DATE) --PARA VER LA FECHA JULIANA DEL DIA

select * from libdebito.drconbep where lfectr  = '20201230' order by lhortr desc;

select * from libdebito.tclsec;

select * from libdebito.TBCTRA0P where txctrx in(
000054,
304000,
000052,
301000,
013000,
011000,
302000,
012000,
014000,
901020,
902020,
324000
);

select * from libdebito.TBCTRA0P where txctrx in(
select lcodtr from libdebito.drconbep where lfectr  = '20201119' and lcomtr = 'ATM BANCO CONTINENTAL'
);

select * from libdebito.TBCTRA0P where txctrx not in(
select lcodtr from libdebito.drconbep where lfectr  = '20201119' and lcomtr = 'ATM BANCO CONTINENTAL'
);

select * from libdebito.drconbep where lcodtr not in 


SELECT * FROM gxtrjdta.tdgbin where BINNROBIN = '456976' 

select * from libdebito.drconbep where LERRNB in (
'036500083456',
'036500083457',
'036500083458',
'036500083459',
'036500083460');

select * from gxbdbps.comms;

[22/02 4:14 p.m.] Gabriela Peralta
SELECT * FROM gxbdbps.tdemis where tdbinentid = '5177' and tdctanro = '1000022001';
SELECT * FROM gxtrjdta.tdgbin where BINNROBIN = '514848'; --BINDSBIN LIKE '%GUAI%';

select * from gxopera.opentid1;

select * from libdebito.drconbep where lfectr = '20210503' order by lhortr desc;

select * from gxbdbps.tswaut where autrrnbep in (
'108300144652',
'108300144648',
'108300144644',
'108300144640',
'108300144635',
'108300144611',
'108300144606',
'108300144595',
'108300144579',
'108300144575'
);
