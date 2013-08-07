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

	# toggle helper
	def toggle_approval(psf)
		if psf.!approved?
			link_to 'Discard', toggle_status_project_summary_form_path(psf_item), remote: true, class: "no-bottom demo-button button-minimal red-minimal discard", id:"approve_link_#{psf_item.id}"
		else
			link_to 'Approve', toggle_status_project_summary_form_path(psf_item), remote: true, class: "no-bottom demo-button button-minimal red-minimal approve", id:"approve_link_#{psf_item.id}"
		end
	end
end
