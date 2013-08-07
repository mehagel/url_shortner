class AddClickCount < ActiveRecord::Migration
  def change
    add_column :urls, :click_counter, :integer, default: 0
  end
end
