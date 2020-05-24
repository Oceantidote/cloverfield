class PagesController < ApplicationController
  def home
  end

  def create
    Wish.create(wish_params)
    redirect_to wishes_path
  end

  def wishes
    @wishes = Wish.order(created_at: :desc).pluck(:wish)
  end

  private

  def wish_params
    params.require(:wish).permit(:wish)
  end
end
