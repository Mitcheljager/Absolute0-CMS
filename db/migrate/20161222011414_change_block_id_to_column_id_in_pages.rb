class ChangeBlockIdToColumnIdInPages < ActiveRecord::Migration[5.0]
  def change
    rename_column :blocks, :page_id, :block_id
  end
end
