class RemoveImagenameFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :image_file_name, :string
  end
end
