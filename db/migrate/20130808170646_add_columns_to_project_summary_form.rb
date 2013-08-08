class AddColumnsToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :start_time, :time
    add_column :project_summary_forms, :end_time, :time
    add_column :project_summary_forms, :start_date, :date
    add_column :project_summary_forms, :end_date, :date
    add_column :project_summary_forms, :frequency, :string
    add_column :project_summary_forms, :frequency_exception, :string
    add_column :project_summary_forms, :purpose, :string
    add_column :project_summary_forms, :audience, :string
    add_column :project_summary_forms, :outcome, :string
    add_column :project_summary_forms, :fee, :integer
    add_column :project_summary_forms, :offering, :boolean
    add_column :project_summary_forms, :event_level, :integer
    add_column :project_summary_forms, :type, :string
    add_column :project_summary_forms, :comments, :string
  end
end
