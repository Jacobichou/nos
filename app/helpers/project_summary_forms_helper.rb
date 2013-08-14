module ProjectSummaryFormsHelper

	def string_splitter(item)
		@items = item.objectives.split(',').last
		# @items = @items.join("\n")


		# @items.each do |item|
			return simple_format(@items, {}, wrapper_tag: "li")
		# end
	end
end
