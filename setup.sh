#!/bin/bash

# Install gems files under Gemfile
bundle install

# Create the database
rake db:create

# Run the server as normal
source server.sh
