# README

This is a web app for food recipes created with Ruby on Rails web framework. You can create your account and share your recipes with others.

# Install

Ruby version 2.7.0
Rails version 6.0.3.2
Sqlite3
Puma Server

# Clone the repository
https://github.com/viktorarsovski/Recipe.git

Use git clone to download the app in your local machine

Run bundle install to install all the dependency gems that are used in the app (ex. "bootstrap", "font-awesome")

Setup the DB: rails db:setup, this will setup the DB for you, run the migrations and seed the db so you wont have to enter dummy text for development.

# Check your Ruby version

You should be using ruby 2.7.0

If not, install the right ruby version using rbenv:

rbenv install 2.7.0

# Install dependencies

You should be using Bundler:

bundle install

# Server

From the comman line start the local server Puma

rails s

Finally, in your web browser type localhost:3000 to start the app.