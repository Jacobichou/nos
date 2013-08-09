module ProjectSummaryFormsHelper

	# get user email for form summary
	def get_email(psf_item)
		@email = User.find_by_id(psf_item).email
	end
end
