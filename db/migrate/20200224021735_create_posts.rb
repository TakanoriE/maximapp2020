class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.text :content_eng
      t.string :author
      t.string :biography
      t.integer :category

      t.timestamps
    end
  end
end
