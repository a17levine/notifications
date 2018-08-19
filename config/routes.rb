Rails.application.routes.draw do
  post 'api/v1/web_hooks/notifications', to: 'web_hook_notifications#create', as: 'notifications_web_hook'
end
