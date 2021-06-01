class ChangeNameForFromToUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :from_user, :from_user_id
    rename_column :reviews, :to_user, :to_user_id
  end
end
