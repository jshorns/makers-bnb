require 'pg'
require 'db_connection'

class User
  def self.create(name:, password:, email:, username:)
    result = DBConnection.query("INSERT INTO users (name, password, email, username) VALUES('#{name}', '#{password}', '#{email}', '#{username}' ) RETURNING id, name, password, email, username;")
    User.new(id: result[0]['id'], name: result[0]['name'], password: result[0]['password'], email: result[0]['email'], username: result[0]['username'])
  end
  
  attr_reader :name, :email, :username, :id

  def initialize(name:, password:, email:, username:, id:)
    @name = name
    @password = password
    @email = email
    @username = username
    @id = id
  end
end
