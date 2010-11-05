#!/bin/bash

##############################
#
# adpated from yhager's rsync based backup scripts at github
#
#
#############################


# Credentials that can backup the databases
DB_USER="root"
DB_PASS="9dccf462d245f55ac3e0cdb0e5401f5b"
DB_HOST="localhost"

# Binaries
# (uncomment ECHO to achieve a "dry run" effect)
#ECHO="/bin/echo"
##########  NOTE ############
# bxy: 
# need to set mysql path to have mysql_backups.sh work
#That shell script just don't work when called from cron.  But the script is correct
# since i can run it with ether sh mysql._backup.sh or /full/path/mysql_backup.sh in bash
# This drives me mad!
# After search, I notice cron has a very limit knowledge of system path
# although jean export the complied version of mysql to path
# cron might not get it
# so i set the MYSQL path here and call mysql with ${MYSQL} in the cmd
# Voila!  It works!
MYSQLDUMP="/home/apache/apps/mysql/bin/mysqldump"
MYSQL="/home/apache/apps/mysql/bin/mysql"
BZIP2="/usr/bin/bzip2"


# Local directory for dump files
MYSQL_BACKUP_DIR=/backup/mysql/

#####################################
### Edit Below If Necessary ######### 
#####################################
cd $MYSQL_BACKUP_DIR
DATE=`eval date +%Y-%m-%d`
NOW=`date +'%Y%m%d.%H%M%S'`

# Optimize the table structure nightly
#mysqlcheck -u$DBUSER -p$DBPASSWD -h$DBHOST -oA

DBS=`${MYSQL} -u$DB_USER -p$DB_PASS -h$DB_HOST -e"show databases"`

for DATABASE in $DBS
do
        if [ $DATABASE != "Database" ]; then
                echo "Dumping $DATABASE now..."
		BASE=${DATABASE}.$NOW
                ${MYSQLDUMP} -u$DB_USER -p$DB_PASS -h$DB_HOST --lock-tables --add-drop-table --skip-dump-date -e $DATABASE > ${BASE}.sql

                ${BZIP2} -f9 ${BASE}.sql
                chmod 0400 ${BASE}.sql.bz2

        fi
done

# Delete files older than 21 days
for i in `find $MYSQL_BACKUP_DIR -mtime +21|sort`; do (rm $i); done;

exit 0
