-- sentencia DELETE para los asientos a eliminar
select * from contabilid.ccasi22
 where asfech = 221005 and asnras in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321)
 
delete contabilid.ccasi22
 where asfech = 221005 and asnras in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321)

-- sentencia UPDATE para los registros que se actualizan el campo LINROASI a cero
select * from gxopera.flicom where lifechd = '20221004' and linroasi in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321) and linroasi > 0

update gxopera.flicom set linroasi ='0'
where lifechd = '20221004' and linroasi in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321) and linroasi > 0

SELECT * FROM  CONTABILID.CCASI22 C22 WHERE C22.ASFECH


SELECT * FROM  GXTRJDTA.TDGENT
SELECT * FROM  GXTRJDTA.TDGENR
SELECT * FROM  GXTRJDTA.tcoenc