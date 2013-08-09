class AddColumnRevenueToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :revenue, :integer
  end
end
