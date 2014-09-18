class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  def index
    @avatars = Avatar.all
  end

  def show
  end

  def new
    @avatar = Avatar.new
  end

  def edit
  end

  def create
    @avatar = Avatar.new(avatar_params)

    if @avatar.save
      redirect_to avatars_path, notice: "You've successfully added a photo."
    else
      render :new
    end
  end

  def update
    if @avatar.update(avatar_params)
      redirect_to root_path, notice: "You've updated the photo."
    else
      render :edit
    end
  end

  def destroy
    @avatar.destroy
    redirect_to avatars_path, notice: "Photo successfully deleted."
  end

  private

  def set_avatar
    @avatar = Avatar.find(params[:id])
  end

  def avatar_params
    params.require(:avatar).permit(:name, :photo, :description)
  end
end
