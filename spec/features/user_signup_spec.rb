# frozen_string_literal: true

feature 'user sign up' do
  scenario 'user can sign up via the website' do
    sign_up

    expect(page).to have_content('Welcome to Makers BnB, Mr Blobby!')
  end

  scenario 'user gets an error' do
    sign_up
    save_and_open_page
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
end
