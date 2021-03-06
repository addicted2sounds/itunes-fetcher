require 'rails_helper'

RSpec.describe ArtistsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/artists.json').to route_to('artists#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/artists/1.json').to route_to('artists#show', id: '1', format: 'json')
    end
  end
end
