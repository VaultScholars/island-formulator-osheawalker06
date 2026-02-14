# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Ingredient.destroy_all

ingredients = [
  { name: "Jojoba Oil", category: "Oil", description: "Liquid wax from jojoba plant.", notes: "Lightweight and non-greasy." },
  { name: "Shea Butter", category: "Butter", description: "Fat from African shea tree.", notes: "Excellent for sealing moisture." },
  { name: "Aloe Vera Gel", category: "Humectant", description: "Extract from aloe leaves.", notes: "Soothing and hydrating." }
]

ingredients.each do |attr|
  Ingredient.create!(attr)
end

puts "Seeded #{Ingredient.count} ingredients."
