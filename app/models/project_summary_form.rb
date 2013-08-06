class ProjectSummaryForm < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :budget, :est_revenue, numericality: true
end
