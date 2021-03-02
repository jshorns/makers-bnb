require 'pg'

class Space
  attr_reader :name, :description, :price

  def initialize
    @name = name
    @description = description
    @price = price
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.exec('SELECT * FROM spaces')
    result.reverse_each.map do |space|
      Space.new(name: space['name'], description: space['description'], price: space['price'])
    end
  end
end
