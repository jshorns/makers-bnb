# frozen_string_literal: true

require 'pg'

def setup_test_database
  DBConnection.setup('makersbnb_test')
  DBConnection.query('TRUNCATE users CASCADE;')
end
