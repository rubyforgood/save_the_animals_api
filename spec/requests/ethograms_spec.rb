require 'rails_helper'

RSpec.describe "Ethograms", type: :request do
  describe "GET /ethograms" do
    it "works! (now write some real specs)" do
      get ethograms_path
      expect(response).to have_http_status(200)
    end
  end
end
