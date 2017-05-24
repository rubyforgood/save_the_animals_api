require 'rails_helper'

RSpec.describe EthogramsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Ethogram. As you add validations to Ethogram, be sure to
  # adjust the attributes here as well.

  login_user

  let(:valid_attributes) do
    {name: 'SCBI'}
  end

  let(:invalid_attributes) do
    {name: ''}
  end

  describe 'GET #index' do
    it 'assigns all ethograms as @ethograms' do
      ethogram = Ethogram.create! valid_attributes
      get :index, params: {}
      expect(assigns(:ethograms)).to eq([ethogram])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested ethogram as @ethogram' do
      ethogram = Ethogram.create! valid_attributes
      get :show, params: {id: ethogram.to_param}
      expect(assigns(:ethogram)).to eq(ethogram)
    end
  end

  describe 'GET #new' do
    it 'assigns a new ethogram as @ethogram' do
      get :new, params: {}
      expect(assigns(:ethogram)).to be_a_new(Ethogram)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested ethogram as @ethogram' do
      ethogram = Ethogram.create! valid_attributes
      get :edit, params: {id: ethogram.to_param}
      expect(assigns(:ethogram)).to eq(ethogram)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Ethogram' do
        expect do
          post :create, params: {ethogram: valid_attributes}
        end.to change(Ethogram, :count).by(1)
      end

      it 'assigns a newly created ethogram as @ethogram' do
        post :create, params: {ethogram: valid_attributes}
        expect(assigns(:ethogram)).to be_a(Ethogram)
        expect(assigns(:ethogram)).to be_persisted
      end

      it 'redirects to the created ethogram' do
        post :create, params: {ethogram: valid_attributes}
        expect(response).to redirect_to(Ethogram.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved ethogram as @ethogram' do
        post :create, params: {ethogram: invalid_attributes}
        expect(assigns(:ethogram)).to be_a_new(Ethogram)
      end

      it "re-renders the 'new' template" do
        post :create, params: {ethogram: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {name: 'outer space'}
      end

      it 'updates the requested ethogram' do
        ethogram = Ethogram.create! valid_attributes
        put :update, params: {id: ethogram.to_param, ethogram: new_attributes}
        ethogram.reload
        expect(ethogram.name).to eq 'outer space'
      end

      it 'assigns the requested ethogram as @ethogram' do
        ethogram = Ethogram.create! valid_attributes
        put :update, params: {id: ethogram.to_param, ethogram: valid_attributes}
        expect(assigns(:ethogram)).to eq(ethogram)
      end

      it 'redirects to the ethogram' do
        ethogram = Ethogram.create! valid_attributes
        put :update, params: {id: ethogram.to_param, ethogram: valid_attributes}
        expect(response).to redirect_to(ethogram)
      end
    end

    context 'with invalid params' do
      it 'assigns the ethogram as @ethogram' do
        ethogram = Ethogram.create! valid_attributes
        put :update, params: {id: ethogram.to_param, ethogram: invalid_attributes}
        expect(assigns(:ethogram)).to eq(ethogram)
      end

      it "re-renders the 'edit' template" do
        ethogram = Ethogram.create! valid_attributes
        put :update, params: {id: ethogram.to_param, ethogram: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested ethogram' do
      ethogram = Ethogram.create! valid_attributes
      expect do
        delete :destroy, params: {id: ethogram.to_param}
      end.to change(Ethogram, :count).by(-1)
    end

    it 'redirects to the ethograms list' do
      ethogram = Ethogram.create! valid_attributes
      delete :destroy, params: {id: ethogram.to_param}
      expect(response).to redirect_to(ethograms_url)
    end
  end
end
