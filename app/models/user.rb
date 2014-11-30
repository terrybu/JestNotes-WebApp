class User < ParseUser
	alias :email :username
	validates :email, :email => true

	validates_confirmation_of :password
	validates_presence_of :password 
	validates_length_of :password, minimum: 4

end