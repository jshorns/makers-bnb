feature 'add space to website' do
  scenario 'user can add a space' do
    signup_and_signin
    click_link "My Spaces"
    fill_in :name, with: "Crinkly Bottom"
    fill_in :description, with: "Large house in leafy England, space to entertain many guests, one annoying resident"
    fill_in :price, with: "150"
    fill_in :start_date, with: "2021-03-05"
    fill_in :end_date, with: "2021-04-05"
    click_button 'Post My Space'

    expect(page).to have_content "Crinkly Bottom"

    click_link "Check availability"

    expect(page).to have_content "2021-03-05"
    expect(page).not_to have_content "2021-05-05"
  end
end
