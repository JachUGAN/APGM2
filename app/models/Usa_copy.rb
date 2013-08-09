# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  email                  :string(255)
#  role                   :string(255)
#  rank                   :string(255)
#  city                   :string(255)
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	has_many :events
	has_many :posts

	#bafore_save { |user| user.username = username.downcase}   NOT SURE ABOUT THIS YET
	before_save { self.email = email.downcase }		#CHANGED IT TO THE NEW BOOK  GOTTA CHECK IT WORKS WITH RUBY 1.9.3
	#before_save :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_ROLE_REGEX = /\Aauthor|super|normal|admin\z/i 			#Valid roles definition

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :username,	presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }  #Uniqueness is true by default unless specified
	validates :role, presence: true, format: { with: VALID_ROLE_REGEX }	
	#validates :password, presence: true, length: { minimum: 6 }			#virtual attribute only stored in memory
	#validates :password_confirmation, presence: true
	validates :rank, length: { maximum: 10 }      # rank, city, and description shouldn't be compulsory so the presence isn't necessary
	validates :city, length: { maximum: 50 }
	validates :description, length: { maximum: 200 }


end
