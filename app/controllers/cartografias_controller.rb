# frozen_string_literal: true

class CartografiasController < ApplicationController
  before_action :set_cartografia, only: %i[show edit update destroy]

  # GET /cartografias
  def index
    @cartografias = policy_scope(Cartografia)
  end

  # GET /cartografias/1
  def show; end

  # GET /cartografias/new
  def new
    authorize(Cartografia)
    @cartografia = Cartografia.new
  end

  # GET /cartografias/1/edit
  def edit; end

  # POST /cartografias
  def create
    @cartografia = Cartografia.new(cartografia_params)
    authorize(@cartografia)

    if @cartografia.save
      redirect_to(@cartografia, notice: 'Cartografia was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /cartografias/1
  def update
    if @cartografia.update(cartografia_params)
      redirect_to(@cartografia, notice: 'Cartografia was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /cartografias/1
  def destroy
    @cartografia.destroy!
    redirect_to(cartografias_path, notice: 'Cartografia was successfully destroyed.')
  end

  private

  def set_cartografia
    @cartografia = authorize(policy_scope(Cartografia).find(params[:id]))
  end

  # Only allow a trusted parameter "white list" through.
  def cartografia_params # rubocop:disable Metrics/MethodLength
    params.require(:cartografia).permit(
      :questao,
      :resumo,
      :referencias,
      :fonte,
      :data,
      :local,
      :descricao,
      :temas,
      :observacoes,
      :citacoes,
      :responsavel
    )
  end
end
