json.array! @artist.albums do |album|
  json.extract! album, :name, :url
end
