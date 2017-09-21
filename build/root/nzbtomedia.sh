#!/usr/bin/with-contenv bash

# exit script if return code != 0
set -e

echo "Installing nzbToMedia"

git -C /app clone -q  https://github.com/clinton-hall/nzbToMedia.git

GIT_APP_FOLDER="/app/nzbToMedia"
CONF_APP_FOLDER="/config/nzbToMedia"

# make folders
mkdir -p \
	$CONF_APP_FOLDER

# NzbToMedia config file doesn't exist
[[ ! -f "$CONF_APP_FOLDER/autoProcessMedia.cfg" ]] && cp $GIT_APP_FOLDER/autoProcessMedia.cfg.spec $CONF_APP_FOLDER/autoProcessMedia.cfg

# NzbToMedia Config files exist but not available for the app
[[ ! -h "$GIT_APP_FOLDER/autoProcessMedia.cfg" ]] && ln -s $CONF_APP_FOLDER/autoProcessMedia.cfg $GIT_APP_FOLDER/autoProcessMedia.cfg

# Setup log file
[[ ! -f "$GIT_APP_FOLDER/logs/nzbtomedia.log" ]] && { mkdir -p $GIT_APP_FOLDER/logs && touch $GIT_APP_FOLDER/logs/nzbtomedia.log; }

chown -R abc.abc \
	$CONF_APP_FOLDER \
	$GIT_APP_FOLDER