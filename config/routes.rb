Rails.application.routes.draw do

  get '/mst_newitem/filter', to: 'mst_newitem#filter'
  get '/mst_newitem/progress', to: 'mst_newitem#progress'
  get '/mst_newitem/brand', to: 'mst_newitem#new_brand_list'
  resources :mst_newitem

  resources :mst_brand

  get '/mst_item/filter', to: 'mst_item#filter'
  resources :mst_item
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
