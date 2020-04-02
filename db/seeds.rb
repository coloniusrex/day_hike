# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trip_1 = Trip.create(name:"Easter Weekend")
trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)

trip_2 = Trip.create(name:"Memorial Day")
trail_1 = trip_2.trails.create(name:"Rocky Point", address: 'address', length:4)
trail_2 = trip_2.trails.create(name:"Shallow Gulf", address: 'address', length:4)

trip_3 = Trip.create(name:"Start of Summer")
trail_1 = trip_3.trails.create(name:"Rocky Point", address: 'address', length:4)
trail_3 = trip_3.trails.create(name:"Timber Ridge", address: 'address', length:4)
