class AddNamefirstnameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :firstname, :string
  end
end
