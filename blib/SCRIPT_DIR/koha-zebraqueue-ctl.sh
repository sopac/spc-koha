#!/bin/bash
USER=root
GROUP=root
DBNAME=koha
NAME=koha-zebraqueue-ctl-$DBNAME
LOGDIR=/var/log/koha
PERL5LIB=/usr/share/koha/lib
KOHA_CONF=/etc/koha/koha-conf.xml
ERRLOG=$LOGDIR/koha-zebraqueue.err
STDOUT=$LOGDIR/koha-zebraqueue.log
OUTPUT=$LOGDIR/koha-zebraqueue-output.log
export KOHA_CONF
export PERL5LIB
ZEBRAQUEUE=/usr/share/koha/bin/zebraqueue_daemon.pl

test -f $ZEBRAQUEUE || exit 0

OTHERUSER=''
if [[ $EUID -eq 0 ]]; then
    OTHERUSER="--user=$USER.$GROUP"
fi

case "$1" in
    start)
      echo "Starting Zebraqueue Daemon"
      daemon --name=$NAME --errlog=$ERRLOG --stdout=$STDOUT --output=$OUTPUT --verbose=1 --respawn --delay=30 $OTHERUSER -- perl -I $PERL5LIB $ZEBRAQUEUE -f $KOHA_CONF 
      ;;
    stop)
      echo "Stopping Zebraqueue Daemon"
      daemon --name=$NAME --errlog=$ERRLOG --stdout=$STDOUT --output=$OUTPUT --verbose=1 --respawn --delay=30 $OTHERUSER --stop -- perl -I $PERL5LIB $ZEBRAQUEUE -f $KOHA_CONF 
      ;;
    restart)
      echo "Restarting the Zebraqueue Daemon"
      daemon --name=$NAME --errlog=$ERRLOG --stdout=$STDOUT --output=$OUTPUT --verbose=1 --respawn --delay=30 $OTHERUSER --restart -- perl -I $PERL5LIB $ZEBRAQUEUE -f $KOHA_CONF 
      ;;
    *)
      echo "Usage: /etc/init.d/$NAME {start|stop|restart}"
      exit 1
      ;;
esac
