require 'pg'
require_relative 'db_connection'

class Request
  def self.create(confirmed:, space_id:, date_id:, customer_id:, landlord_id:)

      result = DBConnection.query(
        "INSERT INTO booking_requests (confirmed, space_id, date_id, customer_id, landlord_id)
        VALUES(NULL, '#{space_id}', '#{date_id}', '#{customer_id}', '#{landlord_id}')
        RETURNING id, confirmed, space_id, date_id, customer_id, landlord_id;"
      )

    Request.new(
      id: result[0]['id'],
      confirmed: result[0]['confirmed'],
      space_id: result[0]['space_id'],
      date_id: result[0]['date_id'],
      customer_id: result[0]['customer_id'],
      landlord_id: result[0]['landlord_id']
    )
  end

  def self.all_by_landlord_id(landlord_id:)
    result = DBConnection.query('SELECT * FROM booking_requests')
    result.reverse_each.map do |request|
      Request.new(id: request['id'], confirmed: request['confirmed'],
         space_id: request['space_id'], date_id: request['date_id'],
         customer_id: request['customer_id'], landlord_id: request['landlord_id'])
    end
  end

  attr_reader :id ,:confirmed ,:space_id ,:date_id ,:customer_id, :landlord_id

  def initialize(id:, confirmed:, space_id:, date_id:, customer_id:, landlord_id:)
    @id = id
    @confirmed = confirmed
    @space_id = space_id
    @date_id = date_id
    @customer_id = customer_id
    @landlord_id = landlord_id
  end
end
