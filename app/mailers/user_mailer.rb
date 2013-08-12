class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  def email_notify(item) # accepts an object as argument; e.g. passing a psf_item grants access to the psf's data
  	@item = item
  	@who = User.find_by_hierarchy(0)
  	@login_url = 'http://localhost:3000/users/sign_in'
  	mail(to: , subject: 'NOSSYM Notification')
  end
end
