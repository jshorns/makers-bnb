feature 'login' do 
  it 'a user can log in ' do 
    User.create(name: "landlord", password: "123", email: "email@email.com", username:"rich")

    visit '/sessions/new'
    fill_in(:email, with: "email@email.com")
    fill_in(:password, with: "123")
    click_button('Log in')

    expect(page).to have_content 'Welcome, landlord'
  end 
end 
