-------asientos
SELECT * FROM FACTURACIONBEPSA.CLIENTE C WHERE clienteid='1204822';
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;
SELECT * FROM FACTURACIONBEPSA.RUTACOMERCIAL R;
-------------
SELECT * FROM FACTURACIONBEPSA.SECUSER S;
SELECT * FROM FACTURACIONBEPSA.FACVENTA F;
SELECT * FROM FACTURACIONBEPSA.timbradocomprobantecaja T;--CAMBIAR NRO FACTURA.
---correosm
INSERT INTO asientos.email_users (email,email_description,status,modulo) VALUES
     ('mathias.lovera@clt.com.py','Correo de Mathias','1','Asientos'),
     ('jlaran@bepsa.com.py','Eduardo Larán','1','Asientos'),
     ('bravetti@bepsa.com.py','Blás Ravetti','1','Asientos'),
     ('vdiaz@bepsa.com.py','Vanessa Diaz','1','Asientos'),
     ('jchamorro@bepsa.com.py','Jose Chamorro','1','Asientos'),
     ('esteban.marques@bepsa.com.py','Esteban Marques','1','Asientos'),
     ('wilson.medina@bancontinental.com.py','Wilson Medina','1','Asientos'),
     ('marcas@bepsa.com.py','Marcas','1','Asientos'),
     ('conciliaciones@bepsa.com.py','Conciliaciones','1','Asientos'),
     ('mathias.lovera@clt.com.py','Correo','1','Facturacion');
INSERT INTO asientos.email_users (email,email_description,status,modulo) VALUES
     ('juan.mendoza@clt.com.py','Correo','1','Facturacion'),
     ('carlos@cmsistemas.com.py','Correo','1','Facturacion'),
     ('jlaran@bepsa.com.py','Eduardo Larán','1','Facturacion'),
     ('ernesto.ruizdiaz@bepsa.com.py','Ernesto','1','Asientos'),
     ('carlos@cmsistemas.com.py','Correo de Carlos','1','Asientos'),
     ('juan.mendoza@clt.com.py','Correo','1','Asientos');
--------------------------------------------------------------
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P WHERE PARMID='asientoPorCurl';
--https://k2basientos.bepsa.com.py/k2b_bepsa/servlet/com.k2b.awsimpbepsagenerarasiento
SELECT * FROM asientos.email_users;
----pase 20230721

SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;
SELECT * FROM FACTURACIONBEPSA.SECUSERROLE S;
SELECT * FROM FACTURACIONBEPSA.SECUSERROLE S;
SELECT * FROM FACTURACIONBEPSA.SECROLE S;
SELECT * FROM FACTURACIONBEPSA.SECFUNCTIONALITYROLE S;
SELECT * FROM FACTURACIONBEPSA.SECFUNCTIONALITY S;

SELECT * FROM PG_USER PU