class AddIdToArticleTags < ActiveRecord::Migration[6.1]
  def change
    add_column :article_tags, :article_id, :integer, null: false
    add_column :article_tags, :user_id, :integer, null: false
  end
end
