#!/bin/sh
PROJECT_HOME=/home/rails/lisapi_rails
PUMA_PID=`cat $PROJECT_HOME/tmp/pids/puma.pid`

cd $PROJECT_HOME

/home/rails/lisapi_rails/script/stop_puma.sh

echo "Update Contents..."
git pull


/home/rails/lisapi_rails/script/start_puma.sh
