class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[new create edit update show destroy]
  before_action ->{authorize @user}, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @users = User.all
    authorize @users

    respond_with @users
  end

  def create
    @user.save
    respond_with @user, location: [:admin, @user]
  end

  def update
    @user.update(user_params)

    respond_with @user, location: [:admin, @user]
  end

  def destroy
    @user.destroy
    respond_with :admin, @user
  end

  private
  def user_params
    params.require(:user).permit(policy(@user || User).permitted_attributes)
  end

  def set_user
    @user ||= case action_name
      when *%w(new) then User.new
      when *%w(create) then User.new(user_params)
      when *%w(show edit update destroy) then User.find(params[:id])
    end
  end
end
