# README

This is a simple sketch of a rails app focusing on the models and their associations and does not include any views.

Models are kept thin and controllers are actually not existing, since I used the active_interaction gem to pack all business logic following the command pattern.

The app deals with shipments, warehouses, products, and inventory. A shipment is a representation of a set of products that need to be shipped somewhere. A warehouse is a facility that can store inventory and maintain a list of shipments that it will be responsible for fulfilling.

Try writing some specs around assigning shipments to warehouses based on inventory, so that a shipment that contains product X gets assigned to ship out of a warehouse that has inventory of product X rather than another warehouse that does not have any X.

* Ruby and Rails versions
- ruby 2.3 as defined in the Gemfile
- rails 5

* System dependencies
- postgresql is expected to be available

* Configuration
Update database.yml if necessary

* Database creation
As usually `bundle exec rails db:create`

* Database initialization
```
be rails db:migrate
be rails db:test:load
```
* How to run the test suite
```
be rails rspec
```

* TODOs
- Spec the company assign_shipment interaction with more contexts, for example when the company has more than one warehouses and the shipment consists of multiple products in different quantities.
- Reduce inventory_quantity when assigning a shipment to a warehouse.
- Add status to shipments.
