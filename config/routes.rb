Rails.application.routes.draw do
  resources :artists, :songs
  post 'songs/upload', to: 'SongsControllers#upload'
end
