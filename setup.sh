#!/bin/bash

# Install gems files under Gemfile
bundle install

# Create the database
rake db:create
rake db:migrate

# Run the server
rails server -b 0.0.0.0
