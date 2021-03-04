
def signup_and_signin
  user = User.create(name: "landlord", password: "123", email: "email@email.com", username:"rich")
  visit '/sessions/new'
  fill_in(:email, with: "email@email.com")
  fill_in(:password, with: "123")
  click_button('Log in')
  return user
end
