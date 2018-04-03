## https://community.arubanetworks.com/t5/AirWave-and-Network-Management/Airwave-SCP-backup-script/m-p/10079

#!/usr/bin/expect -f

## Name: Mike Courtney
## Institution: Washington and Lee University
## Date: 2/19/2011
## Function: This program will scp a copy of the most recent Airwave database to a backup server 

## Execution: ./airwave-backup.sh 
## Execution example: ./airwave-backup.sh /var/airwave-backup/nightly_data001.tar.gz

## Location: I have placed the program in the /root directory

## Permissions: chmod 700 root:root airwave-backup.sh

## Crontab: The following crontab entry will run every morning at 6am: 
## 00 06 * * * root /root/airwave-backup.sh /var/airwave-backup/nightly_data001.tar.gz 
## Run the following command after the change: /etc/init.d/crond restart

## Run the following command from the shell to determine the location of expect:
## which expect

## Example output:
## # which expect
## /usr/bin/expect

## The first line of the program may need to be modified if the expect
## location is differnet. 

## Run the following command if expect is not installed on the Airwave server:
## yum install expect

##################################################################################################

## MAIN PROGRAM

set ampBackupFile 
set timeout -1

## VARIABLES

## These individual variables should be tailored to your specific environment

set userName "yourusername"
set userPassword "yourpassword"
set backupServer "server.domain.com"
set backupServerPath "/home/yourusername/directory"
set ampVersionPath "/usr/local/airwave/bin/"

## This is the name of the file as it will appear on the remote server

set backupFile "-nightly_data--.tar.gz"

## Backup file example: airwave-nightly_data-7.2.1-02192011.tar.gz

## END VARIABLES

## TESTING

## Remove the pound (#) symbol from the below command to test your output.
## Remember to also place a pound in front of the code in the "BEGIN SCP" section

#puts "$ampBackupFile $userName@$backupServer:$backupServerPath/$backupFile"

## END TESTING

## BEGIN SCP 

## This will run the scp command
spawn scp $ampBackupFile $userName@$backupServer:$backupServerPath/$backupFile

## These are the specific expect commands to complete the SCP to the backup server

expect {
password: {send "$userPassword\r" ; exp_continue}
eof exit
}

## END SCP

## END OF MAIN PROGRAM

##################################################################################################
