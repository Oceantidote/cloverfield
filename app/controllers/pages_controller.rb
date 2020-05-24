class PagesController < ApplicationController
  TOPICS = {
    clover: { title: "THE FOUR LEAF CLOVER"},
    haystack: { title: "THE NEEDLE IN THE HAYSTACK"},
    waldo: { title: "WALLY" }
  }



  def home
    @topic = TOPICS.keys.sample.to_s
    @valid = @topic
    @invalid = @topic +"_null"
    @bg = @topic + "_bg"
    @title = TOPICS[@topic.to_sym][:title]
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to wishes_path
    end
  end

  def wishes
    @wish = Wish.order(created_at: :desc).pluck(:wish).first
    @wishes = Wish.order(created_at: :desc).pluck(:wish)
    @wishes.delete(@wish)
    @wishes.unshift(@wish)
    @wishes.delete("")
  end

  private

  def wish_params
    params.require(:wish).permit(:wish)
  end
end
