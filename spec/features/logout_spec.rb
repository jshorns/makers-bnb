feature 'logging out of makersbnb' do
  it 'destroys the session and displays a confirmation message' do
    signup_and_signin
    click_button('Log out')
    expect(page).to have_content('You have successfully logged out. Goodbye!')
    expect(page).to have_current_path('/')
  end
end
