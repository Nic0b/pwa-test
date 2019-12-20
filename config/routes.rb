Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'static_pages/index'
  get 'static_pages/user'
  post "/sendkeys" => "static_pages#getJSON", :as => :getJSON
  post "/sendNo" => "static_pages#sendPush", :as => :sendPush

end
