--brelac
SELECT DISTINCT  WHPNAM,WHTEXT FROM YAPI.BRELACPROD WHERE WHFNAM LIKE '%GXJAVA9419%';
----------------GUIDO sistema as400 tablas
SELECT * FROM QSYS2.SYSTABLES;
SELECT * FROM QGPL.ARCHIDAT;
SELECT * FROM QSYS2.TABLE_CONSTRAINTS;
select * from qgpl.qadspobjd;
select * from qsys2.authorization_list_info where SYSTEM_OBJECT_SCHEMA = 'FEATMSLIB';
SELECT SYSTEM_OBJECT_SCHEMA, SYSTEM_OBJECT_NAME
FROM QSYS2.OBJECT_PRIVILEGES
WHERE SYSTEM_OBJECT_SCHEMA = 'FEATMSLIB'
AND AUTHORIZATION_NAME = 'FEATMSUSR';
--------------------------------------------ver log as
--LOG
SELECT * FROM TABLE(QSYS2.HISTORY_LOG_INFO()) A ;
SELECT *  FROM TABLE(QSYS2.HISTORY_LOG_INFO(CURRENT TIMESTAMP - 10 DAY)) A  ;
SELECT *  FROM TABLE(QSYS2.HISTORY_LOG_INFO(CURRENT TIMESTAMP - 1 DAY)) A WHERE FROM_USER = 'BEPSA';
SELECT * FROM TABLE(QSYS2.HISTORY_LOG_INFO('2023-07-22-05.00.00.000000', '2023-07-22-06.10.00.000000')) A WHERE FROM_USER = 'VISAUSR' --AND FROM_JOB_NAME='VISAADQJ';
--AND FROM_JOB LIKE '%INCOMING%';
AND FROM_PROGRAM='VIBCNV002B';
SELECT MESSAGE_ID,MESSAGE_TYPE AS MESSAGE_TYPE,SEVERITY,MESSAGE_TIMESTAMP AS TIMESTAMP,FROM_USER,FROM_JOB,
CAST(MESSAGE_TEXT AS CHAR(200) CCSID 37)
AS MESSAGE_TEXT,
CAST(MESSAGE_SECOND_LEVEL_TEXT AS CHAR(1000) CCSID 37)
AS MESSAGE_TEXT_2
FROM TABLE(QSYS2.HISTORY_LOG_INFO('2023-02-22-05.00.00.000000','2023-02-22-06.00.00.000000')) A WHERE SEVERITY >= 30
ORDER BY ORDINAL_POSITION;
------------------------------------
--para ver subsistemas activos
SELECT * FROM QSYS2.SUBSYSTEM_INFO WHERE STATUS = 'ACTIVE';
--descripcion de subsistemas
SELECT * FROM QSYS2.SUBSYSTEM_INFO WHERE STATUS = 'ACTIVE' OR STATUS = 'ENDING' OR STATUS = 'INACTIVE' OR STATUS = 'RESTRICTED' OR STATUS = 'STARTING';
---WRKACTJOB
SELECT * FROM TABLE(QSYS2.ACTIVE_JOB_INFO(RESET_STATISTICS=> 'NO',
        SUBSYSTEM_LIST_FILTER=>'',
        JOB_NAME_FILTER=>'*ALL',
        CURRENT_USER_LIST_FILTER=>'',
        DETAILED_INFO=>'ALL')) limit 100 offset 0;
-----FILTRAR POR TIPO MENSAJE
SELECT * FROM TABLE (QSYS2.ACTIVE_JOB_INFO( RESET_STATISTICS=> 'NO',
        SU  BSYSTEM_LIST_FILTER=>'',
        JOB_NAME_FILTER=>'*ALL',
        CURRENT_USER_LIST_FILTER=>'',
        DETAILED_INFO=>'ALL')) WHERE  upper(JOB_STATUS) LIKE 'MSGW%'  limit 100 offset 0;
---PARA VER USUARIOS
SELECT * FROM QSYS2.USER_INFO WHERE GROUP_ID_NUMBER=0   limit 100 offset 0;
SELECT * FROM QSYS2.USER_INFO WHERE GROUP_ID_NUMBER=0   AND  upper(AUTHORIZATION_NAME) LIKE 'U99%' AND STATUS='*ENABLED' AND TEXT_DESCRIPTION LIKE '%NOC%' limit 100 offset 0;
----activo
SELECT a.SYSTEM_ASP_USED,a.ACTIVE_JOBS_IN_SYSTEM,b.AVERAGE_CPU_UTILIZATION
FROM QSYS2.SYSTEM_STATUS_INFO_BASIC AS a
        JOIN TABLE (QSYS2.SYSTEM_ACTIVITY_INFO()) AS b
ON 1 = 1;
--------------------
/*cola de mensajes*/
SELECT OBJNAME,
       OBJLIB,
       OBJTEXT
    FROM TABLE (QSYS2.OBJECT_STATISTICS('*ALL','*MSGQ'));
