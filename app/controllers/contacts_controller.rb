class ContactsController < ApplicationController
  
  #Sends a GET request to /contact-us
  #Shows a new contact form
  def new
    @contact = Contact.new
  end
  
  #Sends a POST request to /contacts
  def create
    #Mass assignment of form fields into contact objects
    @contact = Contact.new(contact_params)
    
    #Saves the contact object to the database
    if @contact.save
      
      #Store the form fields to local variables.
      name = params[:contact][:name]
      email = params[:contact][:email] 
      body = params[:contact][:comments]
      
      #Plug variables into the contact_mailer method
      ContactMailer.contact_email(name, email, body).deliver
      
      #Store the success message into flash hash
      #Redirect back to /contact-us
      flash[:success] = 'Message Sent.'
      redirect_to new_contact_path
    
    #If the save is unsuccessful, this stores the errors to the
    #flash hash as well, and redirects to /contact-us
    else
      flash[:danger] = @contact.errors.full_messages.join(', ')
      redirect_to new_contact_path
    end
  end
  
  private
    #Collects data from forms using strong parameters
    #Whitelists the form fields.
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end
