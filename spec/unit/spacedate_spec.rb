# frozen_string_literal: true

require './lib/spacedate'

describe SpaceDate do
  describe '.create' do
    it 'creates a new date' do
      user = create_test_user_1
      space = create_test_space_1(user)
      date = create_test_date(space)

      expect(date).to be_a SpaceDate
      expect(date.date).to eq '2021-03-08'
      expect(date.available?).to be true
      expect(date.space_id).to eq space.id
    end
  end
end
