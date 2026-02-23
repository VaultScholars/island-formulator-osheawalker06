class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients,
                                allow_destroy: true,
                                reject_if: :all_blank

  validates :title, presence: true
  validates :method, presence: true
  validates :product_type, presence: true

  validate :must_have_at_least_one_ingredient

  private

  def must_have_at_least_one_ingredient
    if recipe_ingredients.reject(&:marked_for_destruction?).empty?
      errors.add(:base, "Recipe must have at least one ingredient")
    end
  end
end
