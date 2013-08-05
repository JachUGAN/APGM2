# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  username        :string(255)
#  email           :string(255)
#  role            :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  rank            :string(255)
#  city            :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

	has_secure_password

	has_many :events
	has_many :posts

	#bafore_save { |user| user.username = username.downcase}   NOT SURE ABOUT THIS YET
	before_save { self.email = email.downcase }		#CHANGED IT TO THE NEW BOOK  GOTTA CHECK IT WORKS WITH RUBY 1.9.3
	before_save :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_ROLE_REGEX = /\Aauthor|super|normal|admin\z/i 			#Valid roles definition

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :username,	presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }  #Uniqueness is true by default unless specified
	validates :role, presence: true, format: { with: VALID_ROLE_REGEX }	
	validates :password, presence: true, length: { minimum: 6 }			#virtual attribute only stored in memory
	validates :password_confirmation, presence: true
	validates :rank, length: { maximum: 10 }      # rank, city, and description shouldn't be compulsory so the presence isn't necessary
	validates :city, length: { maximum: 50 }
	validates :description, length: { maximum: 200 }

	#NEW 
	#def User.new_remember_token
	#  SecureRandom.urlsafe_base64
	#end

	#def User.encrypt(token)
	#  Digest::SHA1.hexdigest(token.to_s)
	#end

	#private

	 # def create_remember_token
	  #  self.remember_token = User.encrypt(User.new_remember_token)
	  #end

private 
    def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    end

end
