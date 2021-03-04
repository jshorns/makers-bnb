feature 'date availability' do
  scenario 'user can view dates that a space is available' do
    user = signup_and_signin
    Space.create(name: "room" , description: "ugly", price: 10, user_id: user.id)
    visit('/spaces')
    click_link('Check availability')
    expect(page).to have_content(/ugly/)
    expect(page).to have_content('2022-03-04')
    expect(page).to have_link('Request to book', href: '#')
  end
end
