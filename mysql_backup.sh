#!/bin/bash

##############################
#
# adpated from yhager's rsync based backup scripts at github
#
#
#############################


# Credentials that can backup the databases
DB_USER="root"
DB_PASS="0220f96ff9d82ef5abfb553fab28a3d9"
DB_HOST="localhost"

# Binaries
# (uncomment ECHO to achieve a "dry run" effect)
#ECHO="/bin/echo"
MYSQLDUMP="${ECHO} /usr/bin/mysqldump"
BZIP2="${ECHO} /bin/bzip2"


# Local directory for dump files
MYSQL_BACKUP_DIR=/backup/mysql/

#####################################
### Edit Below If Necessary ######### 
#####################################
cd $MYSQL_BACKUP_DIR
DATE=`eval date +%Y-%m-%d`
NOW=`date +'%Y-%m-%d.%H:%M:%S'`

# Optimize the table structure nightly
#mysqlcheck -u$DBUSER -p$DBPASSWD -h$DBHOST -oA

DBS=`mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -e"show databases"`

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
