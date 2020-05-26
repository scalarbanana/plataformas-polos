# frozen_string_literal: true

module TeciturasHelper
  def ano_semestre(ano = @tecitura.vinculacao_ano, semestre = @tecitura.vinculacao_semestre) # rubocop:disable Rails/HelperInstanceVariable (but maybe shouldn't)
    "#{ano}/#{semestre}"
  end

  def ano_collection
    (2000..Date.current.year).reverse_each
  end

  def semestre_collection
    [['1º', 1], ['2º', 2]]
  end
end
