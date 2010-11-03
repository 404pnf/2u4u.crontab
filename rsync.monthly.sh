# bxy: do this twice a month with --delete to remove the unnecessary files
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /var/www/ /backup/www.html.backup/

