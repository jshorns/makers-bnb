require 'pg'

class DBConnection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(query)
    @connection.exec(query)
  end

  def self.connection
    @connection
  end
end
