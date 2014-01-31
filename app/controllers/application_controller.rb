class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session


  def authenticate_user_from_token!
    email = params[:email].presence
    user = email && User.find_by_email(email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    authenticated =  user && user.identities.collect {
        |identity| Devise.secure_compare(identity.access_token, params[:access_token]) ? identity : nil
    }.compact.length > 0

    if authenticated
      sign_in user, store: false
    end
  end

end
