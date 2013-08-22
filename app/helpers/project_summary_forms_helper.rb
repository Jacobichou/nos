module ProjectSummaryFormsHelper

	def string_splitter(item)
		@items = item.split(',')

		

		@items.each do |item|
			simple_format(item, {}, wrapper_tag: "li")
		end
	end

end
