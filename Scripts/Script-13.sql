
SELECT   (GXC1 - GXC2) AS F1, 
         F2 
FROM     (SELECT T1.SecFHFin   AS GXC1, 
                 T1.SeCFHIni   AS GXC2, 
                 T2.PrcDsProce AS F2, 
                 T1.CrtFHCorte AS A1, 
                 T1.CrtSecue   AS A2 
          FROM   (GXTRJDTA.TCASeC T1 
                  INNER JOIN GXTRJDTA.TDSPrc T2 
                    ON T2.PrcIdProce = T1.PrcIdProce) 
          WHERE (T1.CrtSecue = 1))
ORDER BY A1, 
         A2 
FOR FETCH ONLY   ;       
                

select COUNT(*) from YAPI.tswaut where  AUTTRXFCHC='20201028' AND AUTESTCLE = 'N';