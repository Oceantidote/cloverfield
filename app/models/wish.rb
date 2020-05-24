class Wish < ApplicationRecord
  before_save :capitalise

  private

  def capitalise
    if !self.wish.split(" ").empty?
      self.wish = self.wish.split(" ").first.capitalize + " " + self.wish.split(" ")[1..-1].join(" ")
    else
      self.wish = self.wish.capitalize
    end
  end
end
