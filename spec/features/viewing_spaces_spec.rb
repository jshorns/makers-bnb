# frozen_string_literal: true

feature 'Viewing spaces' do
  scenario 'visiting spaces page' do
    user = create_test_user_1
    create_test_space_1(user)

    visit '/spaces'

    expect(page).to have_content(
      "6 Bedroom Penthouse\nIn the heart of London\n$150.00"
    )
  end
end
