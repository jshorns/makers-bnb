# frozen_string_literal: true

require './lib/db_connection'

if ENV['ENVIRONMENT'] == 'test'
  DBConnection.setup('makersbnb_test')
else
  DBConnection.setup('makersbnb')
end
