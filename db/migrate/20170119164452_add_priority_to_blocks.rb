class AddPriorityToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :blocks, :priority, :integer
  end
end
