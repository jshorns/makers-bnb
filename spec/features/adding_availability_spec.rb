# frozen_string_literal: true

feature 'availability' do
  scenario 'user can add available dates to a property they own' do
    user = signup_and_signin
    space = create_test_space_1(user)
    create_test_calendar(space)

    visit('/spaces')
    click_link('Check availability')
    click_link 'Add availability'
    fill_in :start_date, with: '2022-05-05'
    fill_in :end_date, with: '2022-05-15'
    click_button 'Add dates'

    expect(page).to have_content('2022-05-06')
  end
end
