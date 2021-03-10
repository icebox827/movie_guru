class AddForeingKeyToVotes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :votes, :users
    add_foreign_key :votes, :articles
  end
end
