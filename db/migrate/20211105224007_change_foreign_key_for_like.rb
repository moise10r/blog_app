class ChangeForeignKeyForLike < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, :users
    remove_foreign_key :likes, :posts
  end
end
