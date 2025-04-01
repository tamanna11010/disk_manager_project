 #!/bin/bash

 check_disk_usage() {
       echo "checking disk usage..."
       df -h | grep "/dev/sd"
}

 find_large_files(){
     echo "finding files larger than 100 MB"
     find /home/taman -type f - size +100M 2>/dev/null
}

 list_old_logs(){
     echo  "listing logs older than 30 days..."
    sudo find /var/log -type f \( \
   -name "kern.log" -o\
   -name "bootstrap.log" -o \
   -name  "dmesg" -o \
   -name  "*.gz" -o \
    -name  "*.1" \
 \) -mtime +30 2>/dev/null     
 }

 send_email_alert() {
   echo "sending alert"
    echo "disk space critical " | mail -s "alert"  user@example.com
}

main(){
 check_disk_usage
 find_large_files
 list_old_logs
}

main
