class FetchArtistJob < ActiveJob::Base
  queue_as :default

  def fetch_artists(name)
    uri = URI("https://itunes.apple.com/search?term=#{ name }&entity=musicArtist")
    response = JSON.parse Net::HTTP.get(uri)
    puts 'Artist not found' if response['resultCount'] == 0
    response['results'].map do |result|
      Artist.create name: result['artistName'], itunes_id: result['artistId']
    end
  end

  def fetch_albums(artist)
    uri = URI(" https://itunes.apple.com/lookup?id=#{ artist.itunes_id }&entity=album")
    response = JSON.parse Net::HTTP.get(uri)
    puts "No albums found for #{ artist.name }" if response['resultCount'] == 0
    response['results'].each do |result|
      artist = Artist.create name: result['artistName'], itunes_id: result['artistId']
    end
  end

  def perform(name)
    # Do something later
    begin
      fetch_artists(name).each do |artist|
        fetch_albums artist.itunes_id
      end
    rescue SocketError => e
      puts e.message
    end
  end
end
