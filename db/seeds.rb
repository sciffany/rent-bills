# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#     { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tiffany = User.create(name: 'Tiffany Chong',
                      email: 'sciffany@gmail.com',
                      password: '123456',
                      role: ':owner')
dima = Location.create(name: 'Dima', password: 'dima123', user_id: tiffany.id)
Duty.create(keeper_id: tiffany.id,
            location_id: dima.id,
            start_date: DateTime.parse('31/01/2018'),
            end_date: DateTime.parse('31/01/2020'))
Unit.create(name: 'A1', location: dima, price: 4000)
Tenant.create(name: 'Bob', location: dima)
