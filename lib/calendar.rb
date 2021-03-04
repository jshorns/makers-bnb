require_relative 'spacedate'

class Calendar

  def self.create(space_id:)
    calendar = Calendar.new(space_id: space_id)
    i = 1
    while i <= 31
      result = DBConnection.query("INSERT INTO dates (date, space_id) VALUES('2022-03-%01d', '#{space_id}') RETURNING id, date, available, space_id;" % [i])
      date = SpaceDate.new(id: result[0]['id'], date: result[0]['date'], available: result[0]['available'], space_id: result[0]['space_id'])
      calendar.add(date)
      i += 1
    end
    calendar
  end

  def self.find(space_id:)
    calendar = Calendar.new(space_id: space_id)
    result = DBConnection.query("SELECT * FROM dates WHERE space_id = '#{space_id}';")
    result.each do |date|
      space_date = SpaceDate.new(id: date['id'], date: date['date'], available: date['available'], space_id: date['space_id'])
      calendar.add(space_date)
    end
    calendar
  end

  attr_reader :dates, :space_id

  def initialize(space_id:)
    @dates = []
    @space_id = space_id
  end

  def add(date)
    @dates << date
  end

end
