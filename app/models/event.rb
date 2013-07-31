# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  start_date :date
#  end_date   :date
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
end
