require 'database_connection'

describe DatabaseConnection do

  describe '#::setup' do
    it "sets up a connection to the database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#::connection' do
    it "creates persistent connection" do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#::query' do
    it 'outputs the expected result' do
      described_class.setup('bookmark_manager_test')
      query_string = "SELECT url FROM links LIMIT 1"
      expect(described_class.query(query_string)).to eq ([['http://www.makersacademy.com']])
    end
  end
end
