--GE04NIV--
select * from  CONTABILID.GE04NIV 
where nicous='U99LILIAN';

select * from contabilid.ge04niv
where nisist='CX'
and ninive='G3'

INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) 
VALUES('U99CARMEN', 'CX', 'G3');


INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST) 
VALUES('U99CARMEN', 'SJ');

--GE03ACC--EXCLUSIVO CONTABILIDAD
select * from contabilid.ge03acc
where accous='U99LILIAN'

INSERT INTO CONTABILID.GE03ACC (ACCOUS, ACPROG, ACOPER)
VALUES('U99LILIAN', 'CC302R', '0')

TATACUS
select * from contabilid.tatacus
where tacous='U99LILIAN';

select * from contabilid.tatacus
where tasucu='01' and taarea='03';


INSERT INTO CONTABILID.TATACUS (TACOUS, TASUCU, TAAREA, TADEPA)
VALUES('U99CARMEN', '01', '03', 0)
          

--E05PRO--
select * from contabilid.ge05pro
where prprog in ('CC122R', 'CC123R', 'CC125R', 'CC126R', 'CC129R', 'CC152R')                          
GE04NIV
GE03ACC
tatacus


