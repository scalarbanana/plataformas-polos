# frozen_string_literal: true

class AddNameAndPermissionsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string(:name, null: false)
      t.string(:permissions, array: true)
    end

    add_index(:users, :permissions, using: 'gin')
  end
end
