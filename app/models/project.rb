class Project < ActiveRecord::Base

  has_many :pledges
  has_many :rewards
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :rewards
  acts_as_taggable
end
