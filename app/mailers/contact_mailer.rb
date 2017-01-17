class ContactMailer < ActionMailer::Base
  default to: 'lnigro903@g.rwu.edu'
  
  def contact_email(name, email, body)
    @name = name
    @emial = email
    @body = body
    
    mail(from: email, subject: "Contact form message from #{name}")
  end
end