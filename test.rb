require 'httparty'
require 'nokogiri'

class Scraper

  attr_reader :url, :css_tag

  def initialize(url, css_tag)
    @url = url
    @css_tag = css_tag
  end

  def parse_html
    page = HTTParty.get(@url)
    nokogiri_page = Nokogiri::HTML(page)
    # Locate the song history items within the CSS
    song_title =  nokogiri_page.css(@css_tag)
  end

  def format_song_history
    song_text = parse_html.text.to_s
    song_text = song_text.delete("\t").delete("\r")
    array = song_text.split("\n")
    array.delete_at(0)
    @song_history = array.each_slice(4).to_a
  end

  def get_artists
    artists = []
    @song_history.each do |item|
      artists.append(item[0])
    end
    artists
  end

  def get_tracks
    tracks = []
    @song_history.each do |item|
      tracks.append(item[1])
    end
    tracks
  end

end

=begin scrape = Scraper.new('http://www.digitalgunfire.com/', "td")
scrape.format_song_history

artists = scrape.get_artists
tracks = scrape.get_tracks

puts artists
puts "-" * 80
puts tracks
=end
