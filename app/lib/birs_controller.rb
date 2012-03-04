class BirsController
  include Pakyow::Helpers
  
  def index
    Log.puts 'PeopleController::index'
    SessionHelper.set_visible_elements(presenter, request)
    if request.session[:user]
      user = User.get(request.session[:user])
      presenter.view.find('#session').append(user.email + " &nbsp;")
    end

   t = Time.now
    # Create a new record
    p p = Bir.new
    p p.attributes = {
        :firstname => 'John',
        :lastname => 'Doe ' + t.to_s
      }
        # Save it to the database
      p.save
  end

  def show
    Log.puts 'PeopleController::Show'
  end

end