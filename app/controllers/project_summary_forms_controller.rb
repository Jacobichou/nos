class ProjectSummaryFormsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@psf = current_user.project_summary_forms.create(psf_params)

		# respond_to do |format|
		#   if @psf.save
		#     format.html { redirect_to @psf, notice: 'Project summary form was successfully created.' }
		#     format.json { render action: 'show', status: :created, location: @psf }
		#   else
		#     format.html { render action: 'new' }
		#     format.json { render json: @psf.errors, status: :unprocessable_entity }
		#   end
		# end

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

	def new
		@psf = ProjectSummaryForm.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @psf }
		end
	end

	def update
	  @psf = ProjectSummaryForm.find(params[:id])

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

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_project_summary_form
			@project_summary_form = ProjectSummaryForm.find(params[:id])
		end
	
		def psf_params
			params.require(:project_summary_form).permit(:project_manager, :location, :budget, :est_revenue, :title)
		end
end
