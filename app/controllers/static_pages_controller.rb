class StaticPagesController < ApplicationController
  def home
		  @psf_items = current_user.feed if signed_in? # change this later when doing personalized feeds
  end

  def help
  end

  def about
  end

  def contact
  end
end
