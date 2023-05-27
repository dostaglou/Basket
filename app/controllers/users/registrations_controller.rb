class Users::RegistrationsController < Devise::RegistrationsController
  def new
    locals = { resource: User.new, resource_name: :user }
    render turbo_stream: turbo_stream.replace('sign_in_up_modal', partial: 'layouts/shared/sign_up', locals: locals)
  end
end
