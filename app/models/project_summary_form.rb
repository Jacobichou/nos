class ProjectSummaryForm < ActiveRecord::Base
	belongs_to :user # don't add destroy link because we need a record of all PSFs even if a user leaves/is deleted

	validates :user_id, presence: true
	validates :budget, :revenue, :fee, numericality: true

end
