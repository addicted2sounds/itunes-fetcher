class Artist
  include Mongoid::Document
  field :name, type: String
  field :itunes_id, type: Integer
end
