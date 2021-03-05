# frozen_string_literal: true

require 'pg'
require_relative 'db_connection'
require 'bcrypt'

class User
  def self.create(name:, password:, email:, username:)
    encrypted_password = BCrypt::Password.create(password)

    result = DBConnection.query(
      "INSERT INTO users (name, password, email, username)
      VALUES('#{name}', '#{encrypted_password}', '#{email}', '#{username}' )
      RETURNING id, name, password, email, username;"
    )

    User.new(
      id:       result[0]['id'],
      name:     result[0]['name'],
      password: result[0]['password'],
      email:    result[0]['email'],
      username: result[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    result = DBConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?

    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(
      id:       result[0]['id'],
      email:    result[0]['email'],
      password: result[0]['password'],
      name:     result[0]['name'],
      username: result[0]['username']
    )
  end

  def self.find(id: nil)
    return nil unless id

    result = DBConnection.query("SELECT id, name, username, email FROM users WHERE id= #{id};")
    User.new(
      id:       result[0]['id'],
      email:    result[0]['email'],
      name:     result[0]['name'],
      password: result[0]['password'],
      username: result[0]['username']
    )
  end

  def self.find_user_by_email(email: nil)

    p email
    result = DBConnection.query("SELECT id, name, username, email FROM users WHERE email= '#{email}';")
    p result[0]
    return :success if result[0] == nil


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
