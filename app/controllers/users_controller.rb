class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :introduction, :avatar))
    if @user.save
      redirect_to "/users/index"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password, :introduction, :avatar))
      redirect_to "/users/#{@user.id}"
    else
      render "/users/#{@user.id}/edit"
    end
  end

  def destroy
    redirect_to "/users/sign_out"
  end

  def kakunin
    @user = User.find(params[:id])
    @reservations =  @user.reservations
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :avatar)
  end
end
