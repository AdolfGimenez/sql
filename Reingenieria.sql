
select * from GXSEGDTA.TSGnum where SGNUMOBJ='TSGUSR'

select * from GXSEGDTA.TSGARE where SGNUMOBJ='TSGDTO'

select * from GXSEGDTA.TSGROL 2 45 91 3

select * from GXSEGDTA.TSGARU



select * from GXSEGDTA.TSGFUN WHERE SGSISCOD='2'

select * from GXSEGDTA.TSGroldt WHERE SGSISCOD='2'

select * from gxtrjdta.tdspws


Update gxfindta.tcltsb set tsbesta = 'PE', tsbctcr = '2905890851', TSBMOTIVO = 'CAMBIO DE CUENTA' where tsbcoco = '0800637' and tsbcome = '009' AND tsbcodswd = tsbcodswc; -- 4 registros

select  * from gxtrjdta.tdgbin
where BINNROBIN LIKE '230671%'

update gxtrjdta.tdgbin set BINIDPRODU='CLA'
where BINNROBIN LIKE '230671%' and BINDSBIN='MASTERCARD DEBIT'


sELECT * FROM GXBDBPS.TCODPP WHERE COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE COSTAT = 0 AND ENEMISO = '062')
SELECT * FROM GXBDBPS.TCODPP WHERE COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE COSTAT = 0 AND ENEMISO = '201')

SELECT * FROM  GxTrjDta.TDGAFI

SELECT * FROM GxTrjDta.TDGENT

select  * from gxtrjdta.tdgbin
where PAIIDPAIS=600
and binidmarca in ('VSA', 'MST')




SELECT * FROM GXFINDTA.TCLVCT WHERE VCTFHULTUP >= '2020-09-23 00:00:00' AND VCTFHULTUP <= '2020-09-23 23:59:59';

SELECT COCOMER, CODENO,CORUCN, ENEMISO, ADNUMCTA,COFECALT,COFULMOD FROM GXBDBPS.COMAEAF
WHERE ADNUMCTA IN(SELECT VCTNCTAFT FROM GXFINDTA.TCLVCT WHERE VCTFHULTUP >= '2020-09-23 00:00:00' AND VCTFHULTUP <= '2020-09-23 23:59:59');

select * from gxbdcon.gxlofun where siscodi='TC' and funcod>=826 order by funcod


select * from GXTRJDTA.TDGENT

select * from GXTRJDTA.TDGENR

select * from gxtrjdta.TDSPrc where prcidproce in ('PCON017','PCON015','PCON013','PCON011','PCON007','PCON014','PCON003', 'PCON020')

select * from gxbdbps.tcuotaf where cuemiso='021' and cuafini='504'

Select * from gxopera.clparf where parcodbco ='083';
INSERT INTO GXOPERA.CLPARF VALUES ('083','BANCOP', '1043', 'BCOPPYPAXXX',1043, 'CC', '600', 0, '',  '', '');

SELECT * FROM GXFINDTA.TCLTSB WHERE	TSBESTA = 'RE' AND TSBFEAC >= '2020-10-07 18:15:00' AND TSBFEAC <= '2020-10-07 18:35:00';

UPDATE GXFINDTA.TCLTSB SET TSBESTA = 'PE'  WHERE	TSBESTA = 'RE' AND TSBFEAC >= '2020-10-07 18:15:00' AND TSBFEAC <= '2020-10-07 18:35:00' and TSBIDOP not in('114007', '114008')


INSERT INTO GXTRJDTA.TCOENC(  ENCENTACT,  ENCENTANT,  ENCUSULTUP,  ENCFHULTUP,  ENCENTROL)VALUES(  1042,  '069',  'MIGRACION ',  '2020-04-01 10:35:20.039',  104204);

Select * from gxfindta.tcltsb where tsbnref in ('028106870659','028106869660');

UPDATE GXTRJDTA.TCOAUX SET AUXEST = 'N' WHERE AUXTBL IN('TDCLIENTE', 'TDCLIENTED', 'GCLIEAF', 'GDIREAF')

select count(*) from GXTRJDTA.TTCCtD
select count(*) from gxtrjdta.TTCCta

DELETE FROM GXTRJDTA.TTCCtD

Select * from gxbdbps.TDEMNOTAR where NEENTID is null or NEBINNRO is null or NECTANRO is null or NEADHCTA is null or NEEMCTA is null or
NENROTARJ is null or NEFCHEXP is null or NROTARJCTA is null or NOMEMP  is null

UPDATE GXTRJDTA.TCOAUX SET AUXEST = 'N' WHERE AUXTBL IN('TDCLIENTE', 'TDCLIENTED', 'GCLIEAF', 'GDIREAF')

select COUNT(*) from  GXTRJDTA.TCOAUX where AUXEST = 'N' and AUXTBL IN('TDEMIS')

Select * from gxbdbps.TDEMNOTAR where NEENTID is null or NEBINNRO is null or NECTANRO is null or NEADHCTA is null or NEEMCTA is null or
NENROTARJ is null or NEFCHEXP is null or NROTARJCTA is null or NOMEMP  is null


select * FROM GXTRJDTA.TDSPrc WHERE PRCIDPROCE = 'PCON020   ';


INSERT INTO GXTRJDTA.TDSPRC
(  PRCIDPROCE,  MODIDMODUL,  PRCDSPROCE,  PRCESTADO,  PRCUSULTUP,  PRCFHULTUP)
VALUES (  'PCON020   ',  'CO',  'Mig. TABLA CTA DIRECCION',  'A',  '          ',  '2020-10-07 17:00:00.000');


select * from gxtrjdta.TDSPrc where prcidproce in ('PCON017','PCON015','PCON013','PCON011','PCON007','PCON014','PCON003')

SELECT * FROM GXOPERA.OPMTARI where taenadm = '083';
update GXOPERA.OPMTARI set taenadm='092' where taenadm = '083';

select auxtbl,count(*) from gxtrjdta.tcoaux where auxest='N'
group by auxtbl



Select * from gxtrjdta.TATAuD where AUDTABLA = 'TDEMIS' and AUDFECHORA > '2020-10-07'



sELECT * FROM LIBDEBITO.DRCONBEP WHERE LFCOTR = '20201006' 
AND LENEMI IN ('581','571','591','152')
AND LCRETR = '00' AND LESTTR = 'A' 
AND LIMPGS > 0 and lcodtr 
in ('000052','567102','000072','000054') 
and SUBSTR(LIDTRA,1,1) <> 'T'

select * from GXFINDTA.TCLCPC where cpcfec='20201019'


SELECT * FROM GXFINDTA.TCLTSB WHERE	 TSBFEge >= '2020-11-04 20:30:00' 

Update gxfindta.tcltsb set tsbesta = 'PE', tsbbacr = 1020, tsbctcr = '1603049057', tsbtpcr = 'CC', tsbdene = 'COOP ÑEMBY LTDA - TD', tsbidtpdoc = 'RUC', tsbnrodoc = '80017277-9', tsbdoccom = '80017277-9'
where tsbidop = 213470;