/*cola de trabajos*/
SELECT *
    FROM QSYS2.JOB_QUEUE_INFO
    WHERE ACTIVE_JOBS IS NOT NULL;
/*mis mensajes*/
SELECT A.MESSAGE_ID,A.MESSAGE_TYPE,
       CASE
           WHEN B.MESSAGE_KEY IS NULL THEN 'NO'
           ELSE 'YES'
       END AS NEED_REPLY, A.MESSAGE_TEXT,A.SEVERITY,A.MESSAGE_TIMESTAMP,A.MESSAGE_KEY,A.ASSOCIATED_MESSAGE_KEY,A.FROM_USER,A.FROM_JOB,A.FROM_PROGRAM,
A.MESSAGE_FILE_LIBRARY,A.MESSAGE_FILE_NAME,A.MESSAGE_TOKENS,A.MESSAGE_SECOND_LEVEL_TEXT,A.MESSAGE_SUBTYPE,
       MESSAGE_QUEUE_LIBRARY_NAME AS MESSAGE_QUEUE_LIBRARY,
       MESSAGE_QUEUE_NAME
    FROM QSYS2.USER_INFO_BASIC,
       TABLE (QSYS2.MESSAGE_QUEUE_INFO(QUEUE_LIBRARY => MESSAGE_QUEUE_LIBRARY_NAME,
       QUEUE_NAME => MESSAGE_QUEUE_NAME)) AS A
       LEFT JOIN TABLE (QSYS2.MESSAGE_QUEUE_INFO(QUEUE_LIBRARY => MESSAGE_QUEUE_LIBRARY_NAME,QUEUE_NAME => MESSAGE_QUEUE_NAME,MESSAGE_FILTER => 'INQUIRY')) AS B
ON A.MESSAGE_KEY = B.MESSAGE_KEY
WHERE AUTHORIZATION_NAME = 'U99ADOLFO'
ORDER BY A.MESSAGE_TIMESTAMP DESC;
------------------------------------
--sintaxis de como tomar la informacion del espacio ocupado en los ifs..
--prueba con la función SQL qsys2.ifs_object_statistics  Te paso un ejemplo
select path_name, object_type, data_size, object_owner, create_timestamp, access_timestamp,
       data_change_timestamp, object_change_timestamp
  from table (
      qsys2.ifs_object_statistics(
        start_path_name => '/',
        subtree_directories => 'YES',
        object_type_list => '*ALLDIR *NOQSYS'))
   where  data_size is not null and object_owner not in ('QSYS')
   order by 3 desc
   limit 10;
