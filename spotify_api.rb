require 'rspotify'
require 'dotenv'

Dotenv.load("api_keys.env")

RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

artist = RSpotify::Artist.search("grendel")

grendel = artist.first
puts grendel.genres
