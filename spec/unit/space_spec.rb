require 'space'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      space = Space.create(name: '6 Bedroom Penthouse', description: 'In the heart of London', price: 150, user_id: 1)
      # persisted_data = persisted_data(table: :users, id: user.id)
      expect(space).to be_a Space
      expect(space.name).to eq '6 Bedroom Penthouse'
      expect(space.description).to eq 'In the heart of London'
      expect(space.price).to eq 150
    end
  end

  describe '.all' do
    it 'displays all spaces' do

    end
  end
end
