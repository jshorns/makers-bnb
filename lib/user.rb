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
  end

  def self.create(username:, post:)
    connection = PG.connect(dbname: ‘makers_bnb_test')
    connection.exec("INSERT INTO users(name, description, price) VALUES('#{name}', ‘#{description}’, #{price});”)
  end
end