class AddReviewedToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :reviewed, :boolean, default: false
  end
end
