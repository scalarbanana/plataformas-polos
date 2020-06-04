# frozen_string_literal: true

class CreateCartografias < ActiveRecord::Migration[6.0]
  def change
    create_table :cartografias, id: :uuid do |t|
      t.string(:questao)
      t.string(:resumo)
      t.string(:fonte)
      t.string(:local)
      t.text(:referencias)
      t.date(:data)
      t.text(:descricao)
      t.string(:temas)
      t.text(:observacoes)
      t.text(:citacoes)
      t.string(:responsavel)

      t.timestamps
    end
  end
end
