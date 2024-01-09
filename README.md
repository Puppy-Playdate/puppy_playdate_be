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

## API's Consumed

## API Endpoints

***Utilize `"http://localhost:3000/"` to access ALL endpoints.*** 

#### Puppy Playdate Endpoints:

**User CRUD**

- **Users Index**
    
    - GET `api/v1/users`

- **User Show**
    
    - GET `api/v1/users/:id`

- **User Create**
    
    - POST `api/v1/users`

- **User Update**
    
    - PATCH `api/v1/users/:id`
    - PUT `api/v1/users/:id`

- **User Destroy**
    
    - DELETE `api/v1/users/:id`

**Dogs CRUD**

- **Dogs Index**
    
    - GET `api/v1/users/:user_id/dogs`

- **Dog Show**
    
    - GET `api/v1/users/:user_id/dogs/:id`

- **Dog Create**
    
    - POST `/api/v1/users/:user_id/dogs`

- **Dog Update**
    
    - PATCH `api/v1/users/:user_id/dogs/:id`
    - PUT `api/v1/users/:user_id/dogs/:id`

- **Dog Destroy**
    
    - DELETE `api/v1/users/:user_id/dogs/:id`

**Socials CRUD**

- **Socials Index**
    
    - GET `api/v1/users/:user_id/socials`

- **Socials Show**
    
    - GET `/api/v1/users/:user_id/socials/:id`

    ## **UNDER CONSTRUCTION**

- **Socials Create**
    
    - POST `/api/v1/users/:user_id/socials`

- **Socials Update**
    
    - PATCH `/api/v1/users/:user_id/socials/:id`
    - PUT `/api/v1/users/:user_id/socials/:id`

- **Socials Destroy**
    
    - DELETE `/api/v1/users/:user_id/socials/:id`

    ## **END CONSTRUCTION**

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

## Contributors

* Tommy Takahashi 
    * [Tommy's LinkedIn](https://www.linkedin.com/in/tommy-takahashi/)
    * [Tommy's Github](https://github.com/ttakahashi1591)

* Miranda Delaney 
    * [Miranda's LinkedIn](https://www.linkedin.com/in/mld52/)
    * [Miranda's Github](https://github.com/delaneymiranda1)

* Eric Belongea 
    * [Eric's LinkedIn](https://www.linkedin.com/in/eric-belongea/)
    * [Eric's Github](https://github.com/EricBelongea)

* Blake Sergesketter
    * [Blake's LinkedIn](https://www.linkedin.com/in/b-sergesketter/)
    * [Blake's Github](https://github.com/bserge13)

* Justin Lee
    * [Justin's LinkedIn](https://www.linkedin.com/in/justin-lee-438035294/)
    * [Justin's Github](https://github.com/JustinSteel)


## Acknowledgments
May use this area for any hat tip to anyone whose code is used, inspiration, helpers (instructors), etc.

## PLACEHOLDER FOR PICTURES SHOWING EXAMPLES OR PARTS OF THE PROJECT WE'RE PROUD OF.




## IMPORTANT INFO FOR DEVS

**Info**
- users have many dogs and socials
- dogs and socials belong to users
- We have a user_socials controller so if we get rid of the joins table take it out too
- users and dogs basic crud functions happy and sad path tested.
- if not merged into main yet follow these steps
1. git checkout socials
2. git pull origin socials
    - this will give you access to all the current pushes we made to the socials branch blake can show you if you have any questions.
 

**TODO**
- serializer test for socials 
- Create, Update, and Delete are all not being called on in the socials controller inside the method so need to do some digging. Seem to be the same issue though


