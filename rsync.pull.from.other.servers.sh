
# bxy: do this sync daily without --delete, would ranther err on the side of a bloated backup 
# bxy: backup /var/www the whole directory because static.files is in that dir

# pull /backup/ from 223 to here
rsync -av --delete --exclude-from="/backup-sata/rsync.exclude.rules" 223:/backup/ /backup-sata/223.backup/

# bxy: notice the ending slash of source does matter
# e.g  /home/apps/ /backup/ wouldn't create a apps directory in destination
# therefore mess up the /backup/ directory structure

