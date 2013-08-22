module ProjectSummaryFormsHelper

	def li_prepare(item)
		@item = item.insert(0,",").gsub!(/,\s*/, '<li>').html_safe unless item.nil?
	end

end
