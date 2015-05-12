class Project < ActiveRecord::Base
  has_many :pledges
  belongs_to :user
  has_many :rewards
  accepts_nested_attributes_for :rewards
end
