class InventoryItem < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  has_one_attached :photo

  validates :ingredient_id, presence: true
  validates :purchase_date, presence: true
end
