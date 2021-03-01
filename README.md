# Makers BnB

## MVP

> As a Landlord
>
> so I can put my space online
>
> I want to  be able to list my space on makersbnb

> As a Landlord
>
> so I can explain what my space is
>
> I want to be able to add a description of a name, price to my post


> As a User
>
> so I can use the site
>
> I want to be able to sign up as a user


## Database migration

1. Create a database 'makersbnb'
2. Create tables with instructions saved in db/migrations

## MVC Diagrams

### CRC - User

| Responsibilities  | Collaborators |
| ------------- |:-------------:|
| knows name     | space   |
| knows email address      |      |
| knows username     |       |
| authenticates    |       |


### CRC - Space

| Responsibilities  | Collaborators |
| ------------- |:-------------:|
| knows name     |    |
| knows description      |      |
| knows price     |       |
| knows id of user who made it    |       |

### Index of spaces

![Index of spaces.](/diagrams/index_of_spaces.png "Index of spaces.")

### Adding a space

![Adding a space.](/diagrams/adding_a_space.png "Adding a space.")

### Signing up for makersbnb

![Signing up.](/diagrams/signing_up.png "Signing up.")

### Signing in to makersbnb (successful, unsuccessful)

![Successful sign in.](/diagrams/successful_signin.png "Successful signin.")

![Unsuccessful sign in.](/diagrams/unsuccessful_signin.png "Unsuccessful signin.")

### Signing out of makersbnb

![Signing out.](/diagrams/signout.png "Signing out.")
