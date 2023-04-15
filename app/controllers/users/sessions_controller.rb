# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    respond_to do |format|
      format.html { super }
      format.turbo_stream  do
        # When sign in fails devise redirects to new path using turbo_stream format
        # To update the sign in form with errors we use turbo_stream.replace
        locals = { resource: User.new, resource_name: :user }
        render turbo_stream: turbo_stream.replace('sign-in-form', partial: 'devise/sessions/form', locals: locals)
      end
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super do
      # Turbo requires redirects be :see_other (303); so override Devise default (302)
      return redirect_to after_sign_out_path_for(resource_name), status: :see_other
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
