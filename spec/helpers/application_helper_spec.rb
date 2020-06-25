# frozen_string_literal: true

require('rails_helper')

RSpec.describe(ApplicationHelper, type: :helper) do
  def request_path(path)
    controller.request.env['PATH_INFO'] = path
  end

  describe '#current_route_scope' do
    it 'returns `dashboard` as the root' do
      request_path('/')
      expect(helper.current_route_scope).to(eq('dashboard'))
    end

    it 'identifies the `tecitura` module prefix' do
      request_path('/tecituras/' + Faker::Internet.uuid)
      expect(helper.current_route_scope).to(eq('tecitura'))
    end

    it 'identifies the `users` module prefix' do
      request_path('/users/' + Faker::Internet.uuid)
      expect(helper.current_route_scope).to(eq('user'))
    end

    it 'identifies the `cartografias` module prefix' do
      request_path('/cartografias/' + Faker::Internet.uuid)
      expect(helper.current_route_scope).to(eq('cartografia'))
    end
  end

  describe '#notification_class' do
    it 'maps success -> is-class' do
      expect(helper.notification_class(:success)).to(eq('is-success'))
    end

    it 'maps notice -> is-info' do
      expect(helper.notification_class(:notice)).to(eq('is-info'))
    end

    it 'maps alert -> is-warning' do
      expect(helper.notification_class(:alert)).to(eq('is-warning'))
    end

    it 'defaults to is-danger' do
      expect(helper.notification_class('else')).to(eq('is-danger'))
    end
  end
end
