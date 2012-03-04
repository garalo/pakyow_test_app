class PostsController
  
  include Pakyow::Helpers

    def index
      Log.puts 'PostsController::index'
      SessionHelper.set_visible_elements(presenter, request)
       if request.session[:user]
         user = User.get(request.session[:user])
         presenter.view.find('#session').append(user.email + " &nbsp;")
       end
      # Gets the full collection of stored messages
      posts = Post.all
      # * Takes the html elemetn with id = "post"
      view = presenter.view.find('#post') if posts
      # * Creates a copy for each message
      # * Fills the *author* and *body* spans with 
      # each message namesake attribute value
      view.repeat_for(posts)
    end
    
    def new
       Log.puts 'PostsController::new'
       SessionHelper.set_visible_elements(presenter, request)
       if request.session[:user]
         user = User.get(request.session[:user])
         presenter.view.find('#session').append(user.email + " &nbsp;")
       end
    end
    
    def show
       Log.puts 'PostsController::show'
       SessionHelper.set_visible_elements(presenter, request)
       if request.session[:user]
         user = User.get(request.session[:user])
         presenter.view.find('#session').append(user.email + " &nbsp;")
       end
      posts = Post.all
      # * Takes the html elemetn with id = "message"
      view = presenter.view.find('#post')
      # * Creates a copy for each message
      # * Fills the *author* and *body* spans with 
      # each message namesake attribute value
      view.repeat_for(posts)
    end
    
    def create
      post = Post.new(request.params['post'])
      post.user_id = request.session[:user]
      post.frozen_tag_list = ["dene","dd"]
      begin
        post.save
      rescue DataMapper::SaveFailureError => e
        Log.error "Error saving post user: #{e.to_s} validation: #{post.errors.values.join(', ')}"
      rescue StandardError => e
        Log.error "Got an error trying to save the site post user #{e.to_s}"
      end
      # Redirect to the messages index after
      # the message creation
      app.redirect_to! ('posts')
    end

    def edit
     SessionHelper.set_visible_elements(presenter, request)
       if request.session[:user]
         user = User.get(request.session[:user])
         presenter.view.find('#session').append(user.email + " &nbsp;")
       end
    post = Post.get(request.params[:id].to_i)
    view = presenter.view.find('form')
    action = "/posts/#{post.id}"
    # Sets the edit message form action attribute
    view.attributes.action = action
    # Binds the message to the edit form.
    # This will fill the edit form fields with the
    # current object data.
    view.bind(post)
  end
  
  def update
    post = Post.get(request.params[:id].to_i)
    post.update(request.params['post']) 
    app.redirect_to!('/posts')
  end

end