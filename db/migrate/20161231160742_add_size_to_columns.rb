class AddSizeToColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :columns, :size, :string
  end
end
