class Reward < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :pledges

  validates :amount, :backer_limit, presence: true, numericality: {integer: true}
end
