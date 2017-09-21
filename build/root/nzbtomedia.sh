#!/bin/bash

# exit script if return code != 0
set -e

echo "Installing nzbToMedia"


GIT_APP_FOLDER="/etc/webapps/nzbToMedia"
CONF_APP_FOLDER="/etc/webapps/nzbToMedia/config"
if [[ -d "$GIT_APP_FOLDER/.git" ]]
then
  git -C $GIT_APP_FOLDER pull
else
  git clone https://github.com/clinton-hall/nzbToMedia.git $GIT_APP_FOLDER
fi

mkdir -p $CONF_APP_FOLDER
[[ ! -f "$CONF_APP_FOLDER/autoProcessMedia.cfg" ]] && cp $GIT_APP_FOLDER/autoProcessMedia.cfg.spec $CONF_APP_FOLDER/autoProcessMedia.cfg
[[ ! -h "$GIT_APP_FOLDER/autoProcessMedia.cfg" ]] && ln -s $CONF_APP_FOLDER/autoProcessMedia.cfg $GIT_APP_FOLDER/autoProcessMedia.cfg
[[ ! -f "$GIT_APP_FOLDER/logs/nzbtomedia.log" ]] && { mkdir -p $GIT_APP_FOLDER/logs && touch $GIT_APP_FOLDER/logs/nzbtomedia.log; }