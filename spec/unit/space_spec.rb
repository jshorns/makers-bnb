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

  describe '.find_by_name' do
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

      result = Space.find_by_name(name: space.name)

      expect(result.id).to eq space.id
      expect(result.name).to eq space.name
      expect(result.description).to eq space.description
      expect(result.price).to eq space.price
    end

    it 'returns nil if there is no name given' do
      expect(Space.find_by_name(name: nil)).to eq nil
    end
  end

  describe '.find_by_user_id' do
    it 'returns spaces by user_id in descending order' do 
      first_user = User.create(
        name:     "Mr. Blobby",
        password: "noeledmunds",
        email:    "mrblobby@houseparty.co.uk",
        username: "mrblobby"
      )

      first_space = Space.create(
        name: "Bedroom Penthouse",
        description: "In the heart of London",
        price: 150,
        user_id: first_user.id
      )
      second_space = Space.create(
        name: "Royal",
        description: "In the heart of London",
        price: 250,
        user_id: first_user.id
      )

      second_user = User.create(
        name:     "Mr. Blobber",
        password: "weakpassword",
        email:    "mrblobber@houseparty.co.uk",
        username: "mrblobber"
      )

      third_space = Space.create(
        name: "Peasant",
        description: "Far away from London",
        price: 50,
        user_id: second_user.id
      )

      result = Space.find_by_user_id(id: first_user.id)

      expect(result.length).to eq 2
      expect(result.first).to be_a Space
      expect(result.first.name).to eq second_space.name
      expect(result.last).to be_a Space
      expect(result.last.name).to eq first_space.name
    end    
  end

  describe '.all' do
    it 'returns all spaces' do
      first_user = User.create(
        name:     "Mr. Blobby",
        password: "noeledmunds",
        email:    "mrblobby@houseparty.co.uk",
        username: "mrblobby"
      )

      second_user = User.create(
        name:     "Mr. Blobber",
        password: "weakpassword",
        email:    "mrblobber@houseparty.co.uk",
        username: "mrblobber"
      )
      
      first_space = Space.create(
        name: "Bedroom Penthouse",
        description: "In the heart of London",
        price: 150,
        user_id: first_user.id
      )

      second_space = Space.create(
        name: "Royal",
        description: "In the heart of London",
        price: 250,
        user_id: first_user.id
      )

      third_space = Space.create(
        name: "Peasant",
        description: "Far away from London",
        price: 50,
        user_id: second_user.id
      )

      result = Space.all

      expect(result.length).to eq 3
      expect(result[0]).to be_a Space
      expect(result[0].name).to eq third_space.name
      expect(result[1]).to be_a Space
      expect(result[1].name).to eq second_space.name
      expect(result[2]).to be_a Space
      expect(result[2].name).to eq first_space.name     

    end
  end   

end





