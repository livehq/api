class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  #def oauthio
  #  # You need to implement the method below in your model (e.g. app/models/user.rb)
  #  @user = User.find_for_oauthio_oauth(auth_hash, current_user)
  #  provider = auth_hash.provider
  #
  #  if @user.persisted?
  #    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #    set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
  #  else
  #    session["devise.#{provider}_data"] = auth_hash
  #    redirect_to new_user_registration_url
  #  end
  #end

  def oauthio
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_oauthio_oauth(auth_hash, current_user)
    provider = auth_hash.provider

    if @user.persisted?
      sign_in @user
      render json: {success: true}
    else
      session["devise.#{provider}_data"] = auth_hash
      #redirect_to new_user_registration_url
      render json: {success: false, message: 'There was a problem adding user!'}
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  #def sign_in(resource_or_scope, *args)
  #  options  = args.extract_options!
  #  scope    = Devise::Mapping.find_scope!(resource_or_scope)
  #  resource = args.last || resource_or_scope
  #  sign_in(scope, resource, options)
  #  #redirect_to after_sign_in_path_for(resource)
  #end
end