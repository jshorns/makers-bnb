feature 'booking a space' do
  scenario 'user can book a night in a space' do
    user = signup_and_signin
    space = create_test_space_1(user)
    create_test_calendar(space)
    sign_out
    user2 = signup_and_signin2
    visit('/spaces')
    click_link('View availability')
    click_link('Request to book', match: :first)
    expect(page).to have_content('You are booking 6 Bedroom Penthouse for 2022-03-01')
    click_button('Confirm')
    expect(page).to have_content('Your booking request for 6 Bedroom Penthouse on 2022-03-01 has been made.')
    sign_out
    visit '/sessions/new'
    fill_in(:email, with: 'mrblobby@houseparty.co.uk')
    fill_in(:password, with: 'noeledmunds')
    click_button('Log in')
    click_link('My Requests')
    p Request.all_by_landlord_id(landlord_id: user.id)
    expect(page).to have_content('Request for 6 Bedroom Penthouse for 2022-03-01 from Mr. Blobber')
    expect(page).to have_link('Confirm')
    expect(page).to have_link('Reject')
  end
end
