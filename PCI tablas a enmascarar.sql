select * from libdebito.tgembhaf;
update libdebito.tgembhaf set CRTARJ=(SUBSTR(CRTARJ,1,6) || 'XXXXXX' ||SUBSTR(CRTARJ,13,4));

select * from LIBDEBITO.embtrkvis    ;
UPDATE LIBDEBITO.embtrkvis SET TKTRAK=''	

select * from LIBDEBITO.embtrkDEB    ;
UPDATE LIBDEBITO.embtrkDEB SET TKTRAK=''	


select * from gxbdbps.gclieaf   ;
update gxbdbps.gclieaf set CENOMB1='NOMBRE1',  CENOMB2='NOMBRE2', CEAPEL1='APELLIDO1', CEAPEL2='APELLIDO2'

select * from gxbdbps.tdcliente ;
update gxbdbps.tdcliente set TDPRIMNOM='NOMBRE1', TDSEGNOM='NOMBRE2', TDPRIMAPE='APELLIDO1', TDSEGAPE='APELLIDO2', TDNOMAPE='APELLIDO1, NOMBRE1'

select * from gxbdbps.tmoviaf   ;
update gxbdbps.tmoviaf set mtnumta=(SUBSTR(mtnumta,1,6) || 'XXXXXX' ||SUBSTR(mtnumta,13,4));

select * from gxbdbps.tcuotaf
update gxbdbps.tcuotaf  set MTNUMTA=(SUBSTR(MTNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MTNUMTA,13,4));


select * from gxbdbps.ait002    ;
update gxbdbps.ait002  set AITCTRJNRO=(SUBSTR(AITCTRJNRO,1,6) || 'XXXXXX' ||SUBSTR(AITCTRJNRO,13,4));

select * from gxbdbps.tmctaaf   ;
update gxbdbps.tmctaaf set MCNUMTA=(SUBSTR(MCNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MCNUMTA,13,4));

select * from gxbdbps.tmtaraf   ;
update gxbdbps.tmtaraf set MTNUMTA=(SUBSTR(MTNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MTNUMTA,13,4));

select * from gxbdbps.thextraf  ;
update gxbdbps.thextraf  set HENUMTA=(SUBSTR(HENUMTA,1,6) || 'XXXXXX' ||SUBSTR(HENUMTA,13,4));

select * from gxbdbps.thmovaf
update gxbdbps.thmovaf  set HMNUMTA=(SUBSTR(HMNUMTA,1,6) || 'XXXXXX' ||SUBSTR(HMNUMTA,13,4));

select * from libdebito.drconbep

update libdebito.drconbep set 
LNRTAR=(SUBSTR(LNRTAR, 1, 6) || 'XXXXXX' ||SUBSTR(LNRTAR, 13 ,4))

select * from visa.vistrndta    ;
update visa.vistrndta set VIPANNMBR=(SUBSTR(VIPANNMBR,1,6) || 'XXXXXX' ||SUBSTR(VIPANNMBR,13,4));

select * from visa.visctldta    ;
update visa.visctldta set V002=(SUBSTR(V002,1,6) || 'XXXXXX' ||SUBSTR(V002,13,4));

select * from gxbdbps.tdcta 
update gxbdbps.tdcta set tdctatar=(SUBSTR(tdctatar,1,6) || 'XXXXXX' ||SUBSTR(tdctatar,13,4));

select * from gxbdbps.tdctaad   ;
update from gxbdbps.tdctaad set TDADHNOMPLA='NOMBRE APELLIDO'

select * from gxbdbps.tdemnotar ;
UPDATE gxbdbps.tdemnotar set NENROTARJ=(SUBSTR(NENROTARJ,1,6) || 'XXXXXX' ||SUBSTR(NENROTARJ,13,4)), NROTARJCTA=(SUBSTR(NROTARJCTA,1,6) || 'XXXXXX' ||SUBSTR(NROTARJCTA,13,4))

select * from gxbdbps.tmovpag   ;
update gxbdbps.tmovpag set MPNTAR=(SUBSTR(MPNTAR,1,6) || 'XXXXXX' ||SUBSTR(MPNTAR,13,4));

select * from gxbdbps.tdemis ;
update gxbdbps.tdemis set tdempinoff='A1B2C3D4E5F6G7H8'



