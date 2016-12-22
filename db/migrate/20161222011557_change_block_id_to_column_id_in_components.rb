class ChangeBlockIdToColumnIdInComponents < ActiveRecord::Migration[5.0]
  def change
    rename_column :components, :block_id, :column_id
  end
end
