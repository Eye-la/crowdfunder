class Project < ActiveRecord::Base

  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :project_comments
  has_many :users, through: :project_comments

  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :rewards
  acts_as_taggable
  validates :funding_goal, presence: true, numericality: {integer: true}

 def days_left_on_project
 		current_date = DateTime.now
    if current_date > end_date
      return "0 days"
     else
      hours = ((end_date - current_date).to_i) / 60 / 60
      days = hours / 24
      remaining_hours = hours % 24
      return days.to_s + " days & " + remaining_hours.to_s + " hours"
     end
 	end

  def total_funding
  	# total = 0
    # pledges.each { |pledge| total += pledge.reward.amount }
    # total
    pledges.map { |pledge| pledge.reward.amount }.sum
  end

end
