# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  attribute :name, :string
  attribute :permissions, :string, array: true

  enumerize :permissions, in: %i[admin tecitura cartografia], multiple: true
  validates :name, presence: true
end
