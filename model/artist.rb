require_relative("../db/sql_runner")
class Artist
  attr_reader :id, :name
  def initialize options
    @id = options["id"] if options["id"].to_i
    @name = options["name"]
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    albums = SqlRunner.run(sql, values)
    @id = albums[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist_hash| Artist.new(artist_hash)}
  end
end
