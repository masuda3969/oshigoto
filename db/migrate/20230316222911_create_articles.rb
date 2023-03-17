class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|

      t.timestamps
      t.string :title, null: false
      t.text :body, null: false
    end
  end
end
