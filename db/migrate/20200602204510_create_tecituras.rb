# frozen_string_literal: true

class CreateTecituras < ActiveRecord::Migration[6.0]
  def change
    create_table :tecituras, id: :uuid do |t|
      t.string(:nome)
      t.string(:telefone)
      t.string(:endereco)
      t.string(:latitude)
      t.string(:longitude)

      t.integer(:vinc_ano)
      t.integer(:vinc_semestre)

      t.text(:situacao_atual)
      t.text(:nucleo_familiar)
      t.text(:regiao)
      t.text(:situacao_acolhimento)
      t.text(:ref_atencao_primaria)
      t.text(:ref_assistencia_social)
      t.text(:vinc_familiares_comunitarios)
      t.text(:situacao_juridica)

      t.string(:equipe_tecitura)
      t.string(:ref_padhu)
      t.string(:responsaveis)

      t.timestamps
    end
  end
end
