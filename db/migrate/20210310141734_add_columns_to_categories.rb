class AddColumnsToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :name, :string
    add_column :categories, :priority, :integer
  end
end
