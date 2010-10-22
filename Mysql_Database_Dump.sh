#!/bin/sh
#writen by jeantoe 2009/12/20 jeantoe@gmail.com
DBS="2u4u zuowen mysql gps quiz shop group babel video ebook"
for db in $DBS
do
  /home/apache/apps/mysql/bin/mysqldump -uroot -p9dccf462d245f55ac3e0cdb0e5401f5b -q --opt --single-transaction --extended-insert=false --max_allowed_packet=64M  $db | gzip > /backup/Mysql.Back.Up/Mysql_Dump_${db}/${db}.`date +%Y%m%d%H`.sql.gz
done
