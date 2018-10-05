Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get 'find_ubs', to: 'clinics#find_ubs_geo'
    end
  end
end
