require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'displays the homepage' do
    assign(:num_observations, 0)
    render
  end
end
