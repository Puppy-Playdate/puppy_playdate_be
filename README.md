# Puppy Playdate 

Does your dog seem bored? Are you curious about any dog park meet ups or social events near you? Puppy Playdate is designed to meet the need for dog socialization, allowing users to connect with nearby dogs for playdates, ensuring their pets enjoy regular and enriching social interactions. The app uses geolocation so you can peak at a map and see just how close your dogs new best friend might be. You can host a doggy meet up, receive invites to them, schedule a 1 on 1 meet up and more.

## Come check out the app here!

* Insert link to deployment here.


## Getting Started

These instructions will give you a copy of the project up and running on your local machine for development and testing purposes. 

This project uses Ruby version 3.2.2.

### Database Setup

Change directories into the project:
`cd /puppy_playdate_be`

Install all gems:
`bundle install`

To initialize the database, run the following commands:

`rails db:{drop,create,migrate,seed}`

### Schema
![Screenshot 2024-01-12 at 10 42 26 AM](https://gist.github.com/assets/134735853/64185bf2-b5b1-4d84-81b0-1009598409a3)

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

## Gems 

- [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs
- [bcrypt](https://github.com/dcodeIO/bcrypt.js/blob/master/README.md)
    - `gem "bcrypt", "~> 3.1.7"`
- [JSONAPI Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) gem for formatting JSON responses

#### Placed in `group :test` block:

- [rspec-rails](https://github.com/rspec/rspec-rails) gem that is backbone of our testing architecture
- [factory_bot](https://github.com/thoughtbot/factory_bot) gem to create models for testing data
- [Faker](https://github.com/faker-ruby/faker) gem to mock and stub test data
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [Capybara](https://github.com/morris-lab/Capybara) gem for end to end testing 

#### Placed in `group :development, :test` block:

- [Pry](https://github.com/pry/pry) gem for debugging


## Running the tests

```bundle exec rspec```  

All tests should be passing.

## API Endpoints

***Utilize `"http://localhost:3000/"` to access ALL endpoints.*** 

#### Puppy Playdate Endpoints:

For endpoint data please consult the spec/resquest files to see our mocked data. 

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


- **Socials Create**
    
    - POST `/api/v1/users/:user_id/socials`

- **Socials Update**
    
    - PATCH `/api/v1/users/:user_id/socials/:id`
    - PUT `/api/v1/users/:user_id/socials/:id`

- **Socials Destroy**
    
    - DELETE `/api/v1/users/:user_id/socials/:id`

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



