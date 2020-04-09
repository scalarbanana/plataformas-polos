# frozen_string_literal: true

if Rails.env.test?
  User.create(name: 'Test User', email: 'test@mail.com', password: 'password')
end
