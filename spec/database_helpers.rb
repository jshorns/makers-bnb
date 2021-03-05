# frozen_string_literal: true

require 'pg'
require './lib/db_connection'

def persisted_data(table:, id:)
  DBConnection.setup('makersbnb_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
