class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit,:update]
  before_action :require_login, only: [:create, :edit, :update, :new]
  
  
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.creator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def index
    @subs = Sub.all

    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])

    render :show
  end

  def edit
    @sub = Sub.find_by(id: params[:id])

    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
