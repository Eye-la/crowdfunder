class Project < ActiveRecord::Base

  has_many :rewards
  has_many :pledges, through: :rewards

  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :rewards
  acts_as_taggable
  validates :funding_goal, presence: true, numericality: {integer: true}
  validates :category_id, presence: true

 # def days_left_on_project
 # 		var	current_date = Datetime.now;
 # 		days_left = project.end_date - current_date
 #  end

  def total_funding
  	# total = 0
    # pledges.each { |pledge| total += pledge.reward.amount }
    # total
    pledges.map { |pledge| pledge.reward.amount }.sum
  end

end
