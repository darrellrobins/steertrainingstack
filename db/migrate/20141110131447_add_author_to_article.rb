class AddAuthorToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string, limit: 2048
  end
end
