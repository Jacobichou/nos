class AddRequirementsToProjectSummaryForm < ActiveRecord::Migration
  def change
  	add_column :project_summary_forms, :objectives, :string
   add_column :project_summary_forms, :facilities, :string
   add_column :project_summary_forms, :comm, :string
   add_column :project_summary_forms, :worship_council, :string
   add_column :project_summary_forms, :day_staff, :string
   add_column :project_summary_forms, :menu, :string
   add_column :project_summary_forms, :greeters, :string
   add_column :project_summary_forms, :ushers, :string
   add_column :project_summary_forms, :ministry_leader, :string
   add_column :project_summary_forms, :marketing, :string
   add_column :project_summary_forms, :decorations, :string
  end
end
