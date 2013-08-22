class ChangeColumnsInProjectSummaryForm < ActiveRecord::Migration
  def change
  	change_column :project_summary_forms, :additional_requests, :string, :default => 'n/a'
  	change_column :project_summary_forms, :num_participants, :string, :default => '----'
  	change_column :project_summary_forms, :objectives, :string, :default => 'n/a'
  	change_column :project_summary_forms, :facilities, :string, :default => 'n/a'
  	change_column :project_summary_forms, :comm, :string, :default => 'n/a'
  	change_column :project_summary_forms, :worship_council, :string, :default => 'n/a'
  	change_column :project_summary_forms, :day_staff, :string, :default => 'n/a'
  	change_column :project_summary_forms, :menu, :string, :default => 'n/a'
  	change_column :project_summary_forms, :ushers, :string, :default => 'n/a'
  	change_column :project_summary_forms, :greeters, :string, :default => 'n/a'
  	change_column :project_summary_forms, :decorations, :string, :default => 'n/a'
  	remove_column :project_summary_forms, :ministry_leader
  	remove_column :project_summary_forms, :marketing
  end
end
