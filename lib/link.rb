require_relative 'database_connection'

class Link

  def self.all
    DatabaseConnection.query("SELECT url FROM links")
  end

  def self.add(new_link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{new_link}')")
  end
end
