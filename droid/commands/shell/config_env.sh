if [[ "$OSTYPE" == "linux-gnu" ]]; then
   echo 'OS not supported!'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  chmod +x ./config_env_darwin.sh
   ./config_env_darwin.sh
elif [[ "$OSTYPE" == "cygwin" ]]; then
      echo 'OS not supported!'
elif [[ "$OSTYPE" == "msys" ]]; then
      echo 'OS not supported!'
elif [[ "$OSTYPE" == "win32" ]]; then
      echo 'OS not supported!'
elif [[ "$OSTYPE" == "freebsd"* ]]; then
      echo 'OS not supported!'
else
      echo 'OS not supported!'
fi
