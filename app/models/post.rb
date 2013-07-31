# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

 	#belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  #validates :user_id, presence: true
end
