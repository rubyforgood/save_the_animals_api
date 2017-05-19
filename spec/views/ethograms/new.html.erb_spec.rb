require 'rails_helper'

RSpec.describe "ethograms/new", type: :view do
  before(:each) do
    assign(:ethogram, Ethogram.new(
      :name => "MyString"
    ))
  end

  it "renders new ethogram form" do
    render

    assert_select "form[action=?][method=?]", ethograms_path, "post" do

      assert_select "input#ethogram_name[name=?]", "ethogram[name]"
    end
  end
end
