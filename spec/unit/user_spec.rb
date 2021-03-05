# frozen_string_literal: true

require 'user'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates a new user instance' do
      user = create_test_user_1

      expect(user).to be_a User
      expect(user.name).to eq 'Mr. Blobby'
      expect(user.email).to eq 'mrblobby@houseparty.co.uk'
      expect(user.username).to eq('mrblobby')
    end

    it 'hashes the password using Bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('noeledmunds')

      create_test_user_1
    end
  end

  describe '.authenticate' do
    it 'returns a user if login is successful' do
      user = create_test_user_1
      authenticated_user = User.authenticate(
        email: 'mrblobby@houseparty.co.uk',
        password: 'noeledmunds'
      )

      expect(authenticated_user).to be_a User
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if given incorrect email' do
      create_test_user_1

      expect(User.authenticate(
        email: 'sesamestreet@wrongemail.co.uk',
        password: 'noeledmunds'
      )).to be_nil
    end

    it 'returns nil if given incorrect password' do
      create_test_user_1

      expect(User.authenticate(
        email: 'mrblobby@houseparty.co.uk',
        password: 'cookiemonster7878'
      )).to be_nil
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = create_test_user_1
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
