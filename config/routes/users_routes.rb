namespace :users do
  get('/', controller: '/users', action: :index)
  post('/', controller: '/users', action: :create)
end
