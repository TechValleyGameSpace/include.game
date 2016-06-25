#!/bin/bash

# Drop and re-create the database
rake db:drop db:create

# Run the server as normal
source server.sh
