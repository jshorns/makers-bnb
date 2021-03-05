# frozen_string_literal: true

def create_test_user_1
  User.create(
    name: 'Mr. Blobby',
    password: 'noeledmunds',
    email: 'mrblobby@houseparty.co.uk',
    username: 'mrblobby'
  )
end

def create_test_user_2
  User.create(
    name: 'Mr. Blobber',
    password: 'weakpassword',
    email: 'mrblobber@houseparty.co.uk',
    username: 'mrblobber'
  )
end

def create_test_space_1(test_user)
  Space.create(
    name: '6 Bedroom Penthouse',
    description: 'In the heart of London',
    price: 150,
    user_id: test_user.id
  )
end

def create_test_space_2(test_user)
  Space.create(
    name: 'Royal',
    description: 'In the heart of London',
    price: 250,
    user_id: test_user.id
  )
end

def create_test_space_3(test_user)
  Space.create(
    name: 'Peasant',
    description: 'Far away from London',
    price: 50,
    user_id: test_user.id
  )
end

def create_test_date(test_space)
  SpaceDate.create(
    date: '2021-03-08',
    available: true,
    space_id: test_space.id
  )
end

def create_test_calendar(test_space)
  Calendar.create(
    space_id: test_space.id,
    start_date: '2022-03-01',
    end_date: '2022-03-31'
  )
end

def signup_and_signin
  user = create_test_user_1
  visit '/sessions/new'
  fill_in(:email, with: 'mrblobby@houseparty.co.uk')
  fill_in(:password, with: 'noeledmunds')
  click_button('Log in')
  user
end
