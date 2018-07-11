require_relative("../model/album")
require_relative("../model/artist")
artist1 = Artist.new({"name" => "Bill Whiters"})

artist1.save
album1 = Album.new({"title" => "Menagerie", "genre" => "Rythm and Blues", "artist_id" => artist1.id})
album1.save


p album1.artist
