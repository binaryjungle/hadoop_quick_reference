#Listing available kafka topics
./bin/kafka-topics --zookeeper srvr000101:3456 --list

kafka-topics --create --zookeeper srvr000101:3456,srvr000102:3456 --replication-factor 3 --partitions 50 --topic students_topic
kafka-topics --list --zookeeper srvr000101:3456,srvr000102:3456
kafka-topics --delete --zookeeper srvr000101:3456 -topic students_topic

kafka-sentry -cr -r role_students_topic_all;
kafka-sentry -gpr -r role_students_topic_all -p "Host=*->Topic=students_topic->action=ALL"
kafka-sentry -arg -r role_students_topic_all -g grp_students_all;

kafka-sentry -gpr -r role_students_topic_all -p "Host=*->Consumergroup=students->action=ALL"
kafka-sentry -gpr -r role_students_topic_all -p "Host=*->Consumergroup=spark-executor-students->action=ALL"

kafka-sentry -lr -g grp_students_all;


