class FetchArtistJob < ActiveJob::Base
  queue_as :default

  def perform(name)
    # Do something later
    uri = URI("https://itunes.apple.com/search?term=#{ name }&entity=musicArtist")
    begin
      response = JSON.parse Net::HTTP.get(uri)
      if response['resultCount'] == 0
        puts 'Artist not found'
        return
      end
      p response
    rescue SocketError => e
      puts e.message
    end
  end
end
