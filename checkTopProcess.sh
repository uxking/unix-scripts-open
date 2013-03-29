#!/usr/bin/sh

# check_top_process.sh
# check for processes using over 90% of cpu, named wfica or netscape.
# mdh 7/19/02

rm -f /tmp/topfile
top -d1 -n1 -f /tmp/topfile 

tail -1 /tmp/topfile | awk '
BEGIN {
    thresh = 90
    sysadmin="sysadmin@mailhost"
}

/netscape/ || /wfica/ { 

    cpu = $12 
    pname = $13
    pid = $3
    message = "The following " pname " runaway process has been killed: " pid " \n\nIt was consuming " cpu " of the cpu.\n\n"
    top_header = "CPU TTY  PID USERNAME PRI NI   SIZE    RES STATE    TIME %WCPU  %CPU COMMAND\n"

    if (cpu > thresh) {
        if( system("kill -9 " pid) ) {
            print "Could not kill process " pid ".  Exiting..."
            exit
        }
        print message top_header $0 | "mailx -s runaway " sysadmin
    }
}'

