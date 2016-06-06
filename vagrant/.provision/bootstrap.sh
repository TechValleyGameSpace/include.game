#!/usr/bin/env bash

# Indicate to RubyGems not to generate documentation
cd /home/ubuntu
echo "gem: --no-document" >> /home/ubuntu/.gemrc

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
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Setup ruby to use the latest stable version
source /home/ubuntu/.rvm/scripts/rvm
rvm --default use ruby-2.3.0
rvm gemset use global

# Update Gems to the latest version
gem update --system
gem update

# Install the required ruby gems
gem install bundler nokogiri rails
gem install unicorn paperclip omniauth omniauth-facebook geocoder

# Start Nginx
sudo service nginx start

# set up nginx server
sudo cp /home/ubuntu/vagrant/.provision/nginx/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo service nginx restart

# clean /var/www
sudo rm -Rf /var/www

# symlink /var/www => /vagrant
ln -s /home/ubuntu/web /var/www
