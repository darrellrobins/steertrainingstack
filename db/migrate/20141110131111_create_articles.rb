class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, limit: 256
      t.text :body

      t.timestamps
    end
  end
end
