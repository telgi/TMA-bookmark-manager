require 'database_connection'

describe DatabaseConnection do

  describe '#::setup' do
    it "receives a message to connect to the database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'sets up connection to targeted database' do
      expect(described_class.setup("bookmark_manager_test")).to be_an_instance_of(PG::Connection)
    end
  end

  describe '#::connection' do
    it "creates persistent connection" do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#::query' do
    it 'executes a query' do
      connection = described_class.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM links")
      DatabaseConnection.query("SELECT * FROM links")
    end
  end
end
