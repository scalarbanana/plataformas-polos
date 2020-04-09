# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'sistema@polosdecidadania.com.br'
  layout 'mailer'
end
