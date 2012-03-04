class ApplicationController
  include Pakyow::Helpers
  def index
  puts "inside index"
   SessionHelper.set_visible_elements(presenter, request)
    if request.session[:user]
     user = User.get(request.session[:user])
     presenter.view.find('#session').append(user.email + " &nbsp;")
    end
  end

  def user
    Auth.new_user
  end
end
