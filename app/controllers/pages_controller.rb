class PagesController < ApplicationController
  def home
  end

  def create
    Wish.create(wish_params)
    redirect_to wishes_path
  end

  def wishes
    @wish = Wish.order(created_at: :desc).pluck(:wish).first
    @wishes = Wish.order(created_at: :desc).pluck(:wish).shuffle
    @wishes.delete(@wish)
    @wishes.unshift(@wish)
    @wishes.delete("")
  end

  private

  def wish_params
    params.require(:wish).permit(:wish)
  end
end
