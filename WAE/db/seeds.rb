# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sa = Role.find_or_create_by({name:"superadmin"})
Role.find_or_create_by({name:"admin"})
Role.find_or_create_by({name:"registered"})
Role.find_or_create_by({name:"blocked"})

user = User.find_or_initialize_by(email: 'subigya@ait.asia')
user.password = 'secret123'
user.password_confirmation = 'secret123'
user.role = sa
user.save