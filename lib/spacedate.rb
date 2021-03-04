class SpaceDate
  def self.create(date:, available: true, space_id:)
    result = DBConnection.query(
      "INSERT INTO dates (date, available, space_id) 
      VALUES ('#{date}', '#{available}', '#{space_id}') 
      RETURNING id, date, available, space_id;"
    )
    SpaceDate.new(
      id:         result[0]['id'],
      date:       result[0]['date'],
      available:  result[0]['available'],
      space_id:   result[0]['space_id']
    )
  end

  attr_reader :id, :date, :space_id

  def initialize(id:, date:, available:, space_id:)
    @id = id
    @date = date
    @available = available
    @space_id = space_id
  end

  def available?
    @available == "t"
  end
end