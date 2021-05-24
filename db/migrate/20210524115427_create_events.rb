class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boardgame, null: false, foreign_key: true
      t.string :address
      t.text :description
      t.integer :nb_players
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
