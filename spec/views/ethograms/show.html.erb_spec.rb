require 'rails_helper'

RSpec.describe "ethograms/show", type: :view do
  before(:each) do
    @ethogram = assign(:ethogram, Ethogram.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
