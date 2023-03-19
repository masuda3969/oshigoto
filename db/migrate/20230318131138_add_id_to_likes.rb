class AddIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :user_id, :integer, null: false
    add_column :likes, :article_id, :integer, null: false
  end
end
