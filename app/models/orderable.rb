class Orderable < ApplicationRecord
  belongs_to :sport
  belongs_to :cart
  def total
    sport.price * quantity
  end
end
