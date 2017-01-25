class AddUrlnameToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :urlname, :string
  end
end
