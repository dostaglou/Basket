class Users::SessionsController < Devise::SessionsController
  def new
    locals = { resource: User.new, resource_name: :user }
    render turbo_stream: turbo_stream.replace('sign_in_up_modal', partial: 'layouts/shared/sign_in', locals: locals)
  end

  def create
    super do
      redirect_to basket_items_path and return
    end
  end
end
