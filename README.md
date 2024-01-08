# Puppy Playdate 

Does your dog seem bored? Are you curious about any dog park meet ups or social events near you? Puppy Playdate is designed to meet the need for dog socialization, allowing users to connect with nearby dogs for playdates, ensuring their pets enjoy regular and enriching social interactions. The app uses geolocation so you can peak at a map and see just how close your dogs new best friend might be. You can host a doggy meet up, receive invites to them, schedule a 1 on 1 meet up and more.

## Come check out the app here!

* Insert link to deployment here.


## Getting Started

These instructions will give you a copy of the project up and running on your local machine for development and testing purposes. 

This project uses Ruby version 3.2.2.

### Database Setup

To initialize the database, run the following commands:

`rails db:{drop,create,migrate,seed}`

### Running the Test Suite

To run the test suite, execute the following command:

`bundle exec rspec`

### Running the Server

To run the server, execute the following command:

`rails s`

***IMPORTANT: In order to make the Front End tests pass, you must run the backend server in the background.***

## Install Intructions

In terminal (bash or zsh):

```git clone git@github.com:Puppy-Playdate/puppy_playdate_fe.git```

```git clone git@github.com:Puppy-Playdate/puppy_playdate_be.git```

```cd puppy_playdate_be``` 

Open up a second terminal:

```cd puppy_playdate_fe```

In both terminals: 

- ```bundle install```  
- ```rails s```  

  - The backend runs on 'http://localhost:3000/'
  - The frontend runs on 'http://localhost:5000/'

**GO HERE TO EXPLORE!**


## Running the tests

```bundle exec rspec```  

All tests should be passing.


## Contributors

* Tommy Takahashi 
    * [LinkedIn:](https://www.linkedin.com/in/tommy-takahashi/)
    * [Github:](https://github.com/ttakahashi1591)

* Miranda Delaney 
    * [LinkedIn:](https://www.linkedin.com/in/mld52/)
    * [Github:](https://github.com/delaneymiranda1)

* Eric Belongea 
    * [LinkedIn:](https://www.linkedin.com/in/eric-belongea/)
    * [Github:](https://github.com/EricBelongea)

* Blake Sergesketter
    * [LinkedIn:](https://www.linkedin.com/in/b-sergesketter/)
    * [Github:](https://github.com/bserge13)

* Justin Lee
    * [LinkedIn:](https://www.linkedin.com/in/justin-lee-438035294/)
    * [Github:](https://github.com/JustinSteel)


## Acknowledgments
May use this area for any hat tip to anyone whose code is used, inspiration, helpers (instructors), etc.


## API's Consumed

## API Endpoints

#### Puppy Playdate Endpoints: 

## Gems 

- [Faraday](https://lostisland.github.io/faraday/#/)
  - `gem "faraday"`
- [bcrypt](https://github.com/dcodeIO/bcrypt.js/blob/master/README.md)
    - `gem "bcrypt", "~> 3.1.7"`
- [json:api](https://jsonapi.org/)
    `gem 'jsonapi-serializer'`

#### Placed in `group :test` block:

- [rspec-rails](https://github.com/rspec/rspec-rails)
    - `gem "rspec-rails"`
- [factory_bot](https://github.com/thoughtbot/factory_bot)
    - `gem "factory_bot_rails"`
- [Faker](https://github.com/faker-ruby/faker)
    - `gem "faker"`
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
    - `gem 'simplecov'`
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
    - `gem "shoulda-matchers"`

#### Placed in `group :development, :test` block:

- [Pry](https://github.com/pry/pry)
    - `gem "pry"`

## PLACEHOLDER FOR PICTURES SHOWING EXAMPLES OR PARTS OF THE PROJECT WE'RE PROUD OF.