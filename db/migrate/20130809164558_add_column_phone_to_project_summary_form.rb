class AddColumnPhoneToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :phone, :integer
  end
end
