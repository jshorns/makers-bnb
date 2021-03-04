feature 'availability' do
  scenario 'user can add available dates to a property they own' do
    user = signup_and_signin
    space = Space.create(name: "room" , description: "ugly", price: 10, user_id: user.id)
    Calendar.create(space_id: space.id, start_date: '2022-03-01', end_date: '2022-03-31')
    visit('/spaces')
    click_link('Check availability')
    click_link "Add availability"
    fill_in :start_date, with: "2022-05-05"
    fill_in :end_date, with: "2022-05-15"
    click_button 'Add dates'
    expect(page).to have_content("2022-05-06")
  end
end
