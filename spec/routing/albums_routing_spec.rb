require 'rails_helper'

RSpec.describe AlbumsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/albums.json').to route_to('albums#index', format: 'json')
    end
  end
end
