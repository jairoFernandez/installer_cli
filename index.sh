#!/usr/bin/env bash

actual_dir="$(dirname "$0")"
ruby_version="2.6.1"

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

options=("Install homebrew" "Install nvm" "Install nodejs" "Install RVM" "Install ruby" "Install git"  "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Install homebrew")
            echo "Installing homebrew"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            well_done
            ;;
        "Install nvm")
            echo "Installing NVM"
            brew install nvm
            echo '
                Please copy this into ~/.bash_profile
                export NVM_DIR="$HOME/.nvm"
                [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
                [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
            '
            well_done
            ;;
        "Install nodejs")
            echo "Installing nodejs"
            well_done
            ;;
        "Install RVM")
            echo "You chose install RVM"
            install_rvm
            well_done
            ;;
        "Install ruby")
            echo "You chose install Ruby"
            rvm install $ruby_version
            rvm use $ruby_version
            well_done
            ;;
        "Install git")
            echo "you chose choice $REPLY which is $opt"
            well_done
            ;;
        "Quit")
            break
            well_done
            ;;
        *) echo "invalid option $REPLY";;
    esac
done