class User < ApplicationRecord
  has_many :recipes
  has_many :allergens
  has_many :ingredients, through: :allergens
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :ingredients,
  #If the ingredients create field is empty, will not return error
  reject_if: Proc.new{|attributes| attributes[:name].blank?}
end
