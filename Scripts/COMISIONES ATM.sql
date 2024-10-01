Select LBINPR,LIDCOM,lcodbc,LBCOCR,LBCOCR,LENEMI,SUM(LIMPGS) IMPORTE, COUNT(*)
from LIBDEBITO.drconbep
where lfectr between '20210501' and '20210530' and lcodbc IN ('MST') and LBCOCR = '530' and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEPRO
and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' --and ENEADM = '002'
GROUP BY LBINPR,LIDCOM,lcodbc,LBCOCR,LBCOCR,LENEMI;
