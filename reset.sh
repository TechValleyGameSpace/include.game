#!/bin/bash

# Drop and re-create the database
rake db:drop db:create db:migrate db:seed

# Run the server as normal
source server.sh
