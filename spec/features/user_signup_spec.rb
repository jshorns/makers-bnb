feature 'user sign up' do
  scenario 'user can sign up via the website' do
    visit '/'
    click_link "Sign Up"
    fill_in :name, with: "Mr Blobby"
    fill_in :email, with: "mrblobby@houseparty.co.uk"
    fill_in :password, with: "noeledmunds"
    fill_in :username, with: "mrblobby"
    click_button "Submit"

    expect(page).to have_content("Welcome to Makers BnB, Mr Blobby!")
  end
end
