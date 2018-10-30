class AddShareDepoToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :share_depository_account, :text
  end
end
