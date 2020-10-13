class RemoveFirstnameLastnameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :firstname, :string
    remove_column :users, :lastname, :string
  end
end
