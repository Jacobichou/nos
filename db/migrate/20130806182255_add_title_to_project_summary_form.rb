class AddTitleToProjectSummaryForm < ActiveRecord::Migration
  def change
  	add_column :project_summary_forms, :title, :string, default: "A PSF"
  end
end
