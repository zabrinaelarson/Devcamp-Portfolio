class Comment < ApplicationRecord
 	after_commit :notify_pusher, on: [:create, :update]
	def notify_pusher
		Pusher.trigger('comment', 'new', self.as_json)
	end
end