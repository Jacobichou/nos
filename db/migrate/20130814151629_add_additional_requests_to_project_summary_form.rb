class AddAdditionalRequestsToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :additional_requests, :string
  end
end
