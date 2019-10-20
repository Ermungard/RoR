class Comment < ApplicationRecord
	# before_destroy :can_destroy?

	belongs_to :article
	belongs_to :user

	def can_destroy?
		if true
			throw :abort
		end
	end
end
