
# bxy: do this sync daily without --delete, would ranther err on the side of a bloated backup 
# bxy: backup /var/www the whole directory because static.files is in that dir
rsync -av --exclude-from="/backup/rsync.exclude.rules" /var/www/ /backup/www.html.backup/
