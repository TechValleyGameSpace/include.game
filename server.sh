#!/bin/bash

# Update the database
rake db:migrate

# Run the server
rails server -b 0.0.0.0
