class WebHookNotificationsController < ApplicationController
  def create
    ProcessWebHookNotificationWorker.new.perform(params) # Make async later
  end
end
