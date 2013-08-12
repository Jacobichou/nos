class UserMailer < ActionMailer::Base
  default from: "potarts02@gmail.com"

  def email_notify(hierarchy_lvl, item, item_type) # first arg: lowest hierarchy level required to view or be notified of item activity
                                                  # second arg: accepts an object; e.g. passing a psf_item grants access to the psf's data;
                                                  # third arg: string for identifying mailer template to send
  	@item = item
  	@who = User.where(hierarchy: 0..hierarchy_lvl)
  	@login_url = 'http://localhost:3000/users/sign_in'

  	# !DO! build link directly to submission
    case item_type
    when "psf"
      @who.each do |person|
        mail(to: person.email, subject: 'NOSSYM Notification')
      end
    when "psf-update"
      @who.each do |person|
        mail(to: person.email, 
              subject: 'NOSSYM Notification',
              template_name: 'psf_update')
      end
    end
  	
  end
end
