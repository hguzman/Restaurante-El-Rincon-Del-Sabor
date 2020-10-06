class Dish < ApplicationRecord
  belongs_to :category
  # has_many :sale_details
end
