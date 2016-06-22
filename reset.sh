#!/bin/bash

# Drop and re-create the database
rake db:drop
rake db:create

# Run the server as normal
source server.sh
