class ContactMailer < ActionMailer::Base
  
  #Sets the default email to send to
  default to: 'lnigro903@g.rwu.edu'
  
  
  def contact_email(name, email, body)
    
    #Create instance variables for each email parameter
    @name = name
    @email = email
    @body = body
    
    #Sets the from address and the subject line of the email to be sent
    mail(from: email, subject: "Contact form message from #{name}")
  end
end