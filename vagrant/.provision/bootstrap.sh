#!/usr/bin/env bash

# Update ubuntu
sudo apt-get update
sudo apt-get --assume-yes install aptitude

# Upgrade any outdated packages ubuntu
sudo aptitude --assume-yes safe-upgrade

# Install Node.js and Nginx
sudo aptitude --assume-yes install nodejs nginx

# Sign this machine with the proper keyserver
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Start installing RVM with ruby on rails
\curl -L https://get.rvm.io | sudo bash -s stable --rails

# Setup ruby to use the latest stable version
source /usr/local/rvm/scripts/rvm
rvm --default use ruby-2.3.0
rvm gemset use global

# Update bashrc file to automatically setup RVM on login
sudo echo "unset rvm_path" >> /home/ubuntu/.bashrc
sudo echo "unset GEM_HOME" >> /home/ubuntu/.bashrc
sudo echo "source /usr/local/rvm/scripts/rvm" >> /home/ubuntu/.bashrc
sudo echo "rvm --default use ruby-2.3.0" >> /home/ubuntu/.bashrc
sudo echo "rvm gemset use global" >> /home/ubuntu/.bashrc

# Update Gems to the latest version
# FIXME: we don't have write access to /usr/local/rvm/scripts/rvm
#gem update --system
#gem update

# Install the required ruby gems
# FIXME: we don't have write access to /usr/local/rvm/scripts/rvm
#gem install bundler nokogiri rails
#gem install unicorn paperclip omniauth omniauth-facebook geocoder

# Start Nginx
sudo service nginx start

# set up nginx server
sudo cp /home/ubuntu/vagrant/.provision/nginx/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

# Reset Nginx, and bind it as something to run on boot-up
sudo service nginx restart
sudo update-rc.d nginx defaults

# clean /var/www
sudo rm -Rf /var/www

# symlink /var/www => /vagrant
sudo ln -s /home/ubuntu/web /var/www

