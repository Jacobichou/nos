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
		@a = ProjectSummaryForm.find(params[:id])
		@a.toggle!(:approved)
		render :nothing => true
	end

	def toggle_status
		@psf = ProjectSummaryForm.find(params[:id])
		if @psf.approved?
			respond_to do |format|
				format.js
				format.html { redirect_to @psf, notice: 'Approved PSF' }
			end
		else
			respond_to do |format|
				format.js
				format.html { redirect_to :back }
			end
		end
	end

	private
		def psf_params
			params.require(:psf).permit(:project_manager, :location, :budget, :est_revenue, :class)
		end
end
