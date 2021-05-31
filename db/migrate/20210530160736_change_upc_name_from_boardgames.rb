class ChangeUpcNameFromBoardgames < ActiveRecord::Migration[6.1]
  def change
    rename_column :boardgames, :upc, :barcode
  end
end
