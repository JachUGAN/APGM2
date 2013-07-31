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
end
