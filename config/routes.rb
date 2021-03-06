Rails.application.routes.draw do
  get 'home' => 'home#index'

  # Resources - Admin
  namespace :admin do
    resources :users do
      collection do
        get 'emprestimos_devolucoes', as: 'emprestimos_devolucoes'
      end
    end
    resources :uos do
      collection do
        get 'update_cidades', as: 'update_cidades'
      end
    end
    resources :roles
    resources :emprestimos
    resources :devolucoes
    resources :exemplares
    resources :reservas
    resources :livros do
      collection do
        get 'index_qnt_exemplares', as: 'index_qnt_exemplares'
      end
    end
    resources :editoras do
      collection do
        get 'estatisticas', as: 'estatisticas'
      end
    end
    resources :assuntos
    resources :autores
  end

  # You can have the root of your site routed with "root"
  devise_for :users
  devise_scope :user do
    root "devise/sessions#new"
  end
end
