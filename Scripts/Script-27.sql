SELECT COUNT(*)  FROM GXTRJDTA.TCOAUX t WHERE AUXTBL in('TAFINAF' )  AND AUXFEHO >= '2020-08-01-00.00.00.000000' AND AUXFEHO <= '2020-08-31-23.59.59.000000' AND  AUXEST = 'Z';




SELECT *  FROM GXTRJDTA.TCOAUX t WHERE AUXTBL in('TCODEAF' )  AND AUXFEHO >= '2020-08-01-00.00.00.000000' AND AUXFEHO <= '2020-08-31-23.59.59.000000' ;






SELECT * FROM    GXTRJDTA.TCOAUX 
inner JOIN GXBDBPS.TAFINAF t  ON ENEMISO =  SUBSTRING(AUXCLAV,1,3) AND BIBINES = SUBSTRING(AUXCLAV,4,6) AND AFAFINI  = SUBSTRING(AUXCLAV,10,3)
LEFT JOIN GXTRJDTA.TCoEnC  C ON C.EnCEntAnt = SUBSTRING(AUXCLAV,1,3)
left JOIN  GXTRJDTA.TDSDPS  ON  DPSSECUE=   c.ENCENTACT 
WHERE AUXTBL in('TMANENCTA' )  AND AUXFEHO >= '2020-08-01-00.00.00.000000' AND AUXFEHO <= '2020-08-31-23.59.59.000000' AND  AUXEST = 'X';




