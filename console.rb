require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

FreddieMercury = Artist.new({"first_name" => "Freddie", "last_name" => "Mercury"})
FreddieMercury.save()

TaylorSwift = Artist.new({"first_name" => "Taylor", "last_name" => "Swift"})
TaylorSwift.save()

Madonna = Artist.new("first_name" => "Madonna")
Madonna.save()










binding.pry
nil
