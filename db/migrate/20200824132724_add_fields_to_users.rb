class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :channel, :string
    add_column :users, :connected, :boolean
  end
end
