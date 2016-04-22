class Album
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  belongs_to :artist
  validates :name, presence: true
  validates :url, presence: true
  validates :artist, presence: true
end
