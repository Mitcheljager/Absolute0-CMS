class AddLayoutToComponents < ActiveRecord::Migration[5.0]
  def change
    add_column :components, :layout, :string
  end
end
