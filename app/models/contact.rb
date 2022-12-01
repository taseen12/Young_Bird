class Contact < ApplicationRecord
  # validates :name, :age, :destination, :message , presence: true
  # validates :contact_no,   :presence => {:message => 'hello world, bad operation!'},
  #   :numericality => true,
  #     :length => { :minimum => 10, :maximum => 15 }
  # validates_format_of :email_id,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
