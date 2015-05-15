class Pledge < ActiveRecord::Base

  belongs_to :user
  has_one :project, through: :reward
  belongs_to :reward
end
