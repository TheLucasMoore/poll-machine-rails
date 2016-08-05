class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end
  # the notifications are created when a vote is cast, allowing a user
  # to see that they have a new vote in the /notifications path. 
end
