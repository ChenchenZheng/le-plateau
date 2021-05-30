class AddUpcToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :upc, :string
  end
end
