#!/bin/bash

# Standard app config
#export APP_NAME=iHeartAuto
#export DEVELOPER_NAME="iPhone Distribution: Clear Channel Communications, Inc."
#export PROFILE_NAME=Autos_enterprise_certificate
export INFO_PLIST=iHeartAuto/Info.plist
export BUNDLE_DISPLAY_NAME="TestParent"

#export KEY_PASSWORD=Enterprise
#export HOCKEY_APP_ID=e5068091cc616798fbe22e0fe4f011d9
#export HOCKEY_APP_TOKEN=81690e26408f403eba4b295963dbd25e

# This just emulates Travis vars locally
#  export TRAVIS_PULL_REQUEST=false
#  export TRAVIS_BRANCH=master
#  export TRAVIS_BUILD_NUMBER=0

export FULL_BUILD_NUMBER=$(scripts/getAMPServerDate.sh)-$TRAVIS_BUILD_NUMBER
