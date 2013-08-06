class CreateProjectSummaryForms < ActiveRecord::Migration
  def change
    create_table :project_summary_forms do |t|
    	t.integer :user_id
      t.string :project_manager
      t.string :location
      t.integer :budget
      t.integer :est_revenue

      t.timestamps
    end
  end
end
