require 'rails_helper'

RSpec.describe "Ethograms", type: :request do
  describe "GET /ethograms without signing in" do
    it "works! (now write some real specs)" do
      get ethograms_path
      expect(response).to have_http_status(302)
    end
  end
end
