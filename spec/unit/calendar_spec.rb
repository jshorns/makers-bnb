require './lib/calendar'
require './lib/spacedate'

describe Calendar do
  describe '.create' do
    it 'returns a Calendar object for the space with March dates' do
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
      calendar = Calendar.create(space_id: space.id)
      expect(calendar).to be_a Calendar
      expect(calendar.dates).to be_a Array
      expect(calendar.dates.first).to be_a SpaceDate
      expect(calendar.dates.first.date).to eq('2022-03-01')
      expect(calendar.dates.first.space_id).to eq space.id
      expect(calendar.space_id).to eq space.id
    end
  end
  describe '.find' do
    it 'returns a Calendar object for the given space' do
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
      Calendar.create(space_id: space.id)
      calendar = Calendar.find(space_id: space.id)
      expect(calendar).to be_a Calendar
      expect(calendar.dates).to be_a Array
      expect(calendar.dates.first).to be_a SpaceDate
      expect(calendar.dates.first.date).to eq('2022-03-01')
      expect(calendar.dates.first.space_id).to eq space.id
      expect(calendar.space_id).to eq space.id
    end
  end
end
