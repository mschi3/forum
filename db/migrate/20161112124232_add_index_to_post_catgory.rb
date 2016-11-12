class AddIndexToPostCatgory < ActiveRecord::Migration[5.0]
  def change
  	add_index :post_categories, :post_id
    add_index :post_categories, :category_id
  end
end
