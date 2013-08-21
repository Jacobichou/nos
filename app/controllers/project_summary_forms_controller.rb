class ProjectSummaryFormsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_project_summary_form, only: [:show, :edit, :update, :destroy]
	PSF_HIER_LVL = 3 # dictates that anyone of 0, 1, 2, 3(superAdmin, admin, supervisor, employee, member) hierarchy levels can view or receive something

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

	def pdf
		# @project_summary_form = ProjectSummaryForm.find_by_id(params[:id])

		respond_to do |format|
			format.html
			format.pdf do
		      render :pdf => "my_pdf", # pdf will download as my_pdf.pdf
		        :layout => 'pdf', # uses views/layouts/pdf.haml
		    :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
		 end
		end

	end

	def full_summary
		@project_summary_form = ProjectSummaryForm.find_by_id(params[:id])
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
		UserMailer.notify_discarded(@project_summary_form).deliver if @project_summary_form.destroyed?
	end

	def toggle_approve
		@project_summary_form = ProjectSummaryForm.find(params[:id])
		@project_summary_form.toggle!(:approved)
		respond_to do |format|
			format.html { redirect_to :back, notice: "Changed" }
			format.js
		end
		unless @project_summary_form.approved?
			UserMailer.notify_unapproved(@project_summary_form).deliver
		else
			UserMailer.notify_approved(@project_summary_form).deliver
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
				:num_participants, :request_type, :audience, :outcome, :additional_requests, 
				:objectives, :facilities, :comm, :worship_council, :day_staff, :menu, 
				:greeters, :ushers, :ministry_leader, :marketing, :decorations)
		end

		def full_summary_params
			params.fetch(:full_summary, {}).permit(:additional_requests, :objectives, :facilities, :comm, :worship_council, :day_staff, :menu, 
				:greeters, :ushers, :ministry_leader, :marketing, :decorations)
		end

		def can_view?
			if current_user.hierarchy >=3
				return true
			else
				return false
			end
		end
	end