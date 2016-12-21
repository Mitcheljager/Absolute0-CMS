class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.integer :page_id
      t.json :components

      t.timestamps
    end
  end
end
