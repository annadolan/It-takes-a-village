# README

This application is a place for new moms, and other people in stressful times in their lives, to identify their needs to that their "village" can help them out. Moms can identify their needs, and friends and family can login to find out how they can help with those needs.


The live app can be accessed at https://ittakesavillage.herokuapp.com/

To run locally:
```
git clone https://github.com/meganft/It-takes-a-village.git
cd It-takes-a-village
rake db:create db:migrate 
rails s
```

The test suite is uses `rspec` and `capybara`.

This app is written in Rails v5.0.0.1.
