class Pledge < ActiveRecord::Base

  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  # validates :pledge_amt, presence: true, numericality: {integer: true}
end
