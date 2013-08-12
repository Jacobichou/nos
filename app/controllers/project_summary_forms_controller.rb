class ProjectSummaryFormsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_project_summary_form, only: [:show, :edit, :update, :destroy]
	PSF_HIER_LVL = 3

	def create
		@project_summary_form = current_user.project_summary_forms.create(psf_params)

		respond_to do |format|
		  if @project_summary_form.save
			 UserMailer.email_notify(PSF_HIER_LVL, @project_summary_form, "psf").deliver
		    format.html { redirect_to @project_summary_form, notice: 'Project summary form was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @project_summary_form }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @project_summary_form.errors, status: :unprocessable_entity }
		  end
		end
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
			if @project_summary_form.update(psf_params)
			  UserMailer.email_notify(PSF_HIER_LVL, @project_summary_form, "psf-update").deliver
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
			format.html { redirect_to home_path }
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
			params.require(:project_summary_form).permit(:project_manager, :location, :budget, :revenue, 
																		:title, :purpose, :frequency, :frequency_exception, :fee, :offering, 
																		:comments, :start_date, :end_date, :start_time, :end_time, 
																		:num_participants, :type, :audience, :outcome, :phone)
		end

		def can_view?
			if current_user.hierarchy >=3
				return true
			else
				return false
			end
		end
end
