require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => "Abba"})
artist1.save()

artist2 = Artist.new({'name' => "Bros"})
artist2.save()

artist3 = Artist.new({'name' => "Rush"})
artist3.save()

album1 = Album.new({
  'title' => 'Arrival', 'artist_id' => artist1.id(),
  'genre' => 'pop'
  })
album1.save()

album2 = Album.new({
  'title' => 'Waterloo', 'artist_id' => artist1.id(),
  'genre' => 'pop'
  })
album2.save()

album3 = Album.new({
  'title' => 'Voulez-Vous', 'artist_id' => artist1.id(),
  'genre' => 'pop/rock'
  })
album3.save()

album4 = Album.new({
  'title' => 'Push', 'artist_id' => artist2.id(),
  'genre' => 'pop/rock'
  })
album4.save()

album5 = Album.new({
  'title' => 'The Time', 'artist_id' => artist2.id(),
  'genre' => 'pop'
  })
album5.save()

binding.pry
nil
