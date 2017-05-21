require 'rails_helper'

RSpec.describe "Ethograms", type: :request do
  describe "GET /ethograms" do
    it "redirects to the sign in pages" do
      get ethograms_path
      expect(response).to have_http_status(302)
    end
  end
end
