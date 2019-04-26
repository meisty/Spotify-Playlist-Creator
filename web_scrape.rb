require 'httparty'
require 'nokogiri'

# Fetch and parse websites HTML
page = HTTParty.get('http://www.digitalgunfire.com/')
nokogiri_page = Nokogiri::HTML(page)

# Locate the song history items within the CSS
song_title =  nokogiri_page.css('td')

# Convert nokogiri XML object to string and then delete tab keys
song_text = song_title.text.to_s
song_text = song_text.delete("\t").delete("\r")
array = song_text.split("\n")
array.delete_at(0)
song_history = array.each_slice(4).to_a

# artists
artists = []
song_history.each do |item|
  artists.append(item[0])
end

# tracks
tracks = []
song_history.each do |item|
  tracks.append(item[1])
end

# Testing that the arrays hold the correct information
puts artists[0] + " - " + tracks[0]
