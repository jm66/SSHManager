#!/bin/bash
PS3='Pick a server (or ctrl-c to quit): '
select item in `egrep -v '#' /etc/hosts  |awk '/./{print "USERNAME@"$2; }'`

do
     clear
     echo You are connecting to $item
     PS3='Choose connection type (or ctrl-c to quit): '
     select type in "ssh" "sftp" "ftp" "rsh" "telnet" "rlogin" "quit"
     do
	  echo Connecting to $item
          echo Enter additional $type arguments \(or just press enter for none\): 
          read args
          case "$type" in
               ssh ) ssh $args $item ;;
               sftp ) sftp $args $item ;;
               ftp ) ftp $args $item ;;
               rsh ) rsh $args $item ;;
               telnet ) telnet $args $item ;;
               rlogin ) rlogin $args $item ;;
               quit ) break ;;
               "") please select one of the above or press ctrl-c ;;
          esac
          exit 0
     done
     exit 0
done
