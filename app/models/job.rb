class Job < ActiveRecord::Base
	belongs_to :user
	has_many :profiles
	belongs_to :category
end
