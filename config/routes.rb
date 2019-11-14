Rails.application.routes.draw do
  resources :tarefas
  root to: 'pages#home'
  devise_for :users
  get '/done/:id', to: 'tarefas#doneTask', as: 'done_tarefa'
  namespace :api do
    namespace :v1 do
      jsonapi_resources :users do
        jsonapi_relationships
      end
      jsonapi_resources :tarefas
      # jsonapi_resources :users
    end
  end
end
