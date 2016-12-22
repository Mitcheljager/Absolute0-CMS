class ChangeBlockIdToPageIdInBlocks < ActiveRecord::Migration[5.0]
  def change
    rename_column :blocks, :block_id, :page_id
  end
end
