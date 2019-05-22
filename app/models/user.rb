class User < ActiveRecord::Base
  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(email:     auth.info.email,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         meta:     auth.to_yaml)
    end
    user
  end
end