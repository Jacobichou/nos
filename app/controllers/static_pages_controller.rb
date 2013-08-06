class StaticPagesController < ApplicationController
  def home
	  if signed_in?
		  @psf_items = current_user.project_summary_forms.paginate(page: params[:page])
	  end
  end

  def help
  end

  def about
  end

  def contact
  end
end
