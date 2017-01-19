class Contact < ActiveRecord::Base
  
  #Contact form validations (make sure no blanks)
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end
