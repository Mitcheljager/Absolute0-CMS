class CreateColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :columns do |t|
      t.integer :block_id

      t.timestamps
    end
  end
end
