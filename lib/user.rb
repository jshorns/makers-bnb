require 'pg'

class User
  attr_reader :name, :description, :price, :id

  def initialize(name:, password:, email:, username:, id:)
    @name = name
    @password = password
    @email = email
    @username = username
    @id = id
  end

  def self.create(name:, password:, email:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end 
    
    result = connection.exec("INSERT INTO users (name, password, email, username) VALUES('#{name}', '#{password}', '#{email}', '#{username}' ) RETURNING id, name, password, email, username;")  
    User.new(id: result[0]['id'], name: result[0]['name'], password: result[0]['password'], email: result[0]['email'], username: result[0]['username'])
  end

end
