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

      t.string(:situacao_atual)
      t.string(:nucleo_familiar)
      t.string(:regiao)
      t.string(:situacao_acolhimento)
      t.string(:ref_atencao_primaria)
      t.string(:ref_assistencia_social)
      t.string(:vinc_familiares_comunitarios)
      t.string(:situacao_juridica)

      t.string(:equipe_tecitura)
      t.string(:ref_padhu)
      t.string(:responsaveis)

      t.timestamps
    end
  end
end
