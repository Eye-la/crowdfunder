class Pledge < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :reward

  validates :pledge_amt, presence: true, numericality: {integer: true}
end
