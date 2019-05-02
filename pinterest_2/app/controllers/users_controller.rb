class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.ingredients.build
  end

  def create
    @user = User.new(user_params)
    if @user.invalid?
      render 'new'
    else
      @user.save
      redirect_to user_path(@user)
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.invalid?
      render 'edit'
    else
      @user.save
      redirect_to user_path(@user)
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def find_user
    @user = User.find(params[:id])
  end

end
