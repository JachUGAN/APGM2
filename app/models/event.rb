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


  belongs_to :user

  # DOESNT SEEM TO WORK scope :ordered, order(":start_date ASC") 

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_date :start_date, on_or_before: :end_date		#This uses the validates_timeliness gem (the parser and 
  validates_date :end_date, on_or_after: :start_date


end
