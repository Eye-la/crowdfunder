class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: "Project"
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :backed_projects, through: :rewards, source: :project
  has_many :comments
  has_many :projects, through: :comments


  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  def total_pledges(current_user)
    current_user.pledges.sum(:pledge_amt)
  end
end
