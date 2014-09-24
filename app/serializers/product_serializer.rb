class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :url
  has_many :categories
  embed :ids, include: true

  def url
    product_url(object)
  end
end
