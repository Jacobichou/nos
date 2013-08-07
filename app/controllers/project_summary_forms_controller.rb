class ProjectSummaryFormsController < ApplicationController
	def create
		@psf = current_user.ProjectSummaryForms.build(psf_params)

		respond_to do |format|
			if @psf.save
				format.html { redirect_to @psf, notice: 'PSF was successfully created.' }
				format.json { render json: @psf, status: :created, location: @psf }
			else
				format.html { render action: "new" }
				format.json { render json: @psf.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def psf_params
			params.require(:psf).permit(:project_manager, :location, :budget, :est_revenue, :class)
		end
end
