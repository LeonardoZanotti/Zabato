#!/bin/bash
# Leonardo José Zanotti

echo '
                                                  mm
               #               m               /^(  )^\
 mmmmmm        #               m               \,(..),/      
     #"  mmm   #mmm    mmm   mm#mm   mmm         V~~V 
   m#   "   #  #" "#  "   #    #    #" "#
  m"    m"""#  #   #  m"""#    #    #   #
 ##mmmm "mm"#  ##m#"  "mm"#    "mm  "#m#"
                                          
Zanotti backup tool

'

orig=./origem/          # origin dir
dest=./destino/         # destine dir
logfile=./logs.txt      # log file 

echo "You want to make a backup from ${orig} to ${dest} ?   [y/n]"
read resp
if [ $resp = 'y' ] || [ $resp = 'Y' ]; then
    clear
    echo 'Please confirm the following actions'
    echo
    rsync -auvn --progress --delete --exclude='.DS_Store' --log-file=$logfile $orig $dest       ## backup test to confirm the backup
    echo
    echo -n "Transfering " && du -sh $orig && echo "Continue? [y/n]"    
    read resp
    if [ $resp = 'y' ] || [ $resp = 'Y' ]; then
        rsync -auv --progress --delete --exclude='.DS_Store' --log-file=$logfile $orig $dest        ## official backup
    else
        echo 'Aborting...'
        exit
    fi
else
    echo 'Aborting...'
    exit
fi

echo 'Backup done'