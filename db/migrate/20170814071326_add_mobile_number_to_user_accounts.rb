class AddMobileNumberToUserAccounts < ActiveRecord::Migration[5.1]
  def change
  	add_column :accounts, :mobile_number, :integer,:limit => 8
  end
end
