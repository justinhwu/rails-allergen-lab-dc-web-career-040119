class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: Proc.new{|attributes| attributes[:name].blank?}

  def recipe_ingredients_attributes=(r_i_as)
    byebug
    r_i_as.values.each do |r_i_a|
      r_i_a.values.each do |attributes|
        attrubutes.each do |
      ingredient = Ingredient.find_or_initialize_by(name: r_i_a[:ingredients][:name])

      if ingredient.valid?
        ingredient.save
        recipe_ingredient = RecipeIngredient.create(
          recipe_id: self.id,
          ingredient_id: ingredient.id,
          quantity: r_i_a[:quantity]
        )
      end
    end
  end


end
