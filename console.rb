require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

Album.delete_all()
Artist.delete_all()


freddie_mercury = Artist.new({"first_name" => "Freddie", "last_name" => "Mercury"})
freddie_mercury.save()

taylor_swift = Artist.new({"first_name" => "Taylor", "last_name" => "Swift"})
taylor_swift.save()

madonna = Artist.new("first_name" => "Madonna")
madonna.save()

true_blue = Album.new({"title" => "True Blue", "year" => 1986, "genre" => "pop", "artist_id" => madonna.id})
true_blue.save()

like_a_prayer = Album.new({"title" => "Like a Prayer", "year" => 1989, "genre" => "pop", "artist_id" => madonna.id})
like_a_prayer.save()

american_life = Album.new({"title" => "American Life", "year" => 2003, "genre" => "pop", "artist_id" => madonna.id})
american_life.save()

speak_now = Album.new({"title" => "Speak Now", "year" => 2010, "genre" => "pop", "artist_id" => taylor_swift.id})
speak_now.save()

lover = Album.new({"title" => "Lover", "year" => 2019, "genre" => "pop", "artist_id" => taylor_swift.id})
lover.save()

mr_bad_guy = Album.new({"title" => "Mister Bad Guy", "year" => 1985, "genre" => "pop", "artist_id" => freddie_mercury.id})
mr_bad_guy.save()

barcelona = Album.new({"title" => "Barcelona", "year" => 1989, "genre" => "pop", "artist_id" => freddie_mercury.id})
barcelona.save()




lover.delete()


mr_bad_guy.title = "Mr Bad Guy"
mr_bad_guy.update()



binding.pry
nil
