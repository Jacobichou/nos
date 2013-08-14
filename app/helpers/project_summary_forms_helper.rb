module ProjectSummaryFormsHelper

	def string_splitter(item)
		@items = item.objectives.split(',')
		@items.join("\n")
		return simple_format(@items, {}, wrapper_tag: "div")
# => "<div>Here is some basic text...\n<br />...with a line break.</div>"@items.join("")
	end
end
