class ProjectSummaryFormsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_project_summary_form, only: [:show, :edit, :update, :destroy]

	def create
		@project_summary_form = current_user.project_summary_forms.create(psf_params)

		respond_to do |format|
		  if @project_summary_form.save
		    format.html { redirect_to @project_summary_form, notice: 'Project summary form was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @project_summary_form }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @project_summary_form.errors, status: :unprocessable_entity }
		  end
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
		@project_summary_form = ProjectSummaryForm.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @psf }
		end
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @project_summary_form.update(project_summary_form_params)
			  format.html { redirect_to @project_summary_form, notice: 'Project summary form was successfully updated.' }
			  format.json { head :no_content }
			else
			  format.html { render action: 'edit' }
			  format.json { render json: @project_summary_form.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@project_summary_form.destroy
		respond_to do |format|
			format.html { redirect_to project_summary_forms_url }
			format.json { head :no_content }
		end
	end

	def toggle_approve
		@project_summary_form = ProjectSummaryForm.find(params[:id])
		@project_summary_form.toggle!(:approved)
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
