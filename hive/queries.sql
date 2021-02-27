beeline -u "jdbc:hive2://hive_dev.binaryjungle.com:3456/default;principal=hive/hive_dev.binaryjungle.com@binaryjungle.com;transptts;httpsPath=cliservice;ssl=true;sslTrustStore=/home/tutor/truststore.jks"
beeline -u "jdbc:hive2://hive_dev.binaryjungle.com:3456/default;principal=hive/hive_dev.binaryjungle.com@binaryjungle.com;transptts;httpsPath=cliservice;ssl=true;sslTrustStore=/home/tutor/truststore.jks" -f /home/tutor/hql_file_name.hql

MSCK REPAIR TABLE DB_NAME.TBL_NAME;
set hive.groupby.orderby.position.alias=true

SHOW ROLE GRANT GROUP grp_students_all;
SHOW GRANT ROLE role_students_all;

CREATE DATABASE MASTER_STUDENTS_DB;
CREATE ROLE role_students_all;
GRANT ALL ON DATABASE MASTER_STUDENTS_DB TO ROLE role_students_all;
GRANT SELECT ON DATABASE MASTER_STUDENTS_DB TO ROLE role_students_read_only;
GRANT ALL uri 'hdfs://nameservice1/home/tutor/data' TO ROLE role_students_all;
GRANT ROLE role_students_all TO GROUP grp_students_all;

grp_students_ro <- role_students_ro=server=server1->db=MASTER_STUDENTS_DB->action=select
grp_students_ro,grp_students_so <- role_students_ro=server=server1->db=MASTER_STUDENTS_DB,MASTER_TEACHERS_DB->action=select

SHOW PARTITIONS MASTER_STUDENTS_DB.TENTH_CLASS;

ALTER PARTITIONS MASTER_STUDENTS_DB.TENTH_CLASS;
ADD IF EXISTS PARTITION (SECTION='D');

ALTER PARTITIONS MASTER_STUDENTS_DB.TENTH_CLASS;
DROP IF EXISTS PARTITION (SECTION='E');

--No Partition
CREATE TABLE MASTER_STUDENTS_DB.ALUMNI
(
ID INT
,FIRST_NAME VARCHAR(100)
,LAST_NAME VARCHAR(100)
,GENDER CHAR(1)
,DATE_OF_EXIT STRING
,TWELTH_EXAM_PERCENT DECIMAL(3,2)
,LOAD_TMP TIMESTAMP
,YEAR_OF_EXIT STRING
)
STORED AS PARQUET
LOCATION 'hdfs:/home/tutor/students/master_students_db/alumni';

--With Partition
CREATE TABLE MASTER_STUDENTS_DB.ALUMNI
(
ID INT
,FIRST_NAME VARCHAR(100)
,LAST_NAME VARCHAR(100)
,GENDER CHAR(1)
,DATE_OF_EXIT STRING
,TWELTH_EXAM_PERCENT DECIMAL(3,2)
,LOAD_TMP TIMESTAMP
)
PARTITIONED BY (YEAR_OF_EXIT STRING)
STORED AS PARQUET
LOCATION 'hdfs:/home/tutor/students/master_students_db/alumni';\

--Kudu
CREATE TABLE MASTER_STUDENTS_DB.ALUMNI
(
ID INT
,FIRST_NAME VARCHAR(100)
,LAST_NAME VARCHAR(100)
,GENDER CHAR(1)
,DATE_OF_EXIT STRING
,TWELTH_EXAM_PERCENT DECIMAL(3,2)
,LOAD_TMP TIMESTAMP
)
PRIMARY KEY (ID)
PARTITION BY HASH (ID)
PARTITIONS 3
STORED AS KUDU;
