# frozen_string_literal: true

require './lib/calendar'
require './lib/spacedate'

describe Calendar do
  describe '.create' do
    it 'returns a Calendar object for the space with March dates' do
      user = create_test_user_1
      space = create_test_space_1(user)
      calendar = create_test_calendar(space)

      expect(calendar).to be_a Calendar
      expect(calendar.dates).to be_a Array
      expect(calendar.dates.first).to be_a SpaceDate
      expect(calendar.dates.first.date).to eq('2022-03-01')
      expect(calendar.dates.first.space_id).to eq space.id
      expect(calendar.dates.first.available?).to be true
      expect(calendar.space_id).to eq space.id
    end
  end
  describe '.find' do
    it 'returns a Calendar object for the given space' do
      user = create_test_user_1
      space = create_test_space_1(user)
      create_test_calendar(space)
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
