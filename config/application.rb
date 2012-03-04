require 'rubygems'
require 'pakyow'
require 'dm-migrations'
require 'data_mapper'
require 'dm-tags'
require 'pakyow-auth'

module PakyowApplication
  class Application < Pakyow::Application
    
    def initialize
      super
      DataMapper.finalize
      DataMapper.auto_upgrade!
    end
    
    config.app.default_environment = :development
  
    configure(:development) do
      
      DataMapper.setup(:default, 'sqlite:///Users/ahmet/pakyowworks/test/config/test.sqlite')
      DataMapper::Logger.new("/Users/ahmet/pakyowworks/test/logs/dm.log", :debug)
      DataMapper::Model.raise_on_save_failure = true
      
      app.log = true
      app.dev_mode = true
      app.errors_in_browser = true
      app.static = false  # keep stylesheet. stylesheet bozulmamasi icin false yapiyoruz. yoksa /posts/stylesheets/style.css oluyor ve hatali oluyor
    end
    
    routes do
      default :ApplicationController, :index
      restful 'sessions', :ApplicationController, :session
      restful '/users/new', :ApplicationController, :user
      restful 'birs', :BirsController, :Bir do
        get 'birs', :BirsController, :index
      end
      
      restful 'posts', :PostsController, :Post do
        get 'posts', :PostsController, :index
        post 'posts', :PostsController, :create
        get 'posts/edit/:id', :PostsController, :edit
        post 'posts/:id', :PostsController, :update
      end
      
      get '/login' do
        Auth.new_session
      end

      post '/sessions' do
        Auth.create_session
      end

      get '/logout' do
        Auth.delete_session
        redirect_to! '/'
      end

      post '/users' do
        Auth.create_user
      end
    end
    
    middleware do
      use Rack::Session::Cookie
    end
  end
end
