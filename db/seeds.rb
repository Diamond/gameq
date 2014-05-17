# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
founder_role = Role.create(name: 'Founder', level: 0)
admin_role   = Role.create(name: 'Admin', level: 1)
user_role    = Role.create(name: 'Users', level: 2)
jailed_role  = Role.create(name: 'Jailed', level: 4)
User.create(email: 'admin@gameq.info', password: 'test1234', password_confirmation: 'test1234', role: founder_role)
