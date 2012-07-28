class EmailAddress < ActiveRecord::Base
  attr_accessible :email
  
  # validates :email,
  #           :format => {  :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
  #                         :message => "Only letters allowed" }
                          
  validates :email, 
            :format => {  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                          :message => "Please enter a valid email address" }
  
end
