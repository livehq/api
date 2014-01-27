class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:oauthio, :facebook]

  def self.find_for_oauthio_oauth(auth, signed_in_resource=nil)
    oauth_token = auth.credentials.token
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    if user
      user.oauth_token = oauth_token
      user.save
    else
      user = User.create(
                          #name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20],
                         oauth_token: oauth_token
      )
    end
    user
  end
end
