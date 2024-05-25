class Item < ApplicationRecord
  belongs_to :collection

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
