module ControllerMacros
  def setup_login_user
    let!(:current_user) do
      User.create!(email: 'ruby@forgood.com',
                   password: 'password',
                   password_confirmation: 'password')
    end
  end

  def login_user
    setup_login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end
  end

  def login_api_user
    setup_login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      request.headers['AUTHORIZATION'] = current_user.token
    end
  end
end
