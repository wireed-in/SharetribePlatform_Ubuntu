#!/bin/bash -xe
#   Setup necessary software for the development environment.
#    - rbenv
#    - ruby 2.3.4
#    - n for node version management
#    - node 7.8
#    - rails 5
#    - sphinxsearch
#    - imagemagick
#
#   https://bitbucket.org/shopsntools/shopsntools/wiki/Setting%20up%20server
#

####################################################################################
###########################     Build Essentials     ###############################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Setting up build essentials -----   \e[0m"

# Depending on your version of Ubuntu/Debian/Mint, libgdbm5 won't be available. In that case, try with libgdbm3.
# For earlier versions of ruby (ex 2.3.4 in this tutorial) libssl1.0-dev is needed instead of latest libssl-dev
apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

####################################################################################
#################     RBENV, RUBY BUILD & PLUGINS, RUBY     ########################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing rbenv ruby version manager -----   \e[0m"

# Clone the repository for rbenv.
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Export path to .bashrc file.
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"

# Initialize.
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "$(rbenv init -)"

####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Setting up ruby build and plugins -----   \e[0m"

# Clone the repository for ruby build.
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Export path to .bashrc file.
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing Ruby 2.3.4 -----   \e[0m"

# Install ruby.
rbenv install 2.3.4

# Set 2.3.4 to a global ruby version.
rbenv global 2.3.4

# Confirm version.
ruby -v

# Install bundler.
gem install bundler

# Rehash rbenv.
rbenv rehash

####################################################################################
#############################     N, NODE & NPM     ################################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing node 7.8.0 & npm through n -----   \e[0m"

# Clone n node version manager.
git clone https://github.com/tj/n.git ~/.n

# Navigate to cloned directory.
cd ~/.n

# Make install.
make install

# Navigate back.
cd ~

# Install node version 7.8
n 7.8.0

# Confirm versions.
node -v
npm -v

####################################################################################
################################     RAILS 5     ###################################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing RAILS 5 -----   \e[0m"

# Install rails gem.
gem install rails -v 5.1.1

####################################################################################
########################     MySql Adapter and Tools    ############################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing MySql Tools -----   \e[0m"

# We do not need to install MySql Server since we will be using database
# through RDS on Amazon Web Services. It should have its own environemnt
# with it's own dedicated instance.

# MySql Client Dev tool.
apt-get -y install libmysqlclient-dev

# MySql Adapter.
gem install mysql2 -v '0.4.6' --source 'http://rubygems.org/'

####################################################################################
####################     Sphinx Search and Image Magicx    #########################
####################################################################################

echo -e "\e[1m\e[103m\e[91m   ----- Installing Sphinx Search & Imagemagick -----   \e[0m"

# Install sphinx search.
apt-get -y install sphinxsearch

# Install imagemagick.
apt-get -y install imagemagick

echo -e "\e[102m\e[91m   ----- Successfully completed setting up dev environment -----   \e[0m"