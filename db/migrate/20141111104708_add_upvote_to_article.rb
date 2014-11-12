class AddUpvoteToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :upvotes, :integer, :default => 0
  end
end
