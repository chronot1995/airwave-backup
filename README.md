# airwave-backup
This is a TCL / Expect script to backup an Airwave server

Function: This program will scp a copy of the most recent Airwave database to a backup server

Execution: ./airwave-backup.sh
Execution example: ./airwave-backup.sh /var/airwave-backup/nightly_data001.tar.gz

Location: I have placed the program in the /root directory

Permissions: chmod 700 root:root airwave-backup.sh

Crontab: The following crontab entry will run every morning at 6am:
00 06 * * * root /root/airwave-backup.sh /var/airwave-backup/nightly_data001.tar.gz
Run the following command after the change: /etc/init.d/crond restart

Run the following command from the shell to determine the location of expect:
which expect

Example output:
which expect
/usr/bin/expect

The first line of the program may need to be modified if the expect location is differnet.

Run the following command if expect is not installed on the Airwave server:
yum install expect
