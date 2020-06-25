# frozen_string_literal: true

require('rails_helper')
require('support/devise')
require('support/factory_bot')

RSpec.describe('Downloads', type: :request) do
  describe 'GET /uploads/reports' do
    context 'without a valid session' do
      it 'redirects to login page' do
        get '/uploads/reports/somefile'
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    context 'with a valid session' do
      let(:document) { create(:tecitura, :relatorio).relatorios.first!.documento }

      before do
        sign_in(create(:user, :tecitura))
      end

      after do
        Tecitura.destroy_all
      end

      it 'streams the right file' do
        get document.download_url
        expect(response.body).to eq(document.open.read)
      end
    end
  end
end
