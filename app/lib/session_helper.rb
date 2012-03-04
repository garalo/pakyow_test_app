class SessionHelper
  # To change this template use File | Settings | File Templates.

  def self.set_visible_elements(presenter, request)
    if request.session[:user]
      presenter.view.find('#logout_link').add_class('show')
      presenter.view.find('#login_links').remove_class('show')
      presenter.view.find('#login_links').add_class('hide')
      presenter.view.find('#new_user_link').add_class('hide')
    else
      presenter.view.find('#new_user_link').add_class('show')
      presenter.view.find('#logout_link').add_class('hide')
      presenter.view.find('#login_links').remove_class('hide')
      presenter.view.find('#login_links').add_class('show')
    end
  end
end