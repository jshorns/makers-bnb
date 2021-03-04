require 'pg'
require_relative 'db_connection'

class Space
  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

  def self.create(name:, description:, price:, user_id:)
    result = DBConnection.query("INSERT INTO spaces (name, description, price, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{user_id}' ) RETURNING id, name, description, price;")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DBConnection.query('SELECT * FROM spaces')
    result.reverse_each.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], user_id: space['user_id'])
    end
  end

  def self.find(name: nil)
    return nil unless name

    result = DBConnection.query("SELECT id, name, description, price, user_id FROM spaces WHERE name= '#{name}';")
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      user_id: result[0]['user_id']
    )
  end

  def self.find_by_id(id: nil)
    return nil unless id

    result = DBConnection.query("SELECT id, name, description, price, user_id FROM spaces WHERE id= '#{id}';")
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      user_id: result[0]['user_id']
    )
  end
end
