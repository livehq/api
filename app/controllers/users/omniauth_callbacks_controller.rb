class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def oauthio
    @identity = Identity.find_or_create_with_omniauth(auth_hash)
    if @identity.user.present?
      # The identity we found had a user associated with it so let's
      # just log them in here
      render json: {success: true, message: 'Already signed in!', identities: @identity.user.identities}
    else
      # No user associated with the identity so we need to create a new one
      @user = User.create_for_oauthio_oauth(auth_hash, @identity)
      if @user.persisted?
        sign_in @user
        render json: {success: true, message: 'New user created!', identities: @identity.user.identities }
      else
        render json: {success: false, message: 'There was a problem adding user!'}
      end
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end