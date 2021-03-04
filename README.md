# Makers BnB

| [Team Members](#team-members) | [Dependencies](#dependencies) | [Code Stats](#code-stats) | [Getting Started](#getting-started) | [Specification](#specification) | [Planning](#planning) |

A group project, being the focus of week 5 of the Makers Academy software development bootcamp. The goal is to create an AirBNB-style website based on [this specification](#specification).

---

## Team Members

[Anna Nawrocka](https://github.com/a-nawrocka)

[Iain Aitken](https://github.com/iainaitken)

[Joey Hornsby](https://github.com/jshorns)

[Maximilian Clarke](https://github.com/MJCXII)

[Rorie Clarke](https://github.com/rhc07)

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## Dependencies

Ruby version 2.6.5

### Gems

* bcrypt
* capybara
* launchy
* pg
* rspec
* rubocop
* simplecov
* simplecov-console
* sinatra
* sinatra-flash

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## Code Stats

### Code Style

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) 

[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

### Test Coverage

[insert here]

### Code Quality

[![Maintainability](https://api.codeclimate.com/v1/badges/7c1636113990be21d42c/maintainability)](https://codeclimate.com/github/jshorns/makers-bnb)

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## Getting Started

### To run locally

1. Clone this repo in the folder of your choice

    ```bash
    git clone https://github.com/jshorns/makers-bnb
    ```

2. Navigate into the project folder

    ```bash
    cd makers-bnb
    ```

3. Install dependencies

    ```bash
    bundle install
    ```

4. Start up the server

    ```bash
    rackup -p 4567
    ```

5. Navigate to the webpage in your browser, at localhost:4567 (remembering to migrate the databases first - see below).

### Database migration

1. Connect to psql
  
    ```bash
    psql
    ```
2. Create a database 'makersbnb'

    ```sql
    CREATE DATABASE makersbnb;
    ```
3. Connect to the database

    ```sql
    \c makersbnb;
    ```

4. Create tables with instructions saved in db/migrations:

    ```sql
    CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    username VARCHAR(20),
    email VARCHAR(320),
    password VARCHAR(500),
    UNIQUE(username, email));
    ```

    ```sql
    CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    user_id INT,
    name VARCHAR(150),
    description VARCHAR(2000),
    price MONEY, 
    FOREIGN KEY (user_id)
    REFERENCES users(id));
    ```

    ```sql
    CREATE TABLE dates (
    id SERIAL PRIMARY KEY, 
    date DATE, 
    space_id INT, 
    available BOOLEAN, 
    FOREIGN KEY (space_id) 
    REFERENCES spaces(id));
    ```

5. Create the test database
   
    ```sql
    CREATE DATABASE makersbnb_test;
    ```

    ```sql
    \c makersbnb_test;
    ```

    Repeat step 4.

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## Specification

### Headline specifications

* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

* Users should receive an email whenever one of the following happens:

  * They sign up
  * They create a space
  * They update a space
  A user requests to book their space
  * hey confirm a request
  * They request to book a space
  * Their request to book a space is confirmed
  * Their request to book a space is denied
  
* Users should receive a text message to a provided number whenever one of the following happens:

  * A user requests to book their space
  * Their request to book a space is confirmed
  * Their request to book a space is denied
  * A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
  * Basic payment implementation though Stripe.

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## User Stories

The above requirements were converted into the following user stories (covering the headline specifications)

> As a Landlord
>
> So I can put my space online
>
> I want to be able to list my space on makersbnb

> As a Landlord
>
> So I can explain what my space is
>
> I want to be able to add a description, name, and price to my post

> As a User
>
> So I can use the site
>
> I want to be able to sign up as a user

> As a Customer
> 
> So I can see what spaces are available
> 
> I want to see a list of all the spaces online

> As a Landlord
> 
> So space can be booked until it has been confirmed
> 
> I want to be able to have my space listed until booking has been confirmed

> As a Landlord
> 
> So I can flex my vast capital wealth
> 
> I want to be able to list multiple spaces

> As a User
> 
> So I can access the website
> 
> I want to be able to login

> As a User
> 
> So I can exit the website
> 
> I want to be able to logout

> As a Landlord
> 
> So I can rent out my space
> 
> I want to be able to approve a booking request for one night

> As a Landlord
> 
> So I can list the dates my space is available
> 
> I want to be able to select a range of dates

> As a Customer
> 
> So I can book a space for one night
> 
> i want to be able to select a date to book

> As a Customer
> 
> So I don't double book a space
> 
> I want to be able to see that a space has been booked on certain dates

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>

## Planning

## MVC Diagrams

### CRC Cards

#### User

| Responsibilities  | Collaborators |
| ------------- |:-------------:|
| knows name     | space   |
| knows email address      |      |
| knows username     |       |
| authenticates    |       |

#### Space

| Responsibilities  | Collaborators |
| ----------------- | ------------- |
| knows name        |               |
| knows description |               |
| knows price       |               |
| knows id of user who made it      |

#### SpaceDate

| Responsibilities  | Collaborators |
| ------------- |:-------------:|
| knows name     |    |
| knows description      |      |
| knows price     |       |
| knows id of user who made it    |       |

#### Calendar

| Responsibilities  | Collaborators |
| ------------- |:-------------:|
| knows name     |    |
| knows description      |      |
| knows price     |       |
| knows id of user who made it    |       |

### MVC - Index of spaces

![Index of spaces.](/diagrams/index_of_spaces.png "Index of spaces.")

### MVC - Adding a space

![Adding a space.](/diagrams/adding_a_space.png "Adding a space.")

### MVC - Signing up for makersbnb

![Signing up.](/diagrams/signing_up.png "Signing up.")

### MVC - Signing in to makersbnb (successful, unsuccessful)

![Successful sign in.](/diagrams/successful_signin.png "Successful signin.")

![Unsuccessful sign in.](/diagrams/unsuccessful_signin.png "Unsuccessful signin.")

### MVC - Signing out of makersbnb

![Signing out.](/diagrams/signout.png "Signing out.")

---

<div style="text-align: right"><a href="#makers-bnb">Back to top</a></div>
