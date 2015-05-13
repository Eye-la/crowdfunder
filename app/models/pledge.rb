class Pledge < ActiveRecord::Base

  validates :pledge_amt, presence: true, numercality: {integer: true}
end
