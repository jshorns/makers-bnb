require 'space'
require 'user'
describe Space do
  describe '.create' do
    it 'creates a new space' do

      user = User.create(name: "landlord", password: "123", email: "email@email.com", username:"rich")
      space = Space.create(name: '6 Bedroom Penthouse', description: 'In the heart of London', price: 150, user_id: user.id)
      # persisted_data = persisted_data(table: :spaces, id: user.id)
      expect(space.name).to include("6 Bedroom Penthouse")
      expect(space.description).to eq 'In the heart of London'
      expect(space.price).to eq "$150.00"
    end
  end
end
#   describe '.all' do
#     it 'displays all spaces' do

#     end
#   end
# end
