require 'rails_helper'

RSpec.describe "ethograms/edit", type: :view do
  before(:each) do
    @ethogram = assign(:ethogram, Ethogram.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit ethogram form" do
    render

    assert_select "form[action=?][method=?]", ethogram_path(@ethogram), "post" do

      assert_select "input#ethogram_name[name=?]", "ethogram[name]"
    end
  end
end
