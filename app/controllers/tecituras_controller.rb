# frozen_string_literal: true

class TeciturasController < ApplicationController
  before_action :set_tecitura, only: %i[show edit update destroy]

  # GET /tecituras
  def index
    @tecituras = policy_scope(Tecitura)
  end

  # GET /tecituras/1
  def show; end

  # GET /tecituras/new
  def new
    authorize(Tecitura)
    @tecitura = Tecitura.new
    @tecitura.relatorios.build
  end

  # GET /tecituras/1/edit
  def edit; end

  # POST /tecituras
  def create
    authorize(Tecitura)
    @tecitura = Tecitura.new(tecitura_params)
    if @tecitura.save
      redirect_to(@tecitura, notice: 'Acompanhamento criado com sucesso.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /tecituras/1
  def update
    if @tecitura.update(tecitura_params)
      redirect_to(@tecitura, notice: 'Acompanhamento editado com sucesso.')
    else
      render(:edit)
    end
  end

  # DELETE /tecituras/1
  def destroy
    @tecitura.destroy!
    redirect_to(tecituras_url, notice: 'Acompanhamento deletado com sucesso.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tecitura
    @tecitura = authorize(Tecitura.find(params[:id]))
  end

  # Only allow a trusted parameter "white list" through.
  def tecitura_params # rubocop:disable Metrics/MethodLength
    params.require(:tecitura)
          .permit(:vinculacao_ano,
                  :vinculacao_semestre,
                  :situacao_atual,
                  :nucleo_familiar,
                  :regiao,
                  :situacao_acolhimento,
                  :ref_atencao_primaria,
                  :ref_assistencia_social,
                  :vinc_familiares_comunitarios,
                  :situacao_juridica,
                  :relatorios,
                  :equipe_tecitura,
                  :ref_padhu,
                  :responsaveis,
                  mulher_acompanhada_attributes:
                                      [:id, :nome, :telefone, endereco_attributes: %i[id texto]],
                  relatorios_attributes: %i[id document ano semestre _destroy])
  end
end
