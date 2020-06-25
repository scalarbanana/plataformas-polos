# frozen_string_literal: true

class CreateRelatorios < ActiveRecord::Migration[6.0]
  def change
    create_table :relatorios, id: :uuid do |t|
      t.integer(:ano)
      t.integer(:semestre)
      t.jsonb(:documento_data)

      t.belongs_to(:tecitura, foreign_key: true, type: :uuid)

      t.timestamps
    end
  end
end
