class AddCommentableidCommentabletypeToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.references :commentable, polymorphic: true, index:true
    end
  end
end
