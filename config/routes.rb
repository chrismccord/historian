Rails.application.routes.draw do
  match "#{Historian.mount_point}/main" => 'historian/categories#index', :as => 'historian'
  scope Historian.mount_point do
    resources :categories, :controller => 'historian/categories', :as => 'historian_categories'
    resources :records, :controller => 'historian/records', :as => 'historian_records'
  end
end