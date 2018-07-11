require_relative("../db/sql_runner")
class Album
  def initialize options
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    albums = SqlRunner.run(sql, values)
    @id = albums[0]["id"].to_i
  end
end
