#!/bin/bash

# Install gems files under Gemfile
bundle install

# Create the database
rake db:create

# Run the server
rails server -b 0.0.0.0
