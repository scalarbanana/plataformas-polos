# frozen_string_literal: true

require('rails_helper')
require('support/devise')
require('support/factory_bot')

RSpec.describe('Aporo', type: :feature) do
  before { login_as(create(:user)) }

  it 'Usuário registra um novo conflito' do
    conflito_titulo            = 'Conflito #1'
    conflito_municipios        = Array.new(2) { Faker::Address.city }
    conflito_referencias       = Array.new(2) { Faker::Internet.url }
    conflito_afetados          = Faker::Lorem.paragraph
    conflito_vlcs_estruturais  = Faker::Lorem.paragraph
    conflito_vuln_estruturais  = Faker::Lorem.paragraph
    conflito_vlcs_cometidas    = Faker::Lorem.paragraph
    conflito_vuln_geradas      = Faker::Lorem.paragraph
    conflito_riscos_gerados    = Faker::Lorem.paragraph
    conflito_planos_resposta   = Faker::Lorem.paragraph
    conflito_modos_resistir    = Faker::Lorem.paragraph
    conflito_redes_cuidados    = Faker::Lorem.paragraph
    conflito_pandemia          = Faker::Lorem.paragraph
    conflito_pandemia_resistir = Faker::Lorem.paragraph
    conflito_acoes_polos       = Faker::Lorem.paragraph
    conflito_pesquisadores     = Array(2) { Faker::Name.name }

    visit '/aporo'
    click_on 'Registrar novo conflito'
    fill_in 'Título', with: conflito_titulo
    fill_in 'Municípios', with: conflito_municipios
    fill_in 'Materiais de Referência', with: conflito_referencias
    fill_in 'Afetados', with: conflito_afetados
    fill_in 'Violências Estruturais', with: conflito_vlcs_estruturais
    fill_in 'Vulnerabilidades Estruturais', with: conflito_vuln_estruturais
    fill_in 'Violências Cometidas', with: conflito_vlcs_cometidas
    fill_in 'Vulnerabilidades Geradas', with: conflito_vuln_geradas
    fill_in 'Riscos Gerados', with: conflito_riscos_gerados
    fill_in 'Plano de Preparação e Resposta', with: conflito_planos_resposta
    fill_in 'Modos de Existir/Resistir', with: conflito_modos_resistir
    fill_in 'Redes de Cuidados, Atenção e Proteção', with: conflito_redes_cuidados
    fill_in 'Pandemia Novo Coronavírus', with: conflito_pandemia
    fill_in 'Modos de Existir/Resistir Corona', with: conflito_pandemia_resistir
    fill_in 'Projetos e Ações Desenvolvidos', with: conflito_acoes_polos
    fill_in 'Pesquisadores-Extensionistas', with: conflito_pesquisadores
    click_on 'Salvar'

    expect(page).to have_content('Conflito registrado com sucesso')
    expect(page).to have_content(conflito_titulo)
    expect(page).to have_content(conflito_municipios)
    expect(page).to have_content(conflito_referencias)
    expect(page).to have_content(conflito_afetados)
    expect(page).to have_content(conflito_vlcs_estruturais)
    expect(page).to have_content(conflito_vuln_estruturais)
    expect(page).to have_content(conflito_vlcs_cometidas)
    expect(page).to have_content(conflito_vuln_geradas)
    expect(page).to have_content(conflito_riscos_gerados)
    expect(page).to have_content(conflito_planos_resposta)
    expect(page).to have_content(conflito_modos_resistir)
    expect(page).to have_content(conflito_redes_cuidados)
    expect(page).to have_content(conflito_pandemia)
    expect(page).to have_content(conflito_pandemia_resistir)
    expect(page).to have_content(conflito_acoes_polos)
    expect(page).to have_content(conflito_pesquisadores)
  end
end
