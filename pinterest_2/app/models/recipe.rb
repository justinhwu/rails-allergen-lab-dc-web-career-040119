class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: Proc.new{|attributes| attributes[:name].blank?}
end
