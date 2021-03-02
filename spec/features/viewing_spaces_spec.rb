feature 'Viewing spaces' do 
  scenario 'visiting spaces page' do 
    User.create(name: "landlord", password: "123", email: "email@email.com", username:"rich")
    Space.create(name: "room" , description: "ugly", price: 10, user_id: 1)

    visit '/spaces'

    expect(page).to have_content("room", "ugly", "10")
 end 
end
