class Projectmodel < ActiveRecord::Base
	belongs_to:user
	has_many:members
end
