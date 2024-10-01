select * from libdebito.drconbep where LIDCOM='1001254' and limpgs='800000.00' and lfectr='20210225'

select * from libdebito.drconbep where LIDCOM='1001254' and lfectr='20210317'

UPDATE libdebito.drconbep SET LESTTR='R'
where LIDCOM='1001254' and limpgs='800000.00' and lfectr='20210225'

--Sentencias para devolver saldo operativo

select * from libdebito.BST015 where BS15CODCOM='     1000414'

update libdebito.BST015 set BS15MONSAL=(BS15MONSAL+800000.00)
where BS15CODCOM='     1000414'

select * from gxweb.BST015w where BS15CODCOM='     1000414'

update gxweb.BST015w set BS15MONSAL=(BS15MONSAL+800000.00)
where BS15CODCOM='     1000414'



select * from libdebito.BST021 where BS21CODCOM='     1000414'

