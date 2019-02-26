Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  get 'convert-btc', to: 'exchanges#convert_btc'
end