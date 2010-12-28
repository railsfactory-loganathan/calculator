class Member < ActiveRecord::Base
	belongs_to:projectmodel
	belongs_to:user
						  attr_accessible :email, :name, :role, :contactnumber,:project_id,:createdid
end
