class AddCompanynameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :companyname, :string
  end
end
