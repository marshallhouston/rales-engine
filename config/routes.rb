Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/most_items', to: 'most_sold_items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customers#show'
        get '/:id/merchant', to: 'merchant#show'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
      end

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/revenue', to: 'revenue#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/:id/favorite_customer', to: 'favorite#show'
        get '/most_items', to: 'ranked_items_sold#index'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/customers_with_pending_invoices', to: 'pending_invoices#index'
      end

      namespace :customers do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
      end

      namespace :transactions do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
      end

      resources :invoices do
        get '/index', to: 'invoices#index'
        get '/show', to: 'invoices#show'
      end

      resources :items do
        get '/index', to: 'items#index'
        get '/show', to: 'items#show'
        get '/best_day', to: 'item_best_day#show'
      end

      resources :invoice_items do
        get 'index', to: 'invoice_items#index'
        get 'show', to: 'invoice_items#show'
      end

      resources :merchants do
        get '/index', to: 'merchants#index'
        get '/show', to: 'merchants#show'
        get '/revenue', to: 'merchant_revenue#show'
      end

      resources :transactions do
        get 'index', to: 'transactions#index'
        get 'show', to: 'transactions#show'
      end

      resources :customers do
        get 'index', to: 'customers#index'
        get 'show', to: 'customers#show'
        get '/favorite_merchant', to: 'customer_favorite_merchant#show'
      end
    end
  end

end
