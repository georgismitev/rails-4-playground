class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  validates_presence_of :product
  validates_presence_of :category
  accepts_nested_attributes_for :category
end
