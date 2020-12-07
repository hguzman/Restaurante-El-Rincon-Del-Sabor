# == Schema Information
#
# Table name: sales
#
#  id              :integer          not null, primary key
#  total           :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_id       :integer
#  sale_details_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_sales_on_client_id  (client_id)
#  index_sales_on_user_id    (user_id)
#
class Sale < ApplicationRecord
  has_many :sale_details, dependent: :destroy
  belongs_to :client
  belongs_to :user
end
