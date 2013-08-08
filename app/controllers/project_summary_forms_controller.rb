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

	def update
	  @psf = Component.find(params[:id])

	  respond_to do |format|
	    if @psf.update_attributes(psf_params)
	      format.html { redirect_to @psf, notice: 'PSF was successfully updated.' }
	      format.json { head :no_content }
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @psf.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def toggle_approve
		@psf = ProjectSummaryForm.find(params[:id])
		@psf.toggle!(:approved)
		respond_to do |format|
			format.html { redirect_to :back, notice: "Changed" }
			format.js
		end
	end

	def approve
		@psf = ProjectSummaryForm.find(params[:id])
	end

	def unapprove
		@psf = ProjectSummaryForm.find(params[:id])
	end

	private
		def psf_params
			params.require(:psf).permit(:project_manager, :location, :budget, :est_revenue)
		end
end
