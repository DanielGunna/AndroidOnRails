#!/bin/sh



if [[ "$OSTYPE" == "linux-gnu"  ||  "$OSTYPE" == "cygwin" ]]; then
    FILE_STAT=$(stat --format '%a'  ./config_env.sh)
elif [[ "$OSTYPE" == "darwin"*  ||  "$OSTYPE" == "freebsd"* ]]; then
    FILE_STAT=$(stat -f "%OLp" ./config_env.sh)
fi


if [[ "$FILE_STAT" != "755" ]]; then
  echo "Must run chmod +x"
  chmod +x config_env.sh
fi

echo "Checking environment variables..."
./config_env.sh
source  ~/.bash_profile
if [[ $PATH = *"/Android/sdk"* ]]; then
  CURRENT_DIRECTORY=$PWD
  cd $ANDROID_HOME/tools/
  ./android create project \
      --gradle \
      --gradle-version 0.11.+ \
      --activity $1 \
      --package $2 \
      --target $3 \
      --path $CURRENT_DIRECTORY/$4
      cd $CURRENT_DIRECTORY
      exit 0
else
  echo 'ANDROID_HOME environment variable error'
  exit 1
fi
