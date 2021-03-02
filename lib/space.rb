require 'pg'
require 'db_connection'

class Space
  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      DBConnection.setup('makersbnb_test')
    else
      DBConnection.setup('makersbnb')
    end
      DBConnection.query("INSERT INTO spaces (name, description, price, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{user_id}' ) RETURNING id, name, description, price;")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      DBConnection.setup('makersbnb_test')
    else
      DBConnection.setup('makersbnb')
    end
    result = DBConnection.query('SELECT * FROM spaces')
    result.reverse_each.map do |space|
      Space.new(name: space['name'], description: space['description'], price: space['price'])
    end
  end
end
