require './lib/spacedate'

describe SpaceDate do
  describe '.create' do
    it 'creates a new date' do
      user = User.create(
        name: "landlord", 
        password: "123", 
        email: "email@email.com", 
        username:"rich"
      )
      space = Space.create(
        name: '6 Bedroom Penthouse', 
        description: 'In the heart of London', 
        price: 150, 
        user_id: user.id
      )
      date = SpaceDate.create(
        date: "2021-03-08", 
        available: true, 
        space_id: space.id
      )
      
      expect(date).to be_a SpaceDate
      expect(date.date).to eq "2021-03-08"
      expect(date.available?).to be true
      expect(date.space_id).to eq space.id
    end
  end




  # describe 'date'

  # describe '#available?'
end