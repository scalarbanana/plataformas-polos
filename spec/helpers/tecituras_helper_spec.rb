# frozen_string_literal: true

require('rails_helper')
require('support/factory_bot')

RSpec.describe(TeciturasHelper, type: :helper) do
  describe '#ano_semestre' do
    it 'returns the passed "$year$semester" parameters' do
      expect(helper.ano_semestre(2019, 2)).to(eq('2019/2'))
    end

    it 'returns the tecitura instance "$year/$semester"' do
      assign(:tecitura, build(:tecitura, vinculacao_ano: 2020, vinculacao_semestre: 1))
      expect(helper.ano_semestre).to(eq('2020/1'))
    end
  end

  describe '#ano_collection' do
    it 'returns a list of years in descending order from the current one' do # rubocop:disable RSpec/ExampleLength
      expect(helper.ano_collection).to(
        satisfy do |array|
          array.first == Date.current.year && array.each_cons(2).all? do |(first, second)|
            first > second
          end
        end
      )
    end
  end

  describe '#semestre_collection' do
    it 'returns a list of [ordinal number word, integer] tuples from 1 to 2' do
      expect(helper.semestre_collection).to(match_array([['1º', 1], ['2º', 2]]))
    end
  end
end
