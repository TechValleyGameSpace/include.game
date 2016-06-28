# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
User.create!(username: 'tvgs',
  email: 'info@techvalleygamespace.com',
  password_digest: User.digest('include.game'))
#   Mayor.create(name: 'Emanuel', city: cities.first)
