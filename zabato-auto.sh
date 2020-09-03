#!/bin/bash
# Leonardo José Zanotti

orig=/home/leonardozanotti/origem/          # origin dir
dest=/home/leonardozanotti/Desktop/destino/         # destine dir
logfile=/home/leonardozanotti/Desktop/NovaPasta/logs.txt      # log file 

rsync -auv --progress --delete --exclude='.DS_Store' --log-file=$logfile $orig $dest        ## official backup

echo `date +"%F %T"`\ '- Auto backup done' >> $logfile