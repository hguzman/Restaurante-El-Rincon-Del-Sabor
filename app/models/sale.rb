class Sale < ApplicationRecord
  has_many :sale_details, dependent: :destroy
  belongs_to :client
  belongs_to :user
end
