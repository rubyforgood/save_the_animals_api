require 'rails_helper'

RSpec.describe "ethograms/index", type: :view do
  before(:each) do
    assign(:ethograms, [
      Ethogram.create!(
        :name => "Name"
      ),
      Ethogram.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of ethograms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
