json.data do |json|
  json.array!(@artists) do |artist|
    json.extract! artist, :id
    json.type 'artist'
    json.attributes do |json|
      json.extract! artist, :name
      json.url artist_url(artist, format: :json)
    end
  end
end
