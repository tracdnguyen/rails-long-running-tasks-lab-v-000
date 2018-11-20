Rails.application.routes.draw do
  resources :artists, :songs
  post 'customers/upload', to: 'SongsControllers#upload'
end
