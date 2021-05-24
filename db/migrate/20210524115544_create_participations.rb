class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.string :statut, :default => "Pending"
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
