#!/bin/sh

if [ ! -f ~/.bash_profile ]; then
  echo '.bash_profile not found, creating file.'
  touch ~/.bash_profile
fi

if [ ! -d "/Users/$USER/Library/Android/sdk" ]; then
  eval "echo 'Cant locate Android SDK, directory /Users/$USER/Library/Android/sdk does not exists'"
  echo 'Exiting with error : status 1'
  exit 1;
else
  echo 'export ANDROID_HOME=/Users/$USER/Library/Android/sdk' >> ~/.bash_profile
  echo 'export PATH=${PATH}:$ANDROID_HOME/plataform-tools/' >> ~/.bash_profile

  echo '
  # Get the aliases and functions
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi' >> ~/.bash_profile

  source ~/.bash_profile
fi
