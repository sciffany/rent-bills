# README

## Program

The program can be found at http://rent-bills.herokuapp.com/
Work in progress. 

You can try out by logging in with email `owner@owner.com` and password `123`.

## Description of program

Rent Bills is a web application to help homeowners monitor rent payments made by tenants.

Homeowners can create a location to represent houses/apartment/condominiums they own. A location could have several units. They can assign a tenant to each unit, based on a contract. A contract lasts for a time period and indicates the monthly rent that tenants need to pay. Homeowners will be able to see the accumulated rent owed by a tenant.

Homeowners can employ keepers to collect payments made by tenants. Keepers will then input how much money they collected when onto the database. Keepers gain access information to a location using location passwords.

## Ruby version

2.5.0

## Schema

The following schema is used by the program.

![ERD](erd.png)


## Features Implemented so far

User Management

1. Users can sign up, log in and log out based on unique emails.
2. Two types of users are supported: owners and keepers.

Locations and Units

1. Owners are able to create password-locked locations to represent houses they own.
2. Owners and keepers are able to search for locations based on their names.
3. Keepers can sign themselves up as keepers for a house if they know the location password.

Tenants

1. Owners can also add tenants to locations.
2. Owners can create a contract based on how long the tenant stays in a unit and how much the monthly rent is.

Keepers

1. Keepers are able to see an overview of tenants and occupied units in the house.
2. They can see contracts of tenants.

Profile

1. Users are able to view their own profile through link at navigation bar above.
2. In this page, they can see all the locations they manage.

## Future Development

1. Ability to input payments made by tenants.
2. Calculate amount that is due based on payment minus amount owed.
3. Additional features for data hiding and privacy.
