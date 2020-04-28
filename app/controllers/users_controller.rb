# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  before_action :find_user, pnly: %i[edit update destroy]
  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admins_user_list_path,
                  notice: ' User successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_user_list_path,
    notice: ' User successfully Destroyed.'

  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :mobile, :gender, :active)
  end
end
