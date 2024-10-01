SELECT * FROM LIBDEBITO.drconbep WHERE LFECTR = '20201019' ORDER BY LHORTR  DESC;

select * from gxopera.opentid1 where REENTI = '174';



SELECT *
FROM libdebito.tbcret0p
WHERE CODNRO = '01';

select * from gxbdbps.tdcliente where tdclinrodoc in ('0100001');
select * from gxbdbps.tdcliente where tdclinrodoc in ('A457902','B577195');
select * from gxbdbps.tdcliented where tdclinrodoc in ('0100001');
select * from gxbdbps.tdcta where  tdctanro in ('156650000');
select * from gxbdbps.tdcta where TDCTATAR like '627431015%';
select * from gxbdbps.tdctaad where /*tdbinentid = '1020' and*/ tdctanro in ('156650000');
select * from gxbdbps.tdemis where tdctanro in ('156650000');
select * from gxbdbps.tdemisnov WHERE  tdctanro in ('156650000');
select * from gxbdbps.tdemnotar where /*NENROTARJ = '4569760000020069' and neentid = '1020' and */nectanro in ('156650000');
select * from gxbdbps.atdemis where aecta in ('156650000');
