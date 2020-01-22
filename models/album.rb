require('pg')
require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :title, :genre, :year, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @year = options['year']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO albums (title, year, genre, artist_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @year, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def delete()
    sql = "DELETE * FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.list_all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album = Album.new(results.first)
    return album
  end

  def self.find_albums_by_artist_id(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def get_artist()
    sql = "SELECT artist_id FROM albums WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    artist_id = result.first['artist_id'].to_i()
    artist = Artist.find(artist_id)
    return artist
  end

  def update()
    sql = "UPDATE albums SET (title, year, genre, artist_id) = ($1, $2, $3, £4) WHERE id = $5"
    values = [@title, @year, @genre, @artist_id]
    SqlRunner.run(sql, values)
  end

end
