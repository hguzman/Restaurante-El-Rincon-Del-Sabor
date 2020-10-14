class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy
  belongs_to :user  
end
