Rails.application.routes.draw do
  resources :artists, :songs
  post 'customers/upload', to: 'songs#upload'
end
