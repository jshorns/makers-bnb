# frozen_string_literal: true

feature 'date availability' do
  scenario 'user can view dates that a space is available' do
    user = signup_and_signin
    space = create_test_space_1(user)
    create_test_calendar(space)

    visit('/spaces')
    click_link('View availability')

    expect(page).to have_content(/6 Bedroom Penthouse/)
    expect(page).to have_content('2022-03-04')
    expect(page).to have_link('Request to book', href: '#')
  end
end
