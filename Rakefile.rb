require 'pg'
require_relative 'lib/database_connection'

task :setup do
  connection = PG.connect
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection.exec("CREATE DATABASE #{database}")
    DatabaseConnection.setup("#{database}")
    DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
  end
end

task :setup_test_database do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE links;
  INSERT INTO links (url, title) VALUES('http://www.makersacademy.com', 'makersacademy');
  INSERT INTO links (url, title) VALUES('http://www.google.com', 'google');")
end
