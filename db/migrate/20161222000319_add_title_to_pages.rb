class AddTitleToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :title, :string
  end
end
