class RemoveAgeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :age, :integer
    add_column :users, :birth_date, :date
  end
end
