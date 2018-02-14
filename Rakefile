require 'pg'

task :setup do
  connection = PG.connect
  connection.exec("CREATE DATABASE bookmark_manager;")
  connection.exec("CREATE DATABASE bookmark_manager_test;")

  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));")

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));")
end

task :setup_test_database do
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
end
