class AddHierchyToUser < ActiveRecord::Migration
  def change
    add_column :users, :hierarchy, :integer, default: 4 # default to lowest rank (4 = member, 1 = admin)
  end
end
