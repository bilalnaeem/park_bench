ParkBench::Application.routes.draw do
  devise_for :users
  get '/facts' => 'number_facts#search', :as => :number_facts
  root to: 'number_facts#index'
end
