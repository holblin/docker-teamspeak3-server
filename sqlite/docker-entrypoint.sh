#!/bin/bash
set -e

EXTRA_ARGS=""

if [ "$1" == "ts3server" ]
then

  # mount correctly the additionnals repository
  if [ -d /data/sql ]
  then
    EXTRA_ARGS="dbsqlpath=sql/ ${EXTRA_ARGS}"
  else
    EXTRA_ARGS="dbsqlpath=/app/sql/ ${EXTRA_ARGS}"
    # ln -s /app/sql /data/sql
  fi

  # if we need to create a ts3server.ini file or not
  if [ -f /data/ts3server.ini ]
  then
    CREATE_INI_FILE=0;
  else
    CREATE_INI_FILE=1;
  fi

  # set final execution folder
  cd /data
  export LD_LIBRARY_PATH="/app/:${LD_LIBRARY_PATH}"

  /app/ts3server_linux_amd64 \
      default_voice_port="9987" \
      filetransfer_port="30033" \
      query_port="10011" \
      dbplugin="ts3db_sqlite3" \
      inifile="/data/ts3server.ini" \
      $EXTRA_ARGS \
      createinifile="${CREATE_INI_FILE}" 

else

  exec "$@"

fi
