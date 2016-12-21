class RemoveBlocksFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :blocks
  end
end
