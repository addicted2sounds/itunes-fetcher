json.data do |json|
  json.array!(@albums) do |album|
    json.extract! album, :id
    json.type 'album'
    json.attributes do |json|
      json.extract! album, :name, :url
    end
  end
end
