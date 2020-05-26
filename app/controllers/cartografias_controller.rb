# frozen_string_literal: true

class CartografiasController < ApplicationController
  before_action :set_cartografia, only: %i[show edit update destroy]

  # GET /cartografia
  def index
    @cartografia = Cartografia.all
  end

  # GET /cartografia/1
  def show; end

  # GET /cartografia/new
  def new
    @cartografia = Cartografia.new
  end

  # GET /cartografia/1/edit
  def edit; end

  # POST /cartografia
  def create
    @cartografia = Cartografia.new(cartografia_params)

    if @cartografia.save
      redirect_to(@cartografia, notice: 'Cartografia was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /cartografia/1
  def update
    if @cartografia.update(cartografia_params)
      redirect_to(@cartografia, notice: 'Cartografia was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /cartografia/1
  def destroy
    @cartografia.destroy!
    redirect_to(cartografia_url, notice: 'Cartografia was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cartografia
    @cartografia = Cartografia.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cartografia_params # rubocop:disable Metrics/MethodLength
    params.require(:cartografia).permit(
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
