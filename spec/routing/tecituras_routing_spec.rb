# frozen_string_literal: true

require('rails_helper')

RSpec.describe(TeciturasController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tecituras').to route_to('tecituras#index')
    end

    it 'routes to #new' do
      expect(get: '/tecituras/new').to route_to('tecituras#new')
    end

    it 'routes to #show' do
      expect(get: '/tecituras/1').to route_to('tecituras#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tecituras/1/edit').to route_to('tecituras#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tecituras').to route_to('tecituras#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tecituras/1').to route_to('tecituras#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tecituras/1').to route_to('tecituras#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tecituras/1').to route_to('tecituras#destroy', id: '1')
    end
  end
end
