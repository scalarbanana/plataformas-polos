# frozen_string_literal: true

module TeciturasHelper
  def ano_semestre(tecitura)
    "#{tecitura.vinculacao_ano}/#{tecitura.vinculacao_semestre}"
  end
end
