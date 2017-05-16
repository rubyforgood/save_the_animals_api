class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def token
    JWT.encode \
      jwt_token_payload,
      Rails.application.secrets.secret_key_base,
      'HS256'
  end

  def self.authenticate_jwt(jwt)
    decoded_token = JWT.decode jwt, Rails.application.secrets.secret_key_base, true, { :algorithm => 'HS256' }
    find_by(id: decoded_token['id'])
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.valid_password?(password)
      user
    end
  end

  private

  def jwt_token_payload
    @_jwt_token_payload ||= {
      id: id,
      email: email
    }
  end


end
