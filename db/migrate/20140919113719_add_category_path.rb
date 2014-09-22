class AddCategoryPath < ActiveRecord::Migration
  def change
    add_column :categories, :path, :integer, array: true, default: []
  end
end
