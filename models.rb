class User < ActiveRecord::Base
	has_many :blogs
end




class Blog < ActiveRecord::Base
	# validates :content
	belongs_to :user
end