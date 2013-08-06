class StaticPagesController < ApplicationController
  def home
	  if signed_in?
		  @psf_items = ProjectSummaryForm.all # change this later when doing personalized feeds
	  end
  end

  def help
  end

  def about
  end

  def contact
  end
end
