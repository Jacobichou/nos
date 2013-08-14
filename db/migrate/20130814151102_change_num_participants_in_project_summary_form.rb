class ChangeNumParticipantsInProjectSummaryForm < ActiveRecord::Migration
  def change
  	remove_column :project_summary_forms, :num_participants, :integer
  	add_column :project_summary_forms, :num_participants, :string
  end
end
