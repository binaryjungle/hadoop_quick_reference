hdfs dfs -help
hdfs dfs -help count
hdfs dfs -help get
hdfs dfs -help ls

hdfs dfsadmin -setSpaceQuota 308G /hdfs/tutor/teachers [with replication]
hdfs dfs -count -q -h -v /hdfs/tutor/teachers
hdfs dfs -du -h /hdfs/tutor/teachers

hdfs dfs -ls /hdfs/tutor/teachers
hdfs dfs -ls /hdfs/tutor/teachers/file_name.dat
hdfs dfs -ls -C /hdfs/tutor/teachers
hdfs dfs -ls -R /hdfs/tutor/teachers
hdfs dfs -ls -c /hdfs/tutor/teachers
hdfs dfs -ls -r /hdfs/tutor/teachers

hdfs dfs -rmdir /hdfs/tutor/teachers
hdfs dfs -mkdir /hdfs/tutor/teachers
hdfs dfs -chown -R tutor:staff /hdfs/tutor/teachers
hdfs dfs -chmod -R 750 /hdfs/tutor/teachers

hdfs dfs -touchz /hdfs/tutor/teachers/file_name.dat
hdfs dfs -cat /hdfs/tutor/teachers/file_name.dat
hdfs dfs -head /hdfs/tutor/teachers/file_name.dat
hdfs dfs -tail /hdfs/tutor/teachers/file_name.dat

hdfs dfs -copyToLocal /hdfs/tutor/teachers/file_name.dat /home/tutor/teachers/
hdfs dfs -get /hdfs/tutor/teachers/file_name.dat /home/tutor/teachers/
hdfs dfs -get -p /hdfs/tutor/teachers/ /home/tutor/teachers/

hdfs dfs -copyFromLocal /home/tutor/teachers/file_name.dat /hdfs/tutor/teachers/
hdfs dfs -put /home/tutor/teachers/* /hdfs/tutor/teachers/

hdfs dfs -rm /hdfs/tutor/teachers/file_name.dat
hdfs dfs -rm -R -skipTrash /hdfs/tutor/teachers

hdfs dfs -setfacl -m -R user:hive:rwx,default:user:hive:rwx /hdfs/tutor/teachers
hdfs dfs -setfacl -m -R group:grp_teachers_all:rwx,default:group:grp_teachers_all:rwx /hdfs/tutor/teachers

hdfs dfs -getfacl /hdfs/tutor/teachers
hdfs dfs -getfacl -R /hdfs/tutor/teachers
