class Wish < ApplicationRecord
  before_save :capitalise

  private

  def capitalise
    self.wish = self.wish.split(" ").first.capitalize + " " + self.wish.split(" ")[1..-1].join(" ")
  end
end
