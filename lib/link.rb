require_relative 'database_connection'
require 'uri'
# establishes access to link objects via use of rows
class Link
  attr_reader :id, :url, :title

  def initialize(row)
    @id = row[0]
    @url = row[1]
    @title = row[2]
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    @array = []
    result.each_row { |row| @array.push(Link.new(row)) }
    @array
  end

  def self.add(new_link, title)
    error_check(new_link)
    links = "INSERT INTO links (url, title) VALUES('#{new_link}', '#{title}')"
    DatabaseConnection.query(links)
  end

  def self.error_check(new_link)
    raise 'This is not a valid URL' unless valid_url?(new_link)
  end

  def self.valid_url?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
