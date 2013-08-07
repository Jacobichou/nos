class AddClassToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :hierarchy_lvl, :integer, default: 1
  end
end
