class AddUrlToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :url, :string, limit: 2048
  end
end
