beeline -u "jdbc:hive2://hive_dev.binaryjungle.com:3456/default;principal=hive/hive_dev.binaryjungle.com@binaryjungle.com;transptts;httpsPath=cliservice;ssl=true;sslTrustStore=/home/tutor/truststore.jks"
beeline -u "jdbc:hive2://hive_dev.binaryjungle.com:3456/default;principal=hive/hive_dev.binaryjungle.com@binaryjungle.com;transptts;httpsPath=cliservice;ssl=true;sslTrustStore=/home/tutor/truststore.jks" -f /home/tutor/hql_file_name.hql
MSCK REPAIR TABLE DB_NAME.TBL_NAME;
set hive.groupby.orderby.position.alias=true
SHOW ROLE GRANT GROUP grp_students_all;
SHOW GRANT ROLE role_students_all;

CREATE DATABASE MASTER_STUDENTS_DB;
CREATE ROLE role_students_all;
GRANT ALL ON DATABASE MASTER_STUDENTS_DB TO role_students_all;
GRANT ALL ON uri 'hdfs://hdfs/home/tutor/data' to role_students_all;
GRANT ROLE role_students_all TO grp_students_all;

grp_students_ro <- role_students_ro=server=server1->db=MASTER_STUDENTS_DB->action=select
