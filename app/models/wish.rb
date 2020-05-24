class Wish < ApplicationRecord
  before_save :capitalise

  private

  def capitalise
    self.wish = self.wish.capitalize
  end
end
