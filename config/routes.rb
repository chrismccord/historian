Rails.application.routes.draw do
  scope Historian.mount_point do
    resources :categories, :controller => 'historian/categories', :as => 'historian_categories'
    resources :records, :controller => 'historian/records', :as => 'historian_records'
  end
end