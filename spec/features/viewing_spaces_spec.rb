feature 'Viewing spaces' do 
  scenario 'visiting spaces page' do 
    user = User.create(name: "landlord", password: "123", email: "email@email.com", username:"rich")
    Space.create(name: "room" , description: "ugly", price: 10, user_id: user.id)

    visit '/spaces'

    expect(page).to have_content("room $10.00 ugly")
 end 
end
