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

  describe '.find' do
    it 'finds a space' do
      user = User.create(
        name:     "Mr. Blobby",
        password: "noeledmunds",
        email:    "mrblobby@houseparty.co.uk",
        username: "mrblobby"
      )

      space = Space.create(
        name: "Bedroom Penthouse",
        description: "In the heart of London",
        price: 150,
        user_id: user.id
      )

      result = Space.find(name: space.name)

      expect(result.id).to eq space.id
      expect(result.name).to eq space.name
      expect(result.description).to eq space.description
      expect(result.price).to eq space.price
    end

    it 'returns nil if there is no name given' do
      expect(Space.find(name: nil)).to eq nil
    end
  end

end
#   describe '.all' do
#     it 'displays all spaces' do

#     end
#   end
# end
