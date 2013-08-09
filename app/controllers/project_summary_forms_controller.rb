class ProjectSummaryFormsController < ApplicationController
	before_filter :authenticate_user!

	def

	def create
		@psf = current_user.project_summary_form.create(psf_params)

		if @psf.save
			flash[:success] = "Saved"
			redirect_to @psf
		else
			render 'new'
		end

		# respond_to do |format|
		# 	if @psf.save
		# 		format.html { redirect_to @psf, notice: 'PSF was successfully created.' }
		# 		format.json { render json: @psf, status: :created, location: @psf }
		# 	else
		# 		format.html { render action: "new" }
		# 		format.json { render json: @psf.errors, status: :unprocessable_entity }
		# 	end
		# end
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
		def psf_params
			params.require(:psf).permit(:project_manager, :location, :budget, :est_revenue, :title)
		end
end
