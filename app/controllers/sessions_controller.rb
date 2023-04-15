class SessionsController < Devise::SessionsController
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

  def destroy
    super do
      # Turbo requires redirects be :see_other (303); so override Devise default (302)
      return redirect_to after_sign_out_path_for(resource_name), status: :see_other
    end
  end
end
