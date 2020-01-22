require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :first_name, :last_name, :id

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name'] if options['last_name']
    @id = options['id'] if options['id']
  end

  def save()
    sql = "INSERT INTO artists (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.list_all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
