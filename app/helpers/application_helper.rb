module ApplicationHelper
	# Returns the full title of page
	def full_title(page_title)
		base_title = "NOSSYM"

		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	# Returns approval links
	def approve_link_text(approvable)
		approvable.approved? ? 'Un-approve' : 'Approve'
	end

	# get user for an item e.g. email of user who submitted a PSF
	def get_user(item)
		@user = User.find_by_id(item.user.id)
	end

	def id_convert(phrase)
		@rephrase = phrase.downcase.tr(" ", "_").tr("&", "-")
	end
end
