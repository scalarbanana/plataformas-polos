# frozen_string_literal: true

require('rails_helper')

RSpec.describe(DownloadsController, type: :routing) do
  describe 'routing' do
    it 'routes to #report' do
      expect(get: '/uploads/reports/filename').to route_to(
        controller: 'downloads',
        action: 'report',
        file: 'filename'
      )
    end
  end
end
