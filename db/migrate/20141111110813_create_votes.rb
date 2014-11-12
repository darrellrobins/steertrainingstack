class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :article_id
      t.boolean :up
      t.string :from, limit: 32

      t.timestamps
    end
  end
end
