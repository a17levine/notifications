class WebHookNotificationsController < ApplicationController
  def create
    # ProcessWebHookNotificationWorker.new.perform(params)
    ProcessWebHookNotificationWorker.perform_async(params) # Async
  end
end
