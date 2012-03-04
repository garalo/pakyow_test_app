class PostBinder < Pakyow::Presenter::Binder

  # Target class to be bounded
  binder_for :post

  def edit_link
    {:href => "/posts/edit/#{bindable.id}"}
  end

end