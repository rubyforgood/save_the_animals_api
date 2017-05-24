require 'rails_helper'

describe UsersController do
  login_user

  describe '#index' do
    it 'return all users except current_user' do
      non_current_users = []
      2.times { non_current_users << create(:user) }
      get :index

      expect(assigns(:users)).to eq non_current_users
      expect(assigns(:users)).to_not include controller.current_user
    end
  end

  describe '#destroy' do
    it 'successfully destroys the user' do
      user = create(:user)

      expect do
        delete :destroy, params: {id: user.id}
      end.to change(User, :count).by(-1)
      expect { User.find(user.id) }.to raise_error ActiveRecord::RecordNotFound
    end

    it 'redirects to user index' do
      user = create(:user)

      delete :destroy, params: {id: user.id}

      expect(response).to redirect_to users_path
      expect(flash[:notice]).to eq "#{user.email} was successfully deleted."
    end
  end
end
