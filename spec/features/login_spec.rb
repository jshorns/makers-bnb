# frozen_string_literal: true

feature 'login' do
  it 'a user can log in ' do
    User.create(name: 'landlord', password: '123', email: 'email@email.com', username:'rich')

    visit '/sessions/new'

    fill_in(:email, with: 'email@email.com')
    fill_in(:password, with: '123')
    click_button('Log in')

    expect(page).to have_content 'You have successfully logged in, landlord'
  end
  it 'gives failure message if email does not match records' do
    visit '/sessions/new'
    fill_in(:email, with: 'email@email.com')
    fill_in(:password, with: '123')
    click_button('Log in')
    expect(page).to have_content "I'm sorry, those details don't match our records"
  end
  it 'gives failure message if password is incorrect does not match records' do
    User.create(name: 'landlord', password: '123', email: 'email@email.com', username:'rich')
    visit '/sessions/new'
    fill_in(:email, with: 'email@email.com')
    fill_in(:password, with: '456')
    click_button('Log in')
    expect(page).to have_content "I'm sorry, those details don't match our records"
  end
end
