require 'rails_helper'

RSpec.describe ArtistsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/artists.json').to route_to('artists#index', format: 'json')
    end
  end
end
