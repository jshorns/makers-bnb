# frozen_string_literal: true

require 'space'
require 'user'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      user = create_test_user_1
      space = create_test_space_1(user)
      # persisted_data = persisted_data(table: :spaces, id: user.id)
      expect(space.name).to include('6 Bedroom Penthouse')
      expect(space.description).to eq 'In the heart of London'
      expect(space.price).to eq '$150.00'
    end
  end

  describe '.find_by_name' do
    it 'finds a space' do
      user = create_test_user_1
      space = create_test_space_1(user)
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
      first_user = create_test_user_1
      second_user = create_test_user_2

      first_space = create_test_space_1(first_user)
      second_space = create_test_space_2(first_user)
      create_test_space_3(second_user)

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
      first_user = create_test_user_1
      second_user = create_test_user_2

      first_space = create_test_space_1(first_user)
      second_space = create_test_space_2(first_user)
      third_space = create_test_space_3(second_user)

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