--Esto te devuelve los 10 directorios más pesados, excluyendo /qsys. Lo saqué de los ejemplos publicados en SQL Script de ACS
--usuarios
SELECT AUTHORIZATION_NAME,
       PREVIOUS_SIGNON,
       SIGN_ON_ATTEMPTS_NOT_VALID,
       STATUS,
       NETSERVER_DISABLED,
       PASSWORD_CHANGE_DATE,
       NO_PASSWORD_INDICATOR,
       PASSWORD_LEVEL_0_1,
       PASSWORD_LEVEL_2_3,
       PASSWORD_EXPIRATION_INTERVAL,
       DATE_PASSWORD_EXPIRES,
       DAYS_UNTIL_PASSWORD_EXPIRES,
       SET_PASSWORD_TO_EXPIRE,
       USER_CLASS_NAME,
       SPECIAL_AUTHORITIES,
       GROUP_PROFILE_NAME,
       SUPPLEMENTAL_GROUP_COUNT,
       SUPPLEMENTAL_GROUP_LIST,
       OWNER,
       GROUP_AUTHORITY,
       ASSISTANCE_LEVEL,
       CURRENT_LIBRARY_NAME,
       INITIAL_MENU_NAME,
       INITIAL_MENU_LIBRARY_NAME,
       INITIAL_PROGRAM_NAME,
       INITIAL_PROGRAM_LIBRARY_NAME,
       LIMIT_CAPABILITIES,
       CAST(TEXT_DESCRIPTION AS VARCHAR(50) CCSID 284) AS TEXT_DESCRIPTION,
       DISPLAY_SIGNON_INFORMATION,
       LIMIT_DEVICE_SESSIONS,
       KEYBOARD_BUFFERING,
       MAXIMUM_ALLOWED_STORAGE,
       STORAGE_USED,
       HIGHEST_SCHEDULING_PRIORITY,
       JOB_DESCRIPTION_NAME,
       JOB_DESCRIPTION_LIBRARY_NAME,
       ACCOUNTING_CODE,
       MESSAGE_QUEUE_NAME,
       MESSAGE_QUEUE_LIBRARY_NAME,
       MESSAGE_QUEUE_DELIVERY_METHOD,
       MESSAGE_QUEUE_SEVERITY,
       OUTPUT_QUEUE_NAME,
       OUTPUT_QUEUE_LIBRARY_NAME,
       PRINT_DEVICE,
       SPECIAL_ENVIRONMENT,
       ATTENTION_KEY_HANDLING_PROGRAM_NAME,
       ATTENTION_KEY_HANDLING_PROGRAM_LIBRARY_NAME,
       LANGUAGE_ID,
       COUNTRY_OR_REGION_ID,
       CHARACTER_CODE_SET_ID,
       USER_OPTIONS,
       SORT_SEQUENCE_TABLE_NAME,
       SORT_SEQUENCE_TABLE_LIBRARY_NAME,
       OBJECT_AUDITING_VALUE,
       USER_ACTION_AUDIT_LEVEL,
       GROUP_AUTHORITY_TYPE,
       USER_ID_NUMBER,
       GROUP_ID_NUMBER,
       LOCALE_JOB_ATTRIBUTES,
       GROUP_MEMBER_INDICATOR,
       DIGITAL_CERTIFICATE_INDICATOR,
       CHARACTER_IDENTIFIER_CONTROL,
       LOCAL_PASSWORD_MANAGEMENT,
       BLOCK_PASSWORD_CHANGE,
       USER_ENTITLEMENT_REQUIRED,
       USER_EXPIRATION_INTERVAL,
       USER_EXPIRATION_DATE,
       USER_EXPIRATION_ACTION,
       HOME_DIRECTORY,
       LOCALE_PATH_NAME,
       USER_DEFAULT_PASSWORD,
       USER_OWNER,
       USER_CREATOR,
       SIZE,
       CREATION_TIMESTAMP,
       LAST_USED_TIMESTAMP,
       DAYS_USED_COUNT,
       LAST_RESET_TIMESTAMP,
       AUTHORITY_COLLECTION_ACTIVE,
       AUTHORITY_COLLECTION_REPOSITORY_EXISTS,
       PASE_SHELL_PATH
    FROM QSYS2.USER_INFO
       -- WHERE INITIAL_PROGRAM_NAME='MNUCL000' AND INITIAL_MENU_NAME='DEBMN100'
    WHERE GROUP_ID_NUMBER = 0
AND AUTHORIZATION_NAME LIKE 'U101%'
    --LIMIT 100    OFFSET 0;
-------------
SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME , MAXIMUM_MESSAGE_LENGTH, CURRENT_MESSAGES FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%LOGQ%';
--con esta sentencia se puede ver todos los programas y mensajes que graba
select ordinal_position,CAST(message_data as char(200)) from table(qsys2.data_queue_entries(data_queue => 'LOGQ', data_queue_library =>'QUSRTOOLS'));
--
SELECT *
FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%LOGQ%';
--PARA VER SOTREDPROCEDURE
SELECT * FROM QSYS2.SYSPROCS S WHERE SPECIFIC_NAME LIKE '%%';
/*para ver puertos habilitados*/
SELECT LOCAL_PORT, LOCAL_PORT_NAME, BIND_USER, IDLE_TIME
FROM QSYS2.NETSTAT_INFO
where LOCAL_ADDRESS = '0.0.0.0';
---listar fuentes
QSYS/DSPFD FILE(MASTERCARD/QMAINPGIPM) TYPE(*MBRLIST);
--ver bloqueos en el joblog
with my_spooled_files (job, file, file_number, user_data, create_timestamp) as (select job_name, spooled_file_name, file_number, user_data, create_timestamp
 from qsys2.output_queue_entries_basic where spooled_file_name = 'QPJOBLOG'
 and CREATE_TIMESTAMP > CURRENT TIMESTAMP - 48 hours order by create_timestamp desc), all_my_spooled_file_data (job, file, file_number, spool_data)
 as (select job, file, file_number, spooled_data from my_spooled_files,  table ( systools.spooled_file_data(job_name => job, spooled_file_name => file,
 spooled_file_number => file_number) ) ) select * from all_my_spooled_file_data where SUBSTR(spool_data, 1, 15) like '%CPF3203%';

with my_spooled_files (job, file, file_number, user_data, create_timestamp) as (select job_name, spooled_file_name, file_number, user_data, create_timestamp
 from qsys2.output_queue_entries_basic where spooled_file_name = 'QPJOBLOG'
 and CREATE_TIMESTAMP > CURRENT TIMESTAMP - 48 hours order by create_timestamp desc), all_my_spooled_file_data (job, file, file_number, ordinal_position, spool_data)
 as (select job, file, file_number, ordinal_position, spooled_data from my_spooled_files,  table (systools.spooled_file_data(job_name => job, spooled_file_name => file,
 spooled_file_number => file_number) ) ) select * from all_my_spooled_file_data where SUBSTR(spool_data, 1, 15) like '%CPF3203%';
--------------------------------------------------------------
