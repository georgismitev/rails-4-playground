class Category < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'

  has_many :product_categories
  has_many :products, :through => :product_categories

  after_create do |category|
    path = (parent && parent.path || []).concat([category.id])
    category.update(:path => path)
  end
end
