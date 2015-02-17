class DormitoriesController < ApplicationController

  def new
  end

  def show
    @dormitory = Dormitory.find(params[:id])
  end

  def edit
    @dormitory = Dormitory.find(params[:id])
  end

  def index
    @dormitories = Dormitory.all.order(:name)
  end

  def update
    current_user.dormitory = Dormitory.find(params[:id])
    if current_user.save
      redirect_to root_path, notice: '寮を設定しました'
    else
      render :edit
    end
  end
end
