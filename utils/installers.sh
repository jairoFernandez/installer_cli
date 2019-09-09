#!/usr/bin/env bash

install_rvm(){
  echo -e $Yellow "🤯  🖖  Installing RVM, please wait" $Color_Off
  echo -e $Color_Off ""
  echo "We will run the next commands"

  echo -e $Green "1. curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
  echo -e $Green "2. curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -"
  echo -e $Green "3. curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails"
  echo -e $Green "4. usermod -a -G rvm `whoami`"
  echo -e $Green "5. rvm install $ruby_version"
  echo -e $Green "6. rvm use $ruby_version"
  echo -e $Green "7. rvm install $ruby_version" $Color_Off

  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  usermod -a -G rvm `whoami`
  # source /usr/local/rvm/scripts/rvm
  source /Users/`whoami`/.rvm/scripts/rvm
}