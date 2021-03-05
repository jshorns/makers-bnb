# frozen_string_literal: true

feature 'user sign up' do
  scenario 'user can sign up via the website' do
    sign_up

    expect(page).to have_content('Welcome to Makers BnB, Mr Blobby!')
  end

  scenario 'user gets an error if a duplicate email' do
    sign_up
    sign_out
    visit '/'
    click_link 'Sign Up'
    fill_in :name, with: 'Ratafak Plachta'
    fill_in :email, with: 'mrblobby@houseparty.co.uk'
    fill_in :password, with: 'ballsonface'
    fill_in :username, with: 'ratafak'
    click_button 'Create Account'

    expect(page).to have_content('Sorry, that email address is already being used.')
  end

  scenario 'user gets an error if a duplicate username' do
    sign_up
    sign_out
    visit '/'
    click_link 'Sign Up'
    fill_in :name, with: 'Ratafak Plachta'
    fill_in :email, with: 'ratafak@scary.co.uk'
    fill_in :password, with: 'ballsonface'
    fill_in :username, with: 'mrblobby'
    click_button 'Create Account'


    expect(page).to have_content('Sorry, that username is already being used.')
  end

end
