# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = policy_scope User
  end

  # GET /users/1
  def show;
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit;
  end

  # POST /users
  def create
    authorize User
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário deletado com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = authorize User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    user = params.fetch(:user)

    user.delete(:roles) unless policy(@user).update_roles?
    if user[:password].blank? && user[:password_confirmation].blank?
      user.delete(:password)
      user.delete(:password_confirmation)
    end

    user.permit(:name, :email, :password, :password_confirmation, roles: [])
  end
end
