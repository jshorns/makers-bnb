require 'pg'

def setup_test_database

  p 'Setting up database...'

  DBConnection.setup('makersbnb_test')

  DBConnection.query("TRUNCATE users CASCADE;")

end
