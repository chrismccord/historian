Rails.application.routes.draw do
  scope 'historian' do
    resources :categories, :controller => 'historian/categories', :as => 'historian_categories'
    resources :records, :controller => 'historian/records', :as => 'historian_records'
  end
end