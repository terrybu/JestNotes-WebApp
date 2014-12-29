class User < ParseUser
	validates_presence_of :username
	
	validates_confirmation_of :password
	validates_presence_of :password 
	validates_length_of :password, minimum: 4

	fields :email
    validates :email, :email => true

end