SELECT BiENroTrab, BiECntAfec, BiEEstado, BiECntPEmb   FROM GXTRJDTA.TSTBIE WHERE BIENROTRAB = '20200412_1020_1'

SELECT * FROM  GXSEGDTA.TSGAru WHERE SGUSRCOD  =2024



SELECT R.SGROLCOD , L.SGROLDESC , R.SGSISCOD , S.SGSISDESC ,F.SGFUNCOD , F.SGFUNOBJ   FROM GXSEGDTA.TSGROLDT R INNER JOIN GXSEGDTA.TSGFUN F ON R.SGFUNCOD  = F.SGFUNCOD INNER JOIN GXSEGDTA.TSGSIS S ON F.SGSISCOD  = S.SGSISCOD  INNER JOIN GXSEGDTA.TSGROL L ON  L.SGROLCOD  = R.SGROLCOD INNER JOIN  GXSEGDTA.TSGAru A ON A.SGROLCOD  =  R.SGROLCOD  WHERE (R.SGROLCOD  = 2 OR R.SGROLCOD  =4 ) AND l.SGSISCOD  =1 AND A.SGUSRCOD  = 2024 AND F.SGFUNOBJ  = ''

SELECT * FROM GXSEGDTA.TSGROL 




/*BiENroTrab,  BIECNTINIS, BIECNTAEMB, BIEMOTRECH, BIECNTFINU */