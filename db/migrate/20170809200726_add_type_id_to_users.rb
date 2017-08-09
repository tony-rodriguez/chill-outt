class AddTypeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type_id, :integer, null: false
  end
end
