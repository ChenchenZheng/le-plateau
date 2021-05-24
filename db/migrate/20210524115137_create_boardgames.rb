class CreateBoardgames < ActiveRecord::Migration[6.1]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :level
      t.integer :duration

      t.timestamps
    end
  end
end
