# frozen_string_literal: true

feature 'availability' do
  scenario 'user can add available dates to a property they own' do
    user = signup_and_signin
    space = create_test_space_1(user)
    create_test_calendar(space)

    visit('/spaces')
    click_link('View availability')
    click_link 'Add availability'
    fill_in :start_date, with: '2022-05-05'
    fill_in :end_date, with: '2022-05-15'
    click_button 'Add dates'

    expect(page).to have_content('2022-05-06')
  end
  scenario 'user cannot add available dates to a property they do not own' do
    user = signup_and_signin
    space = create_test_space_1(user)
    create_test_calendar(space)
    sign_out
    user2 = signup_and_signin2
    visit('/spaces')
    click_link('View availability')
    expect(page).not_to have_link('Add availability')
    visit("/spaces/#{space.id}/calendar/new")
    expect(page).to have_content('You must be the owner of a property to add available dates.')
  end
end
