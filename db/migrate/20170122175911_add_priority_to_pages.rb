class AddPriorityToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :priority, :integer
  end
end
