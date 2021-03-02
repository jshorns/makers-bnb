require 'db_connection'
require 'pg'

    describe 'DBConnection' do
      describe '.setup' do
        it 'sets up a datbase connection through PG' do
          expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

            DBConnection.setup('makersbnb_test')
        end
        it 'this connection is persistant' do
          connection = DBConnection.setup('makersbnb_test')
          expect(DBConnection.connection).to eq connection
        end
      end
    end
