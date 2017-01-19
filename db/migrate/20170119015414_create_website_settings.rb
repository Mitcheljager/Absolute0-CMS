class CreateWebsiteSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :website_settings do |t|
      t.string :homepage_id

      t.timestamps
    end
  end
end
