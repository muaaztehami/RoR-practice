class RemoveImagefieldsFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :image_content_type, :string
    remove_column :articles, :image_file_size, :string
    remove_column :articles, :image_updated_at, :datetime
  end
end
