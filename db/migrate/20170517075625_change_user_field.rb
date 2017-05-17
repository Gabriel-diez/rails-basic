class ChangeUserField < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :Firstname, :firstname
  end
end
