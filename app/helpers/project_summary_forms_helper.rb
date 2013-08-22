module ProjectSummaryFormsHelper

	def li_prepare(item, column)
		@column = "@project_summary_form.#{column}"
		@item = item.insert(0,",").gsub!(/,\s*/, '<li>').html_safe
	end

end
