
# bxy: do this sync daily without --delete, would ranther err on the side of a bloated backup 
rsync -a --exclude-from="/backup/rsync.exclude.rules" /var/www/ /backup/www.html.bacup/

# bxy: do this once a month with --delete to remove the unnecessary files
rsync -a --delete --exclude-from="/backup/rsync.exclude.rules" /var/www/ /backup/www.html.bacup/

