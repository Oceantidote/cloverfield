class PagesController < ApplicationController
  TOPICS = {
    clover: { title: "the FOUR LEAF CLOVER"},
    haystack: { title: "the NEEDLE in the HAYSTACK"},
    waldo: { title: "WALLY" },
    queen: { title: "the QUEEN"},
    snowboarder: { title: "the SNOWBOARDER"},
    candle: { title: "the CANDLE amongst the LANTERNS"},
    mink: { title: "the MINK amongst the BEAVERS"},
    et: { title: "E.T. amongst the TOYS"}
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
    @wishes = Wish.order(created_at: :desc).pluck(:wish).reject {|r| r.include?("<")}.map{|r| r.truncate(140)}
    @wishes.delete("")
  end

  private

  def wish_params
    params.require(:wish).permit(:wish)
  end
end
