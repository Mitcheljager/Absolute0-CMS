class AddMenuToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :menu_id, :string, default: 0
  end
end
