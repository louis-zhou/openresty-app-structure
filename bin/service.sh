#!/bin/sh

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`

APP_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

. "$APP_HOME"/bin/setenv.sh


nginx=/usr/local/openresty/nginx/sbin/nginx 

if [ "$1" = "start" ] ; then
	eval exec nginx -p $APP_HOME -c $APP_HOME/conf/nginx.conf
elif [ "$1" = "stop" ]; then
	eval exec nginx -s stop -p $APP_HOME -c $APP_HOME/conf/nginx.conf
elif [ "$1" = "reload" ]; then
	eval exec nginx -s reload -p $APP_HOME -c $APP_HOME/conf/nginx.conf
elif [ "$1" = "check" ] ; then
	eval exec nginx -t -p $APP_HOME -c $APP_HOME/conf/nginx.conf
else
  echo "Usage: service.sh ( commands ... )"
  echo "commands:"
  echo "  start             Start OpenResty App"
  echo "  stop              Start OpenResty App"
  echo "  reload       		Reload OpenResty App"
  echo "  check       		Test Nginx config"
  exit 1
fi