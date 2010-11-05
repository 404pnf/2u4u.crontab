
# bxy: do this sync daily without --delete, would ranther err on the side of a bloated backup 
# bxy: backup /var/www the whole directory because static.files is in that dir
rsync -av --exclude-from="/backup/rsync.exclude.rules" /home/apache/data/ /backup/www.html.backup/

# bxy: notice the ending slash of source does matter
# e.g  /home/apps/ /backup/ wouldn't create a apps directory in destination
# therefore mess up the /backup/ directory structure
rsync -av --exclude-from="/backup/rsync.exclude.rules" /home/apache/apps/ /backup/app.backup/apps/
rsync -av --delete --exclude-from="/backup/rsync.exclude.rules" /home/myapp/ /backup/app.backup/myapp/

