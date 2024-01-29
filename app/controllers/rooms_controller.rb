class RoomsController < ApplicationController
  before_action :set_search

  def index
    @user = User.find_by(params[:user_id])
    @rooms = Room.all
    
  end

  def new
    @user = User.find_by(params[:user_id])
    @room = Room.new
    
  end

  def create
    @room = current_user.rooms.build
    @room = Room.new(params.require(:room).permit(:name, :syoukai, :money, :address, :avatar,))
    @room.user = current_user
    if @room.save
      flash[:notice] = "宿泊施設を新規登録しました"
      redirect_to "/rooms/index"
    else
      redirect_to "/rooms/new"
    end
  end

  def show
    @user = User.find_by(params[:user_id])
    @room = Room.find(params[:id])
    
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    if @room.update(rooms_params)
      redirect_to  "/rooms/#{@room.id}"
    else
      render :edit
    end
  end
  

  def destroy

  end


  private
  def rooms_params
    params.require(:room).permit(:name, :avatar)
  end

  def set_search
    @search = Room.ransack(params[:q])
    @rooms = @search.result(distinct: true).page(params[:page])
  end
end

