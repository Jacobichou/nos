class AddColumnNumParticipantsToProjectSummaryForm < ActiveRecord::Migration
  def change
    add_column :project_summary_forms, :num_participants, :integer
  end
end
