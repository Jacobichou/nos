class AddApprovedToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :approved, :boolean, default: false
  end
end
