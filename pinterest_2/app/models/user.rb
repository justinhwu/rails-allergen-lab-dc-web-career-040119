class User < ApplicationRecord
  has_many :recipes
  has_many :allergens
  has_many :ingredients, through: :allergens
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients
end
