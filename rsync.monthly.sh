# bxy: do this twice a month with --delete to remove the unnecessary files
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /home/apache/data/ /backup/www.html.backup/
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /home/apache/apps/ /backup/app.backup/apps/
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /home/myapp/ /backup/app.backup/myapp/
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /root/crontab /backup/

