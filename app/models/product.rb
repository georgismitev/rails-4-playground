class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, 
    presence: true,
    :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, 
    :numericality => { :greater_than => 0 }
  validate :has_categories?

  has_many :product_categories, :inverse_of => :product
  has_many :categories, :through => :product_categories

  accepts_nested_attributes_for :product_categories, :allow_destroy => true, :reject_if => :all_blank

  private

  def has_categories?
    if self.product_categories.empty?
      errors.add(:base, 'must have at least one category')
    end
  end
end
