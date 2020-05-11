# frozen_string_literal: true

if Rails.env.test?
  User.create!(name: 'Admin', email: 'test@mail.com', password: 'password', roles: [:admin])
end
