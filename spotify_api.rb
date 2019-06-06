require 'rspotify'
require 'dotenv'
require_relative 'test'

Dotenv.load("api_keys.env")

RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

artist = RSpotify::Artist.search("grendel")

grendel = artist.first

playlist = RSpotify::Playlist
#puts playlist.methods.sort
playlist2 = playlist.find("21st2yfoqz6jzxvu7iatjxzqq", "4kalAo98Yx9F9ntHSI2iZ8")

#puts grendel.genres
=begin
scrape = Scraper.new('http://digitalgunfire.com/', 'td')
scrape.format_song_history

artists = scrape.get_artists
tracks = scrape.get_tracks

artists.each { |item| puts item }
=end
