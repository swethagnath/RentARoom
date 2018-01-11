# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create(name:"admin")
User.create( email:"swetha@gmail.com",last_name: "gopinath",first_name: "swetha", username: "swetha", mobile_number:"1234567890",role_id:Role.first.id,password:"123swetha")
Role.create(name:"guest")
Role.create(name:"host")
 

