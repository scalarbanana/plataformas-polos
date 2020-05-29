# frozen_string_literal: true

require('rails_helper')

RSpec.describe(CartografiasController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cartografias').to(route_to('cartografias#index'))
    end

    it 'routes to #new' do
      expect(get: '/cartografias/new').to(route_to('cartografias#new'))
    end

    it 'routes to #show' do
      expect(get: '/cartografias/1').to(route_to('cartografias#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/cartografias/1/edit').to(route_to('cartografias#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/cartografias').to(route_to('cartografias#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/cartografias/1').to(route_to('cartografias#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/cartografias/1').to(route_to('cartografias#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/cartografias/1').to(route_to('cartografias#destroy', id: '1'))
    end
  end
end
