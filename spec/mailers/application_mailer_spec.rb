# frozen_string_literal: true

require('rails_helper')

RSpec.describe(ApplicationMailer, type: :mailer) do
  it 'sets the correct `from:` address' do
    message = described_class.new.mail(to: 'test@mail.com', subject: 'Test', body: '').deliver
    expect(message.from).to(eq(['sistema@polosdecidadania.com.br']))
  end
end
