# bxy: do this twice a month with --delete to remove the unnecessary files
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules" /home/apache/data/ /backup-sata/www.html.backup/
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules.apps" /home/apache/apps/ /backup-sata/app.backup/apps/
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules" /home/myapp/ /backup-sata/app.backup/myapp/
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules" /root/crontab /backup-sata/
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules" /root/drush /backup-sata/

