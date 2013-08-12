class RemovePhoneFromProjectSummaryForm < ActiveRecord::Migration
  def change
    remove_column :project_summary_forms, :phone, :integer
  end
end
