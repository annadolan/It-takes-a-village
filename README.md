# README

This application is a place for new moms to identify their needs so that their "village" can help them out. Moms can login, catalogie their needs, and select a time and date.  Friends and family can then login to find out how they can help with those needs.


The live app can be accessed at https://ittakesavillage.herokuapp.com/

To run locally:
```
git clone https://github.com/meganft/It-takes-a-village.git
cd It-takes-a-village
rake db:create db:migrate 
rails s
```

The test suite uses `rspec` and `capybara`.

This app is written in Rails v5.0.0.1.
