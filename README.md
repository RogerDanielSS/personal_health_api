# personal_health_api

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

User.create(name: 'Ganso')

Category.create(name: 'Exame', dynamic_fields_attributes: [{name: 'Data'}])

Item.create(category_id: 1, title: 'Exame de sangue', fields: {Data: '01/02/2002'})