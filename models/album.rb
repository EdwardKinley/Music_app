require('pg')
require_relative('../db/sql_runner.rb')

class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id']
end

def retitle(new_title)
  @title = new_title
  sql = "UPDATE albums SET title = $1 WHERE id = $2"
  values = [@title, @id]
  SqlRunner.run(sql, values)
end

def regenre(new_genre)
  @genre = new_genre
  sql = "UPDATE albums SET genre = $1 WHERE id = $2"
  values = [@genre, @id]
  SqlRunner.run(sql, values)
end

def reartist_id(new_artist_id)
  @artist_id = new_artist_id
  sql = "UPDATE albums SET artist_id = $1 WHERE id = $2"
  values = [@artist_id, @id]
  SqlRunner.run(sql, values)
end

def save()
  sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1,$2, $3) RETURNING id"
values = [@title, @genre, @artist_id]
results = SqlRunner.run(sql, values)
@id = results[0]['id'].to_i
end

# def edit(attribute, new_value)
#   sql = "UPDATE albums SET attribute = new_value WHERE id = $1"
#   values = [@id]
#
# end

def delete()
  sql = "DELETE FROM albums WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def artist()
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  artist = SqlRunner.run(sql,values)[0]
  return Artist.new(artist)
end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map{|album| Album.new(album)}
end

def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def self.find_by_id(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  album_found_by_id = SqlRunner.run(sql, values).first
  return Album.new(album_found_by_id)
end

end
