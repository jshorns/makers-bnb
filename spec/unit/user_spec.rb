require 'user'

describe User do
  
  describe '.create' do
    it 'creates a new user instance' do
      user = User.create(name: "Mr. Blobby", password: "noeledmunds", email: "mrblobby@houseparty.co.uk", username: "mrblobby")

      expect(user).to be_a User
      expect(user.name).to eq "Mr. Blobby"
      expect(user.email).to eq "mrblobby@houseparty.co.uk"
      expect(user.username).to eq("mrblobby")
    end
  end
end
