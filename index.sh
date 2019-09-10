#!/usr/bin/env bash

actual_dir="$(dirname "$0")"
ruby_version="2.6.1"
aliases='
  alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  alias rabbit_start="rabbitmq-server"
'

source "$actual_dir/utils/color.sh"
source "$actual_dir/utils/installers.sh"

echo -e $Green "
Assistance of installations for devs
====================================
"

echo -e $Color_Off ""

well_done() {
echo -e $Yellow "
Well done!!!
"
echo -e $Color_Off ""
}

PS3='
________________________________

Please enter your choice
or press 6 for Quit or ctrl + c: 
________________________________
'

options=("Install homebrew" "Install nvm" "Install Postgres" "Install Rabbitmq" "Install redis" "Install nodejs" "Install RVM" "Install ruby" "Install git"  "Quit")

select opt in "${options[@]}"
do
  case $opt in
      "Install homebrew")
          echo "Installing homebrew"
          install_brew
          well_done
          ;;
      "Install nvm")
          echo "Installing NVM"
          install_nvm
          well_done
          ;;
      "Install nodejs")
          echo "Installing nodejs"
          well_done
          ;;
      "Install RVM")
          echo "You choose install RVM"
          install_rvm
          well_done
          ;;
       "Install Postgres")
          echo "You choose install Postgres"
          install_postgres
          well_done
          ;;
       "Install Rabbitmq")
          echo "You choose install rabbitmq"
          install_rabbitmq
          well_done
          ;;
      "Install ruby")
          echo "You choose install Ruby"
          rvm install $ruby_version
          rvm use $ruby_version
          well_done
          ;;
      "Install git")
          echo "you choose choice $REPLY which is $opt"
          well_done
          ;;
      "Install redis")
          install_redis
          ;;
      "Quit")
          break
          well_done
          ;;
      *) echo "invalid option $REPLY";;
  esac
done