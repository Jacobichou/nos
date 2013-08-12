class UserMailer < ActionMailer::Base
  default from: "potarts02@gmail.com"

  def email_notify(hierarchy_lvl, item) # accepts an object as argument; e.g. passing a psf_item grants access to the psf's data
  	@item = item
  	@who = User.where(hierarchy: 0..hierarchy_lvl)
  	@login_url = 'http://localhost:3000/users/sign_in'

  	@who.each do |person|
  		mail(to: person.email, subject: 'NOSSYM Notification')
  	end
  end
end
