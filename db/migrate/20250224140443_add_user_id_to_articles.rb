class AddUserIdToArticles < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :user, null: false, foreign_key: true, default: 1
  end
end
