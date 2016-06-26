#!/bin/bash

# Install gems files under Gemfile
bundle install

# Create the database
rake db:drop db:create db:migrate db:seed

# Run the server as normal
source server.sh
