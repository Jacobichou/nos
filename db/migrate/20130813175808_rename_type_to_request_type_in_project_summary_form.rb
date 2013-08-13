class RenameTypeToRequestTypeInProjectSummaryForm < ActiveRecord::Migration
  def change
  	rename_column :project_summary_forms, :type, :request_type
  end
end
