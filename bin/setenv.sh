#!/bin/sh

env_val_path="$APP_HOME/conf/.env_val"

if [[ -n "$2" ]] && [[ $2!="" ]] ; then
	env_val=$2
	echo $2 > $env_val_path
elif [[ -r $env_val_path ]]; then
	env_val=$(cat $env_val_path)
fi

org_nginx_conf="$APP_HOME/conf/$env_val/nginx.conf"

if [[ ! -r $org_nginx_conf ]]; then
	echo "please check env config !!!"
	exit 1
fi

cat $org_nginx_conf > "$APP_HOME/conf/nginx.conf"
