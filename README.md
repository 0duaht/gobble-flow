# Gobble
[![Build Status](https://semaphoreci.com/api/v1/projects/c981c3c2-6d95-4c2b-a4a9-7942b9c5a479/629366/badge.svg)](https://semaphoreci.com/tobi-oduah/gobble-flow) [![Code Climate](https://codeclimate.com/github/andela-toduah/gobble-flow/badges/gpa.svg)](https://codeclimate.com/github/andela-toduah/gobble-flow) [![Test Coverage](https://codeclimate.com/github/andela-toduah/gobble-flow/badges/coverage.svg)](https://codeclimate.com/github/andela-toduah/gobble-flow/coverage)

## Features
Gobble is an easy-to-use URL shortener for generating shortened URLs from lengthy URLs passed in. It allows users pass in ugly, long URLs and generates short unique URLs that redirect to the original address.

Anonymous or registered users can generate short URLs from long URLs. However, only registered users can choose a custom shortened URL. 

Gobble allows unlimited number of URL-shortening for users, and provides click-statistics to enable registered users keep track of how many times shortened URL has been visited.

Gobble allows registered users to manage URLs seamlessly. A registered user could decide to set shortened URL to be inactive or delete URL altogether. The target of a shortened URL could also be changed easily by users who created them.

To use, visit http://g-it.heroku.com

Gobble also includes a gem that interfaces with the Gobble API. For more information, see https://github.com/andela-toduah/gobble-gem

## Limitations
1. Users are not able to sign up with Open ID, or other means of authentication.
2. Profile management by users is not available yet.

## Installation
Web application is written with Ruby using the Ruby on Rails framework.

To install Ruby visit [Ruby Lang](https://www.ruby-lang.org). [v2.2.3p173]

To install Rails visit [Ruby on Rails](http://rubyonrails.org/). [v4.2.4]

## Dependencies
User management is implemented with the sorcery gem. For more information, see https://github.com/NoamB/sorcery

## Using the App

1. Once you have Ruby and Rails installed, clone the repo by running 

        $ git clone https://github.com/andela-toduah/gobble.git

2. Then run the following command to install gem dependencies:

        $ bundle install

3. Then run the following command to set up the database:

        $ rake db:migrate

4. Once the command runs successfully, start the Rails server by running:

        $ rails server

4. To access the app, visit http://localhost:3000 in a web browser

## Testing

To test the web application, run the following command to carry out all tests:

        $ bundle exec rake spec

To view test descriptors, run the following command:

        $ bundle exec rake spec -fd

## Contributing

1. Fork it by visiting - https://github.com/andela-toduah/gobble/fork

2. Create your feature branch

        $ git checkout -b new_feature
    
3. Contribute to code

4. Commit changes made

        $ git commit -a -m 'descriptive_message_about_change'
    
5. Push to branch created

        $ git push origin new_feature
    
6. Then, create a new Pull Request
