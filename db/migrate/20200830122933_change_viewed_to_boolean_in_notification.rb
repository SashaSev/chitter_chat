class ChangeViewedToBooleanInNotification < ActiveRecord::Migration[6.0]
  def change
    change_column :notifications, :viewed, :boolean, default: false
  end
end
