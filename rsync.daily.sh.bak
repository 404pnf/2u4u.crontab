
# bxy: --exculude-from 后面的路径需要是单引号！！！ 否则老出奇怪问题！

# bxy: 这里我不用压缩，也就是rsync的 -z 开关。因为这是在同一台
# 机器上从一块硬盘复制到另一块，启用压缩只会增加cpu和计算时间
# 不会有任何带宽和速度上的提高，应该速度有降低才对。

# bxy: do this sync daily without --delete, would ranther err on the side of a bloated backup 
# bxy: backup /var/www the whole directory because static.files is in that dir

# 先复制站点的文件夹，这里用 /home/apache/data，因为 
# /var/www/html 是它的一个soft link

rsync -av --exclude-from='/backup-sata/rsync.exclude.rules' /home/apache/data/ /backup-sata/www.html.backup/

# bxy: notice the ending slash of source does matter
# e.g  /home/apps/ /backup/ wouldn't create a apps directory in destination
# therefore mess up the /backup/ directory structure

# 备份所有自己编译的程序。这台及其，nginx, apache, php, 
# php-cgi, mysql, xcache, swftools等都是自己编译的
rsync -av --exclude-from='/backup-sata/rsync.exclude.rules.apps' /home/apache/apps/ /backup-sata/app.backup/apps/

# 这里备份myapp下我在其它机器上编译的程序，也就是swftools
# 这是我在223上编译的，因为可以方便用apt-get安装xpdf-* 语言包
# 然后编译后/编译时挂上这些语言包 具体我忘了。
rsync -av  --exclude-from='/backup-sata/rsync.exclude.rules' /home/myapp/ /backup-sata/app.backup/myapp/

# 备份crontab脚本
rsync -av --exclude-from='/backup-sata/rsync.exclude.rules' /root/crontab /backup-sata/

# 备份drush脚本，主要是备份站点别名文件 alias.drushrc.php
rsync -av --exclude-from='/backup-sata/rsync.exclude.rules' /root/drush /backup-sata/
