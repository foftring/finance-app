Rails.application.routes.draw do
  get 'stock/index'
  get 'search_stocks', to: "stock#search"

  root 'stock#index'
end
