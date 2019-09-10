#!/usr/bin/env bash

install_rvm() {
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

install_brew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_nvm() {
  brew install nvm
  echo '
      Please copy this into ~/.bash_profile
      export NVM_DIR="$HOME/.nvm"
      [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
  '
}

# https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3
install_postgres() {
  brew install postgresql
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  brew reinstall readline
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  createuser -s postgres
  echo '
    Please add this alias!

    alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    To enter: psql -U postgres
    createdb <database_name>
    psql -U postgres -d <database_name>

  '
}

# https://www.dyclassroom.com/howto-mac/how-to-install-rabbitmq-on-mac-using-homebrew
install_rabbitmq() {
  brew install rabbitmq
  export PATH=$PATH:/usr/local/opt/rabbitmq/sbin
  export PATH=$PATH:/usr/local/sbin

  echo '
  
  Please add to .bash_profile, review the rabbitmq version

  #HOMEBREW RABBITMQ
  export HOMEBREW_RABBITMQ=/usr/local/Cellar/rabbitmq/3.7.16/sbin/
  export PATH=$PATH:$HOMEBREW_RABBITMQ

  This add the command rabbitmq-server or alias rabbit_start="rabbitmq-server"
  and see http://localhost:15672/ with user: guest and pass: guest
  '
}

# https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298
install_redis() {
  brew install redis
  # Add begin SO
  ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
  redis-cli ping
  # launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
}
