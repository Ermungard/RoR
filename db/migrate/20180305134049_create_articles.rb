class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :sumary
      t.text :body
      t.integer :author_id
      t.boolean :visible, default: true
      t.text :meta_title_articles
      t.string :author

      t.timestamps
    end
  end
end
