class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: "Project"
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :backed_projects, through: :rewards, source: :project


  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

end
